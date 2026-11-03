#!/bin/sh
set -eu

cd "$(dirname "$0")"
mkdir -p build

cc -std=c11 -Wall -Wextra -c ../lesson-05/showlog.c -o build/showlog.o
cc build/showlog.o -o build/showlog
