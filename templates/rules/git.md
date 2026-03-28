## Git Rules

- 커밋 메시지: `type(scope): 설명` (conventional commits)
- 타입: feat, fix, refactor, docs, test, chore, ci, perf, style
- 커밋은 작고 원자적으로 — 하나의 논리적 변경만
- WIP 커밋은 push 전에 squash
- 브랜치명: `type/short-description` (예: feat/user-auth, fix/login-error)
- main/master 직접 push 금지
- .gitignore에 OS/IDE/빌드 산출물 포함
- 대용량 파일은 Git LFS 사용
