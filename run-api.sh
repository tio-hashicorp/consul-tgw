#!/bin/bash

# introduce delay either by using 
#  a. error_type=delay
#  b. timing_xx_percentile

# note ERROR_CODE is 200
ERROR_RATE=0.6 ERROR_CODE=200 ERROR_TYPE=delay ERROR_DELAY=5s \
   NAME=api-v1 MESSAGE="IM API V1" LISTEN_ADDR='0.0.0.0:6061' \
   LOG_OUTPUT=/tmp/api1.log \
   fake-service &

#TIMING_50_PERCENTILE=5s TIMING_90_PERCENTILE=30s TIMING_VARIANCE=150 \
#    NAME=api-v1 MESSAGE="IM API V1" LISTEN_ADDR='0.0.0.0:6061' \
#    LOG_OUTPUT=/tmp/api1.log LOG_LEVEL=debug \
#    fake-service &
