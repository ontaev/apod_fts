PostgreSQL full text search project for [kalmyk](https://en.wikipedia.org/wiki/Kalmyk_Oirat) language 

Forked from https://github.com/postgrespro/apod_fts


# xal_fts
PostgreSQL full text search example for [kalmyk](https://en.wikipedia.org/wiki/Kalmyk_Oirat) language 

# Modules
* [ts_json](modules/ts_json) provides functions to full text search with json and jsonb.
* [ts_parser](modules/ts_parser) is the modified default text search parser from
PostgreSQL 9.6.

# Installing
`xal_fts` is a web-application written in Python using flask web-framework. To run this application
you need to install `Flask` and `psycopg2` Python packages.

It is necessary that PostgreSQL binaries are in PATH environment. To install all text search dictionaries and RUM index you can use scripts in script directory.
You should have snowball kalmyk dictionary. Source code you can get from [kalmyk-stemmer project](https://github.com/ontaev/kalmyk-stemmer) 

Use the following commands 

```
=> cd xal_fts
=> createdb xal_fts
=> psql xal_fts < scripts/xal_fts.dump
=> chmod +x scripts/00-create-stemmer.sh
=> scripts/00-create-stemmer.sh
=> chmod +x scripts/01-create-configuration.sh
=> scripts/01-create-configuration.sh
=> chmod +x scripts/02-create-rum.sh
=> scripts/02-create-rum.sh
=> chmod +x scripts/03-fuzzy-hints.sh
=> scripts/03-fuzzy-hints.sh
```
