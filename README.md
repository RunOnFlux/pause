# Flux Pause Container

Minimal pause container for FluxOS shared network namespace support.

A ~20KB static binary that does nothing but sleep, handling SIGTERM/SIGINT for clean shutdown. Used internally by FluxOS to hold a network namespace open so that multi-component app containers can share `localhost`.

## Build locally

```bash
docker build -t runonflux/pause:latest .
```

## Build multi-arch (amd64 + arm64)

```bash
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm64 -t runonflux/pause:latest --push .
```

## Test

```bash
docker run -d --name test-pause runonflux/pause:latest
docker inspect test-pause --format '{{.State.Status}}'
# should print: running
docker stop test-pause && docker rm test-pause
```
