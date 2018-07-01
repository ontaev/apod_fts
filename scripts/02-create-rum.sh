#!/bin/bash

# Download and install RUM
git clone https://github.com/postgrespro/rum.git
make -C rum USE_PGXS=1 install

psql -h localhost -d xal_fts -f scripts/02-create-rum.sql
