# Docker images
A repository for Forrest's data science docker images

## Build container
docker build --build-arg YML=jupyter.yml -t jupyter .

## Container and machine-specific run commands
Format: docker run (--rm) -p LOCAL_PORT:CONTAINER_PORT (8888) -v DATA_LOC:MOUNT_LOC --name CONTAINER_NAME IMAGE

These assume a specific directory structure so **don't assume they'll work on your computer**.

### Autorift:
docker run -p 2001:8888 -v /home/fw/work/pixel/pixeloffset_mintpy:/home/micromamba/work forrestwilliams/autorift

## Remove all old components
docker system prune

## Export your conda environment
conda env export --from-history


docker build --build-arg YML=gis.yml -t forrestwilliams/gis:1.04 .