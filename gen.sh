#!/bin/bash
ROOT=~/Data/Maps
COUNTRIES=ne_50m_admin_0_countries
rm "countries.json"
ogr2ogr -f GeoJSON "countries.json" -where "su_a3 NOT IN ('ATA', 'GRL', 'USA', 'CAN')" "$ROOT/$COUNTRIES/ne_50m_admin_0_countries.shp"
topojson --id-property su_a3 -p name -o countries.topo.json countries.json

STATES=ne_50m_admin_1_states_provinces_lakes
rm states.json
ogr2ogr -f GeoJSON "states.json" -where "sr_adm0_a3 = 'USA'" "$ROOT/$STATES/${STATES}_shp.shp"
topojson --id-property postal -p name -o states.topo.json states.json
