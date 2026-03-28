---
name: apply-best-practices
description: Claude Code 모범 사례를 현재 프로젝트에 적용한다
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, Agent
---

# Apply Best Practices

현재 프로젝트의 Claude Code 설정을 분석하고 모범 사례를 적용한다.

## 실행 단계

### 1. 현재 설정 감사
기존 Claude 설정을 점검한다:

- `CLAUDE.md` 내용 분석 — 누락된 섹션, 모호한 지시, 충돌하는 규칙
- `.claude/rules/` 파일들 점검
- `.claude/settings.json` 설정 점검
- `.claude/settings.local.json` 확인
- hooks 설정 확인
- `.mcp.json` MCP 서버 설정 확인
- 커스텀 skills, agents 확인

### 2. 개선 사항 도출
각 영역에서 개선점을 찾는다:

**CLAUDE.md 최적화:**
- 200줄 이내로 유지되는지
- 구체적이고 실행 가능한 지시인지
- 프로젝트 특성에 맞는 규칙이 있는지
- @import 활용으로 모듈화 가능한지

**Hooks 추천:**
- PostToolUse: 자동 포맷팅 (prettier, black 등)
- PreToolUse: 위험한 명령 차단
- Stop: 완료 알림

**MCP 서버 추천:**
- GitHub MCP — PR/이슈 관리가 필요한 프로젝트
- PostgreSQL/MySQL — DB 접근이 필요한 프로젝트
- Playwright — 웹 테스팅이 필요한 프로젝트

**Settings 최적화:**
- 적절한 permissions 설정
- 프로젝트에 맞는 effort 레벨
- sandbox 설정

**Subagent 추천:**
- 코드 리뷰 에이전트
- 테스트 실행 에이전트
- 프로젝트 특성에 맞는 전문 에이전트

### 3. 적용
사용자에게 개선 사항 목록을 보여주고, 승인된 항목만 적용한다.
각 변경 사항은 개별적으로 설명하고 확인을 받는다.

### 4. 검증
적용 후 설정이 올바르게 작동하는지 확인한다.
