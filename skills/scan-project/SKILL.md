---
name: scan-project
description: 프로젝트를 분석하여 최적의 Claude 설정을 추천한다
allowed-tools: Read, Bash, Glob, Grep, Agent
---

# Scan Project

프로젝트의 기술 스택, 구조, 워크플로우를 분석하여 최적의 Claude Code 설정을 추천한다. 파일을 수정하지 않고 분석 리포트만 생성한다.

## 실행 단계

### 1. 기술 스택 분석

**언어 & 프레임워크:**
- 의존성 파일 확인: package.json, requirements.txt, go.mod, Cargo.toml, Gemfile, build.gradle, Podfile, pubspec.yaml
- 주요 프레임워크 식별
- 언어 버전 확인

**빌드 & 도구:**
- 빌드 시스템: webpack, vite, esbuild, gradle, cmake 등
- 린터/포맷터: eslint, prettier, black, golangci-lint 등
- 테스트 프레임워크: jest, pytest, go test 등
- CI/CD: GitHub Actions, GitLab CI 등

**인프라:**
- Docker/docker-compose 확인
- IaC 파일: terraform, pulumi 등
- 클라우드 서비스 설정

### 2. 프로젝트 구조 분석

- 디렉토리 구조와 네이밍 패턴
- 모노레포 여부
- 코드 규모 (파일 수, 주요 디렉토리 크기)
- 기존 문서화 수준

### 3. 현재 Claude 설정 분석

- 기존 CLAUDE.md 유무 및 품질
- .claude/ 디렉토리 내용물
- .mcp.json 설정
- 활용 중인 hooks, skills, agents

### 4. 추천 리포트 생성

```markdown
# 프로젝트 분석 리포트

## 기술 스택 요약
- 언어: ...
- 프레임워크: ...
- 빌드: ...
- 테스트: ...

## 현재 Claude 설정 상태
- [ ] CLAUDE.md: 있음/없음
- [ ] Rules: 있음/없음
- [ ] Hooks: 있음/없음
- [ ] MCP: 있음/없음

## 추천 사항

### 즉시 적용 (Quick Wins)
1. ...

### 권장 적용
1. ...

### 선택 적용 (Advanced)
1. ...

## 적용 방법
`/setup-project` 또는 `/apply-best-practices` 실행
```
