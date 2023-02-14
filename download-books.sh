#!/bin/bash

mkdir -p books
nprocs=100
ndocuments=$(( 10**3 ))
(
  for idoc in $( seq 1 $ndocuments )
  do
    id=$( printf "%05d" $RANDOM )
    ((i=i%nprocs)); ((i++==0)) && wait
    wget -nc -r --accept-regex="$id.*txt" https://www.gutenberg.org/files/$id/ -O books/$id.txt &
  done
)
