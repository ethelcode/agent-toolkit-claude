# Fullstack Project Instructions

@base.md

## Monorepo Structure
- 프론트엔드와 백엔드 코드 경계를 명확히
- 공유 타입/스키마는 shared 디렉토리에서 관리
- 각 패키지의 의존성은 독립적으로 관리

## Frontend
- 컴포넌트는 함수형으로 작성
- API 호출은 추상화 레이어를 통해
- 타입 안전한 API 클라이언트 사용 (tRPC, GraphQL codegen 등)

## Backend
- API 엔드포인트는 일관된 형식
- 입력 검증은 스키마 기반 (Zod, Joi 등)
- 데이터베이스 접근은 ORM/쿼리 빌더를 통해

## Type Safety
- 프론트-백엔드 간 타입 공유
- API 응답 타입 자동 생성 권장
- any 타입 사용 최소화

## Development
- 로컬 개발 환경은 한 명령으로 시작 가능하게
- 환경 변수는 .env.example로 문서화
- Docker Compose로 외부 서비스 관리
