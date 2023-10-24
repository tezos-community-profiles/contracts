#!/bin/sh

PRIVATE_KEY=$(cat secrets/originator.json | jq -r .privkey)

# Create Docker volume
docker volume create tcp_deploy

# Set permissions for .tezos-client dir
docker run --rm \
--user root \
-v tcp_deploy:/home/tezos/.tezos-client \
--entrypoint /bin/chmod \
tezos/tezos:latest -R 777 /home/tezos/.tezos-client

# Import private key
docker run --rm \
-v tcp_deploy:/home/tezos/.tezos-client \
--entrypoint octez-client \
-it tezos/tezos:latest \
import secret key deployer unencrypted:$PRIVATE_KEY --force

# Originate
docker run --rm \
-v "$(pwd)"/compiled/tcp.tz:/home/tezos/tcp.tz:ro \
-v "$(pwd)"/compiled/storage.tz:/home/tezos/storage.tz:ro \
-v tcp_deploy:/home/tezos/.tezos-client \
--entrypoint /bin/sh \
-it tezos/tezos:latest \
-c "octez-client --endpoint $TCP_RPC \
originate contract scp \
transferring 0 from deployer \
running tcp.tz --init \"\$(cat storage.tz)\" --burn-cap 1"

# Remove docker volume
docker volume rm tcp_deploy
