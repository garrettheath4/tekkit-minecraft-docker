# tekkit-minecraft-docker
[![Docker Build](https://img.shields.io/docker/cloud/build/garrettheath4/tekkit-minecraft.svg)](https://hub.docker.com/r/garrettheath4/tekkit-minecraft)

Tekkit Classic v1.2.9i Docker container.


## Build

To build the container:

1. Install git for your distro if you haven't already.
1. Run `git clone https://github.com/garrettheath4/tekkit-minecraft-docker.git`
1. Ensure you have Docker set up right so you can use it without `sudo` or root
   (not really necessary; just a preference)
1. Run `docker build --tag tekkit-minecraft:latest tekkit-minecraft-docker`


## Run

To just get it up and running, replace `<YOUR_MINECRAFT_ACCOUNT_NAME>` with
your Minecraft player name, and run the command:

```shell
docker run --detach \
    -p 25565:25565 \
    -e SERVER_OP=<YOUR_MINECRAFT_ACCOUNT_NAME> \
    --name=tekkit-server \
    --restart=unless-stopped \
    tekkit-minecraft:latest
```

By default, it does store its data in a volume so it's safe to rebuild the
container if you need to, and re-attach the previous volume to `/minecraft`.

Replace `/VOLUMES/` with the path to your volumes storage location.

```shell
docker run --detach \
    -v /VOLUMES/minecraft:/minecraft \
    -p 25565:25565 \
    -e SERVER_OP=<YOUR_MINECRAFT_ACCOUNT_NAME> \
    --name=tekkit-server \
    --restart=unless-stopped \
    tekkit-minecraft:latest
```


### Debug

To run the _tekkit-server_ Docker container interactively, use the `-it`
argument instead of `-d` in the `docker run ...` command above.

To attach to a running _tekkit-server_ Docker container, run:

    docker exec -it tekkit-server /bin/bash


<!-- vim: set textwidth=80 -->
