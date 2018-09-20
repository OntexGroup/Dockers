# Dockers
All docker images of the platform

# Build image
docker build -t base ./SrvBase
docker build -t module ./ModuleBase

# Run Image
docker run -p 4000:80 base

# Stop & delete Images
docker container rm $(docker container ls -a -q); docker image rm $(docker image ls -a -q)

# Environement de DEV
docker run -it -p 4000:80 --mount type=bind,source=<your_path>,target=/var/www/html/C2M module