---
name: setup-project
description: 현재 프로젝트에 Claude Code 최적 설정을 초기화한다
allowed-tools: Read, Write, Edit, Bash, Glob, Grep, Agent, WebSearch, WebFetch
---

# Setup Project

현재 프로젝트를 분석하고 최적의 Claude Code 설정을 적용한다.

## 실행 단계

### 1. 프로젝트 분석
먼저 프로젝트를 분석해서 기술 스택을 파악한다:

- `package.json`, `requirements.txt`, `Cargo.toml`, `go.mod`, `Podfile`, `pubspec.yaml` 등 의존성 파일 확인
- 디렉토리 구조 파악 (`src/`, `app/`, `lib/`, `test/` 등)
- 기존 설정 파일 확인 (`.eslintrc`, `tsconfig.json`, `pyproject.toml` 등)
- 기존 `.claude/` 디렉토리가 있는지 확인
- `.editorconfig`, `prettier`, `eslint` 등 코드 스타일 설정 확인

### 2. 프로젝트 타입 판별
분석 결과를 기반으로 프로젝트 타입을 판별한다:
- web-frontend: React, Vue, Svelte, Angular 등
- web-backend: Express, FastAPI, Django, Go 서버 등
- mobile: iOS(Swift), Android(Kotlin), Flutter, React Native
- data-science: Jupyter, pandas, scikit-learn, PyTorch 등
- fullstack: 프론트+백엔드 포함

### 3. 설정 적용
사용자에게 분석 결과를 보고하고 확인을 받은 후:

1. **CLAUDE.md 생성**: 프로젝트 타입에 맞는 템플릿을 기반으로 프로젝트 특성에 맞게 커스터마이징
2. **`.claude/rules/` 생성**: 코드 스타일, 테스트, 보안, git 규칙 파일
3. **`.claude/settings.json` 생성**: 프로젝트에 맞는 permissions, hooks 설정
4. **`.gitignore` 업데이트**: `.claude/settings.local.json` 추가

### 4. 결과 보고
적용된 설정을 요약해서 보고한다.

## 주의사항
- 기존 CLAUDE.md가 있으면 덮어쓰지 않고 병합을 제안
- 사용자의 확인 없이 파일을 생성하지 않음
- 프로젝트의 기존 컨벤션을 최대한 존중
