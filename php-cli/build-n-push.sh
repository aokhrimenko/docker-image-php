#!/usr/bin/env bash

echo "<== Pull"
docker pull php:8.1-cli
echo
echo
echo "=== Build BASE"
docker build -t arhip/php-8.1-cli:prod --target base .
echo
echo
echo "===  Build DEV"
docker build -t arhip/php-8.1-cli:dev --target dev .
echo
echo
echo "==> Push"
docker push --all-tags arhip/php-8.1-cli
