#!/bin/bash

NAME=web MESSAGE="Im web FRONT"  LISTEN_ADDR='0.0.0.0:6060' \
   UPSTREAM_URIS=http://0.0.0.0:5000 \
   LOG_OUTPUT=/tmp/web.log \
   fake-service &
