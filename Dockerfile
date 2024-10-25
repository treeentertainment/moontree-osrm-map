# OSRM 기본 이미지 사용
FROM osrm/osrm-backend:latest

# 필요한 파일을 Docker 이미지로 복사
# .pbf 파일이 프로젝트 루트에 있으므로 경로를 조정합니다
COPY ./korea-latest.osm.pbf /data/korea-latest.osm.pbf
COPY ./profile.lua /opt/profile.lua

# PBF 파일에서 OSRM 데이터 추출 및 계약
RUN osrm-extract -p /opt/profile.lua /data/korea-latest.osm.pbf
RUN osrm-contract /data/korea-latest.osrm

# OSRM 서버 실행 명령
CMD ["osrm-routed", "/data/korea-latest.osrm"]
