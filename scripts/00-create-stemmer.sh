#!/bin/bash

# Create snowball dictionary
psql -h localhost -d xal_fts -f scripts/00-create-stemmer.sql