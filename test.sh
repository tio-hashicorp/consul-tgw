#!/bin/bash
for i in b{1..20}; do 
  curl -s localhost:6060 -H "x-uid: 12345" |jq -r '.upstream_calls."http://0.0.0.0:6661| "\(.name),\(.code)"'; 
  sleep 1; 
done
