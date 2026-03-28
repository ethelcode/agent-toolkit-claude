# Backend API Project Instructions

@base.md

## API Design
- RESTful 원칙을 따르되 실용성 우선
- 응답 형식 일관성 유지 (envelope pattern 등 프로젝트 컨벤션)
- 적절한 HTTP 상태 코드 사용
- 페이지네이션, 필터링은 쿼리 파라미터로

## Database
- 마이그레이션 파일로 스키마 변경 관리
- N+1 쿼리 주의
- 인덱스 필요성 항상 고려
- 트랜잭션은 최소 범위로

## Authentication & Authorization
- 인증/인가 로직은 미들웨어로 분리
- JWT 토큰 만료 시간 적절히 설정
- 권한 체크는 엔드포인트 레벨에서

## Error Handling
- 전역 에러 핸들러 사용
- 에러 응답 형식 통일
- 스택 트레이스는 프로덕션에서 노출 금지

## Logging
- 구조화된 로깅 (JSON 형식)
- 요청 ID로 추적 가능하게
- 민감 정보는 로그에서 마스킹
