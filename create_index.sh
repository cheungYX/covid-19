#!/bin/sh

cd ./schema
curl -XPUT "http://192.168.64.3:31978/covid_19" -d @settings_covid_19.json -H "Content-Type: application/json"; echo
curl -XPUT "http://192.168.64.3:31978/covid_19/_mapping" -d @mappings_covid_19.json -H "Content-Type: application/json"; echo
curl -X POST "http://192.168.64.3:31978/_bulk?pretty" --data-binary @covid.json -H "Content-Type: application/json"; echo