#!/bin/sh

docker run --rm -v $PWD:/app gcc /bin/sh -c 'cd /app && make no_stack_protection && make stack_protection'