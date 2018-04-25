#!/bin/sh

docker run --rm -v $PWD:/app gcc /bin/sh -c 'cd /app && make asm'