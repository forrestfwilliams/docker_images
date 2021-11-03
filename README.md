# Docker images
A repository for Forrest's data science docker images

## Build container
`docker build --build-arg YML=jupyter.yml -t jupyter .`

## Run container
Format: docker run (--rm) -p LOCAL_PORT:CONTAINER_PORT (8888) -v DATA_LOC:MOUNT_LOC --name CONTAINER_NAME IMAGE

`docker run --rm -p 2002:8888 --name test_jupyter jupyter`

`docker run --rm -p 2002:8888 -v /home/fw/data/test_data:/tmp/data --name test_gis gis`

## Remove all old components
`docker system prune`

## Export your conda environment
`conda env export --from-history`