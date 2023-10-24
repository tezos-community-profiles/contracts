#!/bin/bash
STORAGE=$(cat initial_storage.jsligo)
ligo compile contract tcp.jsligo -m TCP -o compiled/tcp.tz
ligo compile storage tcp.jsligo -m TCP "$STORAGE" > compiled/storage.tz
