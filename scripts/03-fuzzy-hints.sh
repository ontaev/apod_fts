#!/bin/bash

# Create fuzzy hints to user
psql -h localhost -d xal_fts -f scripts/03-fuzzy-hints.sql
