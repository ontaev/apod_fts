CREATE TEXT SEARCH DICTIONARY xal_stem (
    TEMPLATE = snowball,
    Language = kalmyk,
    StopWords = xal
);

COMMENT ON TEXT SEARCH DICTIONARY xal_stem IS 'snowball dictionary for kalmyk language';

CREATE TEXT SEARCH CONFIGURATION xal_stem (
    COPY = simple
);

COMMENT ON TEXT SEARCH CONFIGURATION xal_stem IS 'snowball configuration for kalmyk language';

ALTER TEXT SEARCH CONFIGURATION xal_stem
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart,
        word, hword, hword_part
    WITH xal_stem;