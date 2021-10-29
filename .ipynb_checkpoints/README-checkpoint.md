# Docker images
A repository for Forrest's data science docker images

## Build container
`docker build -f Jupyter -t juypter .`

## Run container
Format: docker run -p LOCAL_PORT:CONTAINER_PORT (8888) --name CONTAINER_NAME IMAGE
`docker run --rm -p 2001:8888 --name test_jupyter jupyter`

## Remove all old components
`docker system prune`

## Export your conda environment
`conda env export --from-history`