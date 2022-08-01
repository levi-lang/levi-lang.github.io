#!/usr/bin/bash
endpoint=http://10.126.38.41:7001
curl http://10.126.38.41:7001/preparation/1000-genomes-phase-3-reanalysis-with-dragen-35-data-lakehouse-ready |jq -c '.generationRequests[]|[.id, .pieceCid, .index]'
result=`curl http://10.126.38.41:7001/preparation/1000-genomes-phase-3-reanalysis-with-dragen-35-data-lakehouse-ready |jq -c '.generationRequests[]|[.id, .pieceCid, .index]'`
echo $result
for r in $result
do
printf "$r\n"
  id=$(jq '.[0]' <<< "$row" | tr -d '"')
echo 1
  pieceCid=$(jq '.[1]' <<< "$row" | tr -d '"')
echo 2
  index=$(jq '.[2]' <<< "$row" | tr -d '"')
  echo "Working on [${index}] - generation id: ${id}, pieceCid: ${pieceCid}"
  sleep 1
done

