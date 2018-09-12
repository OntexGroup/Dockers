# Dockers
All docker images of the platform

# Build image
docker build -t base ./SrvBase

# Run Image
docker run -p 80:4000 base

# Stop & delete Images
docker container rm $(docker container ls -a -q); docker image rm $(docker image ls -a -q)