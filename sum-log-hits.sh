#!/bin/bash

i=1
now=`date +'%H:%M'`
total=`cat ${1} | grep ${now} | wc -l`
while [[ ${i} -le 4 ]]; do
    time=`date -d "-${i} mins" +'%H:%M'`
    total=$((${total} +  `cat ${1} | grep ${time} | wc -l`))
    ((i++))
done

echo $total
