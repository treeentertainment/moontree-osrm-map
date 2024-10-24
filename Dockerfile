# Use the latest OSRM backend image
FROM osrm/osrm-backend:latest

# Set working directory
WORKDIR /data

# Download the OSM PBF file (for South Korea in this case)
RUN wget -O south-korea-latest.osm.pbf https://download.geofabrik.de/asia/south-korea-latest.osm.pbf

# Extract, partition, and customize the OSM data for OSRM
RUN osrm-extract -p /opt/car.lua south-korea-latest.osm.pbf
RUN osrm-partition south-korea-latest.osrm
RUN osrm-customize south-korea-latest.osrm

# Expose port 5000 for OSRM server
EXPOSE 5000

# Start OSRM routing server
CMD ["osrm-routed", "--algorithm", "mld", "south-korea-latest.osrm"]
