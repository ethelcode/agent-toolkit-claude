# Data Science Project Instructions

@base.md

## Notebooks
- 노트북은 탐색용, 프로덕션 코드는 .py 파일로
- 셀 실행 순서에 의존하지 않는 구조
- 노트북 상단에 목적과 결론 요약

## Data
- 원본 데이터는 절대 수정 금지 (raw → processed 파이프라인)
- 대용량 데이터 파일은 git에 포함하지 않음
- 데이터 경로는 설정 파일로 관리

## Code Quality
- pandas 체이닝 시 가독성 유지
- 매직 넘버 대신 명명된 상수 사용
- 재현 가능한 랜덤 시드 설정

## Visualization
- 차트에 제목, 축 레이블, 범례 포함
- 색상은 색각 이상 고려
- 해상도 적절히 설정

## Model
- 실험은 버전 관리 (MLflow, W&B 등)
- 하이퍼파라미터는 설정 파일로 관리
- 모델 성능 메트릭 기록
