FROM alpine:3.20 AS builder
RUN apk add --no-cache gcc musl-dev
COPY pause.c /pause.c
RUN gcc -static -Os -o /pause /pause.c && strip /pause

FROM scratch
COPY --from=builder /pause /pause
ENTRYPOINT ["/pause"]
