CREATE EXTENSION rum;

CREATE INDEX xal_fts_tsv_idx ON apod USING rum (fts rum_tsvector_ops);