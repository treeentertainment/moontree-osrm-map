FROM osrm/osrm-backend

# PBF 파일 추가 (예: South Korea 데이터)
ADD south-korea-latest.osm.pbf /data/map.pbf

# OSRM 데이터 준비
RUN osrm-extract -p /opt/car.lua /data/map.pbf
RUN osrm-contract /data/map.osrm

# OSRM 서버 시작
CMD ["osrm-routed", "--algorithm", "mld", "/data/map.osrm"]
