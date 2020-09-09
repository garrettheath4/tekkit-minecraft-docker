# tekkit-classic-docker
[![Docker Build](https://img.shields.io/docker/cloud/build/garrettheath4/tekkit-classic.svg)](https://hub.docker.com/r/garrettheath4/tekkit-classic)

Tekkit Classic v3.1.2 Docker container.


## Build

To build the container:

1. Install git for your distro if you haven't already.
1. Run `git clone https://github.com/garrettheath4/tekkit-classic-docker.git`
1. Ensure you have Docker set up right so you can use it without `sudo` or root
   (not really necessary; just a preference)
1. Run `docker build --tag tekkit-classic:latest tekkit-classic-docker`


## Run

To just get it up and running, replace `<YOUR_MINECRAFT_ACCOUNT_NAME>` with
your Minecraft player name, and run the command:

```shell
docker run --detach \
    -p 25565:25565 \
    -e SERVER_OP=<YOUR_MINECRAFT_ACCOUNT_NAME> \
    --name=tekkit-server \
    --restart=unless-stopped \
    tekkit-classic:latest
```

By default, it does store its data in a volume so it's safe to rebuild the
container if you need to, and re-attach the previous volume to `/minecraft`.

Replace `/VOLUMES/` with the path to your volumes storage location. You can
also include a volume for `plugins` as well for easy access.

```shell
docker run --detach \
    -v /VOLUMES/world:/minecraft/world \
    -v /VOLUMES/world_nether:/minecraft/world_nether \
    -v /VOLUMES/world_the_end:/minecraft/world_the_end \
    -v /VOLUMES/plugins:/minecraft/plugins \
    -p 25565:25565 \
    -e SERVER_OP=<YOUR_MINECRAFT_ACCOUNT_NAME> \
    --name=tekkit-server \
    --restart=unless-stopped \
    tekkit-classic:latest
```


### Debug

To run the _tekkit-server_ Docker container interactively, use the `-it`
argument instead of `-d` in the `docker run ...` command above.

To attach to a running _tekkit-server_ Docker container, run:

    docker exec -it tekkit-server /bin/bash


<!-- vim: set textwidth=80 -->
