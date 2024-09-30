-- Create the demons table
CREATE TABLE demons (
    demon_id RAW(16) DEFAULT sys_guid() PRIMARY KEY,  -- Unique identifier for each demon
    demon_short_description VARCHAR2(4000),          -- Short description of the demon
    demon_long_description VARCHAR2(4000),           -- Long description of the demon
    location_association VARCHAR2(4000),             -- Location associated with the demon
    victory_over_demon_notes VARCHAR2(4000),         -- Notes on how to achieve victory over the demon
    associated_with_blank_negative_effects VARCHAR2(4000), -- Negative effects associated with blank
    people_who_believe_the_demon_is_a_problem VARCHAR2(4000),     -- People or groups who believe in the demon

    -- Additional columns for note and dates
    note VARCHAR2(4000),  -- General-purpose note field
    date_created TIMESTAMP(9) WITH TIME ZONE DEFAULT systimestamp(9) NOT NULL,
    date_updated TIMESTAMP(9) WITH TIME ZONE,
    date_created_or_updated TIMESTAMP(9) WITH TIME ZONE 
        GENERATED ALWAYS AS (COALESCE(date_updated, date_created)) VIRTUAL
);

-- Trigger to update the date_updated column whenever a row is updated in the demons table
CREATE OR REPLACE TRIGGER trg_set_date_updated_demons
BEFORE UPDATE ON demons
FOR EACH ROW
BEGIN
    :NEW.date_updated := SYSTIMESTAMP;
END;
/


SELECT * FROM demons;