curl 'http://www2.census.gov/geo/tiger/GENZ2015/shp/cb_2015_us_county_500k.zip' >> source.zip
unzip -o source.zip cb_2015_us_county_500k.shp cb_2015_us_county_500k.dbf

mv cb_2015_us_county_500k.shp source.shp
mv cb_2015_us_county_500k.dbf source.dbf

rm source.zip

mapshaper source.shp -simplify 10% \
  -filter-fields "GEOID,NAME,STATEFP" \
  -o force counties_10.json

mapshaper source.shp -simplify 50% \
  -filter-fields "GEOID,NAME,STATEFP" \
  -o force counties_50.json

mapshaper source.shp -simplify 10% \
  -dissolve STATEFP \
  -o force states_10.json

mapshaper source.shp -simplify 50% \
  -dissolve STATEFP \
  -o force states_50.json

rm source.dbf source.shp
