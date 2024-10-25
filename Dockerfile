FROM osrm/osrm-backend

# Copy the PBF file (make sure it's in your repository or use a URL)
COPY south-korea-latest.osm.pbf /data/map.pbf

# OSRM data preparation commands
RUN osrm-extract -p /opt/car.lua /data/map.pbf
RUN osrm-contract /data/map.osrm

# Start the OSRM server
CMD ["osrm-routed", "--algorithm", "mld", "/data/map.osrm"]
