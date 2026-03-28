# Frontend Project Instructions

@base.md

## Framework
- 컴포넌트는 함수형으로 작성
- 상태 관리는 프로젝트에서 사용 중인 도구를 따름
- CSS-in-JS보다 CSS Modules 또는 Tailwind 선호 (프로젝트 컨벤션 우선)

## Component Structure
- 컴포넌트 파일 하나에 하나의 exported 컴포넌트
- Props는 타입/인터페이스로 명시
- 비즈니스 로직은 커스텀 훅으로 분리

## Performance
- 불필요한 리렌더링 방지
- 큰 리스트는 가상화 고려
- 이미지는 lazy loading 적용
- 번들 사이즈를 의식하며 코드 작성

## Accessibility
- 시맨틱 HTML 사용
- aria 속성 적절히 활용
- 키보드 네비게이션 지원

## Testing
- 컴포넌트 테스트는 사용자 행동 기반으로 작성
- 구현 디테일이 아닌 결과를 테스트
