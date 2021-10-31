# Docker images
A repository for Forrest's data science docker images

## Build container
`docker build -f Jupyter -t jupyter .`

## Run container
Format: docker run -p LOCAL_PORT:CONTAINER_PORT (8888) --name CONTAINER_NAME IMAGE
`docker run --rm -p 2222:8888 --name test_jupyter jupyter`
`docker run --rm -p 2222:8888 -v /home/fw/data/test_data:/tmp/data --name test_gis gis`

## Remove all old components
`docker system prune`

## Export your conda environment
`conda env export --from-history`