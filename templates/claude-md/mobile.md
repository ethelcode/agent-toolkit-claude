# Mobile Project Instructions

@base.md

## Architecture
- 프로젝트에서 사용 중인 아키텍처 패턴 따름 (MVVM, Clean Architecture 등)
- UI 로직과 비즈니스 로직 분리
- 의존성 주입 활용

## UI/UX
- 플랫폼 디자인 가이드라인 준수 (HIG / Material Design)
- 다크 모드 지원
- 다양한 화면 크기 대응
- 애니메이션은 60fps 유지

## Performance
- 메인 스레드 블로킹 금지
- 이미지 캐싱 활용
- 메모리 누수 주의 (특히 클로저, 리스너)
- 앱 시작 시간 최적화

## Network
- 오프라인 상태 처리
- API 호출 시 로딩/에러 상태 표시
- 적절한 캐싱 전략

## Testing
- UI 테스트와 유닛 테스트 분리
- 스냅샷 테스트 활용
