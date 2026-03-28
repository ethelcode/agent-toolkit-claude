# Project Instructions

## Language
- 사용자와의 대화는 한국어로 진행
- 코드, 커밋 메시지, PR은 영어로 작성

## Code Style
- 간결하고 읽기 쉬운 코드 우선
- 불필요한 주석 금지 — 코드가 스스로 설명하도록
- 사용하지 않는 코드는 주석 처리가 아닌 삭제
- 함수는 한 가지 일만 수행

## Git
- 커밋 메시지는 conventional commits 형식: `type(scope): description`
- 타입: feat, fix, refactor, docs, test, chore, ci
- 한 커밋에 한 가지 변경만

## Testing
- 새 기능에는 반드시 테스트 작성
- 버그 수정 시 재현 테스트 먼저 작성

## Security
- .env, credentials, secrets 파일은 절대 커밋 금지
- 사용자 입력은 항상 검증
- SQL 쿼리에 파라미터 바인딩 사용

## Error Handling
- 에러는 삼키지 말고 적절히 처리
- 사용자에게 보여줄 에러와 내부 에러 구분

## Dependencies
- 새 의존성 추가 전 기존 의존성으로 해결 가능한지 먼저 확인
- 가능하면 표준 라이브러리 사용
