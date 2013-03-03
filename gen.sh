#!/bin/bash
ROOT=~/Data/Maps
COUNTRIES=ne_50m_admin_0_countries
ogr2ogr -f GeoJSON "countries.json" -where "su_a3 != 'ATA'" "$ROOT/$COUNTRIES/ne_50m_admin_0_countries.shp"

STATES=ne_50m_admin_1_states_provinces_lakes
ogr2ogr -f GeoJSON "states.json" -where "sr_adm0_a3 == 'USA'" "$ROOT/$STATES/$STATES.shp"

topojson --id-property su_a3 -p name -o countries.topo.json countries.json
