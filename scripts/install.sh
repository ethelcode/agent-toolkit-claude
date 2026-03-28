#!/bin/bash
set -euo pipefail

# agent-toolkit-claude installer
# Claude Code 최신 기능을 프로젝트에 적용하는 킷

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
KIT_DIR="$(dirname "$SCRIPT_DIR")"

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

info()  { echo -e "${CYAN}[info]${NC} $1"; }
ok()    { echo -e "${GREEN}[ok]${NC} $1"; }
warn()  { echo -e "${YELLOW}[warn]${NC} $1"; }
error() { echo -e "${RED}[error]${NC} $1"; }

usage() {
    cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Options:
  --global              글로벌 설치 (skills, agents를 ~/.claude/에 설치)
  --project <path>      특정 프로젝트에 설정 적용
  --skills-only         skills만 설치
  --agents-only         agents만 설치
  --templates-only      템플릿만 프로젝트에 복사 (--project와 함께 사용)
  --dry-run             실제 파일을 생성하지 않고 계획만 출력
  -h, --help            도움말 출력

Examples:
  $(basename "$0") --global                          # 글로벌 설치
  $(basename "$0") --project ~/my-app                # 프로젝트에 적용
  $(basename "$0") --global --project ~/my-app       # 둘 다
EOF
}

GLOBAL=false
PROJECT_PATH=""
SKILLS_ONLY=false
AGENTS_ONLY=false
TEMPLATES_ONLY=false
DRY_RUN=false

while [[ $# -gt 0 ]]; do
    case $1 in
        --global)       GLOBAL=true; shift ;;
        --project)      [[ -z "${2:-}" ]] && { error "--project 옵션에 경로가 필요합니다."; usage; exit 1; }; PROJECT_PATH="$2"; shift 2 ;;
        --skills-only)  SKILLS_ONLY=true; shift ;;
        --agents-only)  AGENTS_ONLY=true; shift ;;
        --templates-only) TEMPLATES_ONLY=true; shift ;;
        --dry-run)      DRY_RUN=true; shift ;;
        -h|--help)      usage; exit 0 ;;
        *)              error "Unknown option: $1"; usage; exit 1 ;;
    esac
done

if [[ "$GLOBAL" == false && -z "$PROJECT_PATH" ]]; then
    error "옵션을 지정해주세요. --global 또는 --project <path>"
    usage
    exit 1
fi

safe_copy() {
    local src="$1" dst="$2"
    if [[ "$DRY_RUN" == true ]]; then
        info "[dry-run] $src → $dst"
        return
    fi
    mkdir -p "$(dirname "$dst")"
    if [[ -f "$dst" ]]; then
        warn "이미 존재: $dst (건너뜀)"
    else
        cp "$src" "$dst"
        ok "생성: $dst"
    fi
}

safe_copy_dir() {
    local src_dir="$1" dst_dir="$2"
    if [[ ! -d "$src_dir" ]]; then
        warn "소스 디렉토리 없음: $src_dir"
        return
    fi
    find "$src_dir" -type f | while read -r file; do
        local rel="${file#$src_dir/}"
        safe_copy "$file" "$dst_dir/$rel"
    done
}

# --- Global Install ---
install_global() {
    info "글로벌 설치 시작 (~/.claude/)"
    local claude_dir="$HOME/.claude"
    mkdir -p "$claude_dir"

    # Skills 설치
    if [[ "$AGENTS_ONLY" == false ]]; then
        info "Skills 설치 중..."
        for skill_dir in "$KIT_DIR"/skills/*/; do
            local skill_name
            skill_name="$(basename "$skill_dir")"
            safe_copy_dir "$skill_dir" "$claude_dir/skills/$skill_name"
        done
    fi

    # Agents 설치
    if [[ "$SKILLS_ONLY" == false ]]; then
        info "Agents 설치 중..."
        for agent_file in "$KIT_DIR"/agents/*.md; do
            [[ -f "$agent_file" ]] || continue
            local agent_name
            agent_name="$(basename "$agent_file")"
            safe_copy "$agent_file" "$claude_dir/agents/$agent_name"
        done
    fi

    echo ""
    ok "글로벌 설치 완료!"
    info "설치된 위치:"
    info "  Skills: $claude_dir/skills/"
    info "  Agents: $claude_dir/agents/"
    echo ""
    info "사용 가능한 커맨드:"
    info "  /setup-project        프로젝트 초기 셋업"
    info "  /check-latest         최신 기능 확인"
    info "  /apply-best-practices 모범 사례 적용"
    info "  /scan-project         프로젝트 분석"
}

# --- Project Install ---
install_project() {
    local target="$1"

    if [[ ! -d "$target" ]]; then
        error "프로젝트 경로가 존재하지 않음: $target"
        exit 1
    fi

    info "프로젝트 설정 적용: $target"

    # .claude 디렉토리 생성
    mkdir -p "$target/.claude/rules"

    if [[ "$TEMPLATES_ONLY" == true ]]; then
        info "템플릿만 복사합니다..."
        safe_copy_dir "$KIT_DIR/templates/claude-md" "$target/.claude/templates/claude-md"
        safe_copy_dir "$KIT_DIR/templates/rules" "$target/.claude/templates/rules"
        safe_copy_dir "$KIT_DIR/templates/settings" "$target/.claude/templates/settings"
        echo ""
        ok "템플릿 복사 완료!"
        info "  $target/.claude/templates/"
        return
    fi

    # CLAUDE.md (base 템플릿)
    safe_copy "$KIT_DIR/templates/claude-md/base.md" "$target/CLAUDE.md"

    # Rules 복사
    info "Rules 복사 중..."
    safe_copy_dir "$KIT_DIR/templates/rules" "$target/.claude/rules"

    # Settings 복사
    safe_copy "$KIT_DIR/templates/settings/default.json" "$target/.claude/settings.json"

    # .gitignore에 settings.local.json 추가
    if [[ "$DRY_RUN" == false ]]; then
        local gitignore="$target/.gitignore"
        if [[ -f "$gitignore" ]]; then
            if ! grep -q "settings.local.json" "$gitignore" 2>/dev/null; then
                echo -e "\n# Claude Code local settings\n.claude/settings.local.json" >> "$gitignore"
                ok ".gitignore에 settings.local.json 추가"
            fi
        else
            cat > "$gitignore" <<'GITIGNORE'
# Claude Code local settings
.claude/settings.local.json
GITIGNORE
            ok ".gitignore 생성"
        fi
    fi

    echo ""
    ok "프로젝트 설정 완료!"
    info "생성된 파일:"
    info "  $target/CLAUDE.md"
    info "  $target/.claude/rules/"
    info "  $target/.claude/settings.json"
    echo ""
    info "다음 단계:"
    info "  1. CLAUDE.md를 프로젝트에 맞게 수정"
    info "  2. Claude Code에서 /scan-project 실행하여 추가 추천 확인"
    info "  3. /apply-best-practices로 고급 설정 적용"
}

# --- Main ---
echo ""
echo "  ╔══════════════════════════════════╗"
echo "  ║   agent-toolkit-claude installer ║"
echo "  ╚══════════════════════════════════╝"
echo ""

if [[ "$GLOBAL" == true ]]; then
    install_global
fi

if [[ -n "$PROJECT_PATH" ]]; then
    [[ "$GLOBAL" == true ]] && echo ""
    install_project "$PROJECT_PATH"
fi

echo ""
info "완료!"
