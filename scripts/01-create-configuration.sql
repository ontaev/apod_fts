-- Create dictionaries modules
CREATE EXTENSION hunspell_xal;
CREATE EXTENSION ts_parser;

CREATE TEXT SEARCH CONFIGURATION xal_fts_conf (parser=ts_parser);
ALTER TEXT SEARCH CONFIGURATION xal_fts_conf
	ADD MAPPING FOR email, file, float, host, hword_numpart, int,
	numhword, numword, sfloat, uint, url, url_path, version
	WITH simple;
ALTER TEXT SEARCH CONFIGURATION xal_fts_conf
	ALTER MAPPING FOR asciiword, asciihword, hword_asciipart, hword, hword_part, word WITH xal_hunspell, xal_stem;

-- Add tsvector column
ALTER TABLE articles ADD COLUMN fts tsvector;
UPDATE articles SET fts =
	setweight(to_tsvector('xal_fts_conf', coalesce(title,'')), 'A') ||
	setweight(to_tsvector('xal_fts_conf', coalesce(text, '')), 'B');

CREATE FUNCTION xal_fts_trigger()
RETURNS trigger as $$
BEGIN
  new.fts :=
    setweight(to_tsvector('xal_fts_conf', coalesce(new.title, '')), 'A') ||
    setweight(to_tsvector('xal_fts_conf', coalesce(new.text, '')), 'B');
  RETURN new;
END
$$ LANGUAGE plpgsql;

CREATE TRIGGER xal_fts_update BEFORE INSERT OR UPDATE
	ON articles FOR EACH ROW EXECUTE procedure xal_fts_trigger();
