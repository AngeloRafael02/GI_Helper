--NOTE: Set " to all Columns once filled with at least 1 row of data
--NOTE: Set references after making tables

--Side Tables
CREATE TABLE WeaponTypes (
    id SERIAL PRIMARY KEY,
    Type VARCHAR(10));
INSERT INTO WeaponTypes (Type) VALUES 
    ('Sword'),
    ('Claymore'),
    ('Polearm'),
    ('Catalyst'),
    ('Bow');

CREATE TABLE Regions (
    id SERIAL PRIMARY KEY,
    Region VARCHAR(20));
INSERT INTO Regions (Region) VALUES 
    ('Mondstadt'),  --1
    ('Liyue'),      --2
    ('Inazuma'),    --3
    ('Sumeru'),     --4
    ('Fontaine'),   --5
    ('Natlan'),     --6
    ('Snezhnaya');  --7

CREATE TABLE Elements (
    id SERIAL PRIMARY KEY,
    Element VARCHAR(20));
INSERT INTO Elements (Element) VALUES
    ('Pyro'),   --1
    ('Hydro'),  --2
    ('Anemo'),  --3
    ('Electro'),--4 
    ('Dendro'), --5
    ('Cryo'),   --6
    ('Geo');    --7

CREATE TABLE SecondStats (
    id SERIAL PRIMARY KEY,
    Stat VARCHAR(20));
INSERT INTO SecondStats (Stat) VALUES 
    ('ATK'),                --1
    ('HP'),                 --2
    ('DEF'),                --3
    ('Physical DMG Bonus'), --4
    ('Energy Recharge'),    --5
    ('Elemental Mastery'),  --6
    ('CRIT DMG'),           --7
    ('CRIT Rate');          --8

CREATE TABLE Availability (
    id SERIAL PRIMARY KEY,
    Days VARCHAR(20)[]
);
--AVAILABILITY ROWS
INSERT INTO Availability (Days) VALUES
    (ARRAY['Sunday','Monday','Thursday']),
    (ARRAY['Sunday','Tuesday','Friday']),
    (ARRAY['Sunday','Wednesday','Saturday']);

CREATE TABLE AscensionDomains ( --Both Character Skill and Weapon Level Up Domains
    id SERIAL PRIMARY KEY,
    DomainName VARCHAR(40),
    Region_ID INT REFERENCES Regions(id));
INSERT INTO AscensionDomains (DomainName, Region_ID) VALUES 
    ('Forsaken Rift', 1 ),                      --1 (SkillDomain)
    ('Cecilia Garden', 1 ),                     --2 (WeaponsDomain)
    ('Taishan Mansion', 2 ),                    --3 (SkillDomain)
    ('Hidden Palace of Lianshan Formula', 2 ),  --4 (WeaponsDomain)
    ('Violet Court', 3 ),                       --5 (CharactersDomain)
    ('Court of Flowing Sand', 3),               --6 (WeaponsDomain)
    ('Steeple of Ignorance', 4),                --7 (SkillDomain)
    ('Tower of Abject Pride', 4),               --8 (WeaponsDomain)
    ('Pale Forgotten Glory',5),                 --9 (SkillDomain)
    ('Echoes of the Deep Tides',5)              --10 (WeaponsDomain)
;
