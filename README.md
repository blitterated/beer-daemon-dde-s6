# The Beer Daemon dde-s6 test

This image is just the [Beer Daemon](https://github.com/blitterated/beer-daemon) built on top of [dde-s6](https://github.com/blitterated/docker-dev-env-s6). It's a good way to test an image based on s6-overlay version 3.0.0.2-1 and up.

### Build, Run, Test

Build image

```sh
docker builder prune -af && docker build --progress=plain -t beer-dde .
```

Run container

```sh
docker run -it --rm beer-dde /bin/bash
```

Stop beer service

```sh
s6-rc -d change beer
```

Restart beer service

```sh
s6-rc -u change beer
```

Exit container quickly, bypassing s6 shutdown (testing `--rm` containers only)

```sh
s6-svscanctl -qb /run/service
```

### Run as daemon container

Start a container

```sh
CID=$(docker run -d --rm --env BOTTLES=10 beer-dde)
```

Use Ctrl-C to exit log tailing

```sh
docker logs --follow $CID
```

Stop the daemon container

```sh
docker stop $CID
```

Stop container quickly

```sh
docker exec $CID /command/s6-svscanctl -qb /run/service
```

Run a container, bypassing s6 init

```sh
docker run -it --rm --entrypoint /bin/bash beer-dde
```
