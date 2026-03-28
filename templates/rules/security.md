## Security Rules

- 사용자 입력은 항상 검증하고 이스케이프
- SQL 쿼리에 문자열 결합 금지, 파라미터 바인딩 사용
- HTML 출력 시 XSS 방지 이스케이프
- 비밀번호는 bcrypt/argon2로 해싱
- API 키, 비밀번호 등은 환경 변수로 관리
- CORS 설정은 필요한 origin만 허용
- 파일 업로드 시 타입/크기 검증
- 디펜던시 취약점 정기 점검 (npm audit, pip audit 등)
- 에러 메시지에 내부 구현 정보 노출 금지
