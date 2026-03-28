---
name: check-latest
description: Claude Code, Agent SDK, API의 최신 기능과 릴리즈 노트를 확인한다
allowed-tools: Read, Bash, WebSearch, WebFetch, Agent
---

# Check Latest Claude Features

Claude Code와 관련 도구의 최신 기능을 확인하고 현재 프로젝트에 적용 가능한 것을 추천한다.

## 실행 단계

### 1. 최신 정보 수집
다음 소스에서 최신 정보를 수집한다:

**Claude Code:**
- `claude --version`으로 현재 버전 확인
- Claude Code 공식 릴리즈 노트 확인: https://docs.anthropic.com/en/docs/claude-code/changelog
- 최근 추가된 기능, 슬래시 커맨드, hooks, 설정 옵션 파악

**Claude API & Models:**
- 최신 모델 정보 확인 (Opus, Sonnet, Haiku 버전)
- 새로운 API 기능 (tool use, vision, extended thinking 등)
- https://docs.anthropic.com/en/docs/about-claude/models 확인

**Agent SDK:**
- claude-agent-sdk 최신 버전 확인
- 새로운 기능 및 변경사항

**MCP (Model Context Protocol):**
- 새로운 공식 MCP 서버
- MCP 프로토콜 업데이트

### 2. 현재 프로젝트 상태 비교
- 현재 프로젝트의 Claude 설정 확인 (`.claude/`, `CLAUDE.md`, `.mcp.json`)
- 현재 사용 중인 기능 vs 사용 가능하지만 미활용 기능 비교

### 3. 추천 사항 정리
다음 형식으로 추천 사항을 정리한다:

```
## 현재 버전
- Claude Code: vX.X.X
- 최신 버전: vX.X.X

## 새로운 기능 (최근 N개월)
1. [기능명] - 설명 - 적용 가능 여부

## 현재 프로젝트에 추천
1. [기능명] - 왜 유용한지 - 적용 방법

## 미활용 기능
1. [기능명] - 설명
```

### 4. 적용 제안
사용자가 원하면 `/apply-best-practices`로 바로 적용할 수 있음을 안내한다.
