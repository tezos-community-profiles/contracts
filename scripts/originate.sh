#!/bin/sh
docker run --rm \
-v "$(pwd)"/compiled/tcp.tz:/home/tezos/tcp.tz:ro \
--entrypoint octez-client \
-it tezos/tezos:latest \
--endpoint $TCP_RPC \
originate contract scp \
transferring 0 from tz1UZZnrre9H7KzAufFVm7ubuJh5cCfjGwam \
running tcp.tz --burn-cap 0.1
