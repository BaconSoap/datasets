#!/bin/sh

echo "extracting 2015 population data"
mapshaper -i PopulationEstimates.csv -filter-fields "FIPS,State,Area_Name,POP_ESTIMATE_2015" -o force 2015-population.csv
