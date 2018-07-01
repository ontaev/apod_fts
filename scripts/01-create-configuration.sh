#!/bin/bash

# Download and install dictionaries from https://github.com/ontaev/kalmyk-hunspell as shown below: 
git clone https://github.com/ontaev/kalmyk-hunspell.git
make -C kalmyk-hunspell USE_PGXS=1 install

# Install ts_parser module
make -C modules/ts_parser USE_PGXS=1 install

# Create configuration
psql -h localhost -d xal_fts -f scripts/01-create-configuration.sql