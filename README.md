# agent-toolkit-claude

Claude Code 최신 기능을 프로젝트에 빠르게 적용하기 위한 범용 셋업 킷.

## 왜 필요한가?

매번 새 프로젝트에서 Claude Code 설정을 처음부터 하거나, 최신 기능을 확인하고 적용하는 과정이 반복된다. 이 킷은 그 과정을 자동화한다.

## 구성

```
agent-toolkit-claude/
├── templates/           # 프로젝트에 복사할 템플릿
│   ├── claude-md/       # CLAUDE.md 프로젝트 타입별 템플릿
│   ├── rules/           # .claude/rules/ 규칙 파일
│   └── settings/        # settings.json 템플릿
├── skills/              # 커스텀 슬래시 커맨드
│   ├── setup-project/   # /setup-project - 프로젝트 초기 셋업
│   ├── check-latest/    # /check-latest - 최신 기능 확인
│   ├── apply-best-practices/ # /apply-best-practices - 모범 사례 적용
│   └── scan-project/    # /scan-project - 프로젝트 분석
├── agents/              # 커스텀 서브에이전트
├── hooks/               # Hook 설정 템플릿
├── scripts/             # 설치 및 유틸리티 스크립트
│   └── install.sh       # 다른 프로젝트에 킷 적용
└── README.md
```

## 빠른 시작

### 1. 킷 설치 (글로벌 - 모든 프로젝트에서 사용)

```bash
git clone https://github.com/ethel-dev/agent-toolkit-claude.git
cd agent-toolkit-claude
./scripts/install.sh --global
```

Skills와 Agents가 `~/.claude/`에 설치되어 어떤 프로젝트에서든 사용 가능.

### 2. 특정 프로젝트에 적용

```bash
./scripts/install.sh --project /path/to/your/project
```

또는 Claude Code 안에서:

```
/setup-project
```

### 3. 최신 기능 확인

```
/check-latest
```

## 포함된 Skills (슬래시 커맨드)

| 커맨드 | 설명 |
|--------|------|
| `/setup-project` | 현재 프로젝트에 Claude Code 설정 초기화 |
| `/check-latest` | Claude Code/API/Agent SDK 최신 기능 확인 |
| `/apply-best-practices` | 프로젝트에 모범 사례 적용 |
| `/scan-project` | 프로젝트 분석 후 최적 Claude 설정 추천 |

## 포함된 Agents (서브에이전트)

| 에이전트 | 설명 |
|----------|------|
| `tech-scanner` | 프로젝트 기술 스택 분석 및 Claude 설정 추천 |
| `config-optimizer` | 기존 Claude 설정을 분석하고 최적화 제안 |

## 포함된 Hooks

| Hook | 설명 |
|------|------|
| `safety-guard` | 위험한 명령 실행 전 차단 |
| `auto-format` | 파일 수정 후 자동 포맷팅 |
| `quality-check` | 코드 변경 후 품질 체크 |

## 포함된 Templates

### CLAUDE.md 템플릿
- `base.md` - 모든 프로젝트 공통 기본 규칙
- `web-frontend.md` - React/Vue/Svelte 등 프론트엔드
- `web-backend.md` - Node.js/Python/Go 등 백엔드 API
- `mobile.md` - iOS/Android/Flutter
- `data-science.md` - Python 데이터 분석/ML
- `fullstack.md` - 풀스택 프로젝트

### Rules 템플릿
- `code-style.md` - 코드 스타일 규칙
- `testing.md` - 테스트 작성 규칙
- `security.md` - 보안 규칙
- `git.md` - Git 커밋/브랜치 규칙

## 커스터마이징

각 템플릿과 설정은 프로젝트에 복사된 후 자유롭게 수정할 수 있다. 킷은 시작점을 제공할 뿐, 프로젝트 특성에 맞게 조정하는 것을 권장한다.

## 업데이트

```bash
cd /path/to/agent-toolkit-claude
git pull
./scripts/install.sh --global  # 글로벌 스킬/에이전트 업데이트
```

## License

MIT
