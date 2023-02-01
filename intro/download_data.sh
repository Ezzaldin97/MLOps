#!/bin/bash

URL="https://d37ci6vzurychx.cloudfront.net/trip-data"
TAXI_LIST=("yellow" "green")

for taxi in ${TAXI_LIST[@]}
do
  echo "process of getting and ingesting ${taxi} taxi data to postgres started"
  for num in {1..12}
  do
    fidx=`printf "%02d" ${num}`
    file_url="${URL}/${taxi}_tripdata_2021-${fidx}.parquet"
    file_name="${taxi}_tripdata_2021-${fidx}.parquet"
    echo "DOWNLOADING ${file_url}"
    curl -kLSs ${file_url} -o ./data/${file_name}
  done
done