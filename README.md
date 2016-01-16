# About this repo

This repository provides an Docker image to run [namics/generator-nitro](https://github.com/namics/generator-nitro) in production mode within a Docker container.

# How to use this image.

Currently I doesn't have pushed this image on the Docker Hub, and for this reason you have to build it on your own:
```
docker build -t phaldan/generator-nitro git://github.com/phaldan/docker-nitro.git#master
```

Next step would be to start a new container with this image:
```
docker run -d -v "$PWD":/home/yeoman/nitro -p 8080:8080 -e NITRO_PRE=scss phaldan/generator-nitro
```

If not exist, the container creates a new nitro project in `/home/yeoman/nitro`.
