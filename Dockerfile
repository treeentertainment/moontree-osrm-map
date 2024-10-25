# OSRM 베이스 이미지 사용
FROM osrm/osrm-backend:latest

# GitHub 리포지토리에서 복사한 .pbf 파일을 컨테이너로 복사
COPY korea-latest.osm.pbf /data/korea-latest.osm.pbf

# OSRM 프로파일 복사 (기본은 car.lua를 사용하지만 필요에 따라 custom.lua 사용 가능)
COPY profile.lua /opt/profile.lua

# PBF 파일에서 OSRM 데이터 추출 및 계약
RUN osrm-extract -p /opt/profile.lua /data/korea-latest.osm.pbf
RUN osrm-contract /data/korea-latest.osrm

# OSRM 서버 실행
CMD ["osrm-routed", "/data/korea-latest.osrm"]
