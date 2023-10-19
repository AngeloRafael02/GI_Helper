CREATE TABLE EnhancementMaterials ( --REGULAR ENEMY LOOT
    id SERIAL PRIMARY KEY,
    Material VARCHAR(50),
    star INT
);
INSERT INTO EnhancementMaterials (Material,star) VALUES
    ('Slime Condensate',1),
    ('Slime Secretions',2),
    ('Slime Concentrate',3), --3
    ('Spectral Husk',1),
    ('Spectral Heart',2),
    ('Spectral Nucleus',3),  --6
    ('Damaged Mask',1),
    ('Stained Mask',2),
    ('Ominous Mask',3),  --9
    ('Firm Arrowhead',1),
    ('Sharp Arrowhead',2),
    ('Weathered Arrowhead',3), --12
    ('Heavy Horn',2),
    ('Black Bronze Horn',3),
    ('Black Crystal Horn',4),  --15   
    ('Divining Scroll',1),
    ('Sealed Scroll',2),
    ('Forbidden Curse Scroll',3), --18
    ('A Flower Yet To Bloom',2),
    ('Treasured Flower',3),
    ('Wanderer''s Blooming Flower',4), --21
    ('Dead Lay Line Branch',2),
    ('Dead Lay Line Leaves',3),
    ('Ley Line Sprout',4), --24
    ('Gloomy Statuette',2),
    ('Dark Statuette',3),
    ('Deathly Statuette',4), --27
    ('Concealed Claws',2),
    ('Concealed Unguis',3),
    ('Concealed Talon',4), --30
    ('Recruit''s Insignia',1),
    ('Sergeant''s Insignia',2),
    ('Lieutenant''s Insignia',3), --33
    ('Hunter''s Sacrificial Knife',2),
    ('Agent''s Sacrificial Knife',3),
    ('Inspector''s Sacrificial Knife',4), --36
    ('Mist Grass Pollen',2),
    ('Mist Grass',3),
    ('Mist Grass Wick',4), --39
    ('Dismal Prism',2),
    ('Crystal Prism',3),
    ('Polarizing Prism',4), --42
    ('Chaos Device',2),
    ('Chaos Circuit',3),
    ('Chaos Core',4),  --45
    ('Chaos Gear',2),
    ('Chaos Axis',3),
    ('Chaos Oculus',4),  --48
    ('Chaos Storage',2),
    ('Chaos Module',3),
    ('Chaos Bolt',4),  --52
    ('Damaged Prism',2),
    ('Turbid Prism',3),
    ('Radiant Prism',4), --54
    ('Treasure Hoarder Insignia',1),
    ('Silver Raven Insignia',2),
    ('Golden Raven Insignia',3), --57
    ('Old Handguard',1),
    ('Kageuchi Handguard',2),
    ('Famed Handguard',3),  --60
    ('Faded Red Satin',1),
    ('Trimmed Red Silk',2),
    ('Rich Red Brocade',3), --63
    ('Whopperflower Nectar',1),
    ('Shimmering Nectar',2),
    ('Energy Nectar',3), --66
    ('Fragile Bone Shard',2),
    ('Sturdy Bone Shard',3),
    ('Fossilized Bone Shard',4), --69
    ('Fungal Spores',1),
    ('Luminescent Pollen',2),
    ('Crystalline Cyst Dust',3), --72
    ('Inactivated Fungal Nucleus',2),
    ('Dormant Fungal Nucleus',3),
    ('Robust Fungal Nucleus',4), --75
    ('Desiccated Shell',2),
    ('Sturdy Shell',3),
    ('Marked Shell',4), --78
    ('Drop of Tainted Water',2),
    ('Scoop of Tainted Water',3),
    ('Newborn Tainted Hydro Phantasm',4), --81
    ('Rift Core',2),
    ('Foreign Synapse',3),
    ('Alien Life Core',4), --84
    ('Old Servant''s Pocket Watch',2),
    ('Standard Servant''s Pocket Watch',3),
    ('Servant''s Constancy',4), --87
    ('Meshing Gear',1),
    ('Mechanical Spur Gear',2),
    ('Artificed Dynamic Gear',3), --90
    ('Transoceanic Pearl',1),
    ('Transoceanic Chunk',2),
    ('Xenochromatic Crystal',3) --93
;

CREATE TABLE CharacterLevelUpMaterial ( --Boss Loot
    id SERIAL PRIMARY KEY,
    Material VARCHAR(50),
    Region_ID INT REFERENCES Regions(id) 
);
INSERT INTO CharacterLevelUpMaterial (Material, Region_ID) VALUES
    ('Smoldering Pearl',3), --Pyro Hypostasis
    ('Dew of Repudiation',3), --Hydro Hypostasis
    ('Hurricane Seed',1), --Anemo Hypostasis
    ('Lightning Prism',1), --Electro Hypostasis
    ('Quelled Creeper',4), --Dendro Hypostasis --5
    ('Crystalline Bloom',1), --Cryo Hypostasis
    ('Basalt Pillar',2), --Geo Hypostasis
    ('Cleansing Heart',2), -- Oceanid
    ('Runic Fang',2), -- Ruin Serpent    
    ('Perpetual Heart',3), -- Perpetual Mechanical Array (10)
    ('Perpetual Caliber',4), -- Aeonblight Drake
    ('Marionette Core',3), -- Maguu Kenki
    ('Everflame Seed',2), -- Pyro Regisvine
    ('Riftborn Regalia',3), --Golden Wolflord
    ('Majestic Hooked Beak',4), -- Jadeplume Terrorshroom --15
    ('Thunderclap Fruitcore',4), -- Electro Regisvine
    ('Hoarfrost Core',1), -- Cryo Regisvine
    ('Storm Beads',3), -- Thunder Manifestation
    ('Juvenile Jade',2), -- Primo Geovishap
    ('Dragonheir''s False Fin',3), -- Bathymal Vishap Herd (20)
    ('Pseudo-Stamens',4), -- Setekh Wenut
    ('Evergloom Ring',4), -- Iniquitous Baptist
    ('Artificed Spare Clockwork Component - Coppelia',5), -- Icewind Suite - Coppelia
    ('Artificed Spare Clockwork Component - Coppelius',5), -- Icewind Suite - Coppelius
    ('Emperor''s Resolution',5), -- Emperor of Fire and Iron (25)
    ('Light Guiding Tetrahedron',4), -- Algorithm of Semi-Intransient Matrix of Overseer Network 
    ('Tourbillon Device',5), --Experimental Field Generator
    ('Fontemer Unihorn',5) --Millennial Pearl Seahorse
;

CREATE TABLE SpecTrounceDomainMat(
    id SERIAL PRIMARY KEY,
    Material VARCHAR(50)
);
INSERT INTO SpecTrounceDomainMat(Material) VALUES
('Dvalin''s Plume'),
('Dvalin''s Claw'),
('Dvalin''s Sigh'), --3
('Tail of Boreas'),
('Ring of Boreas'), 
('Spirit Locket of Boreas'), --6
('Tusk of Monoceros Caeli'),
('Shard of a Foul Legacy'), 
('Shadow of the Warrior'),  --9
('Dragon Lord''s Crown'),
('Bloodjade Branch'), 
('Gilded Scale'),  --12
('Molten Moment'),
('Hellfire Butterfly'),
('Ashen Heart'), --15
('Mudra of the Malefic General'),
('Tears of the Calamitous God'), 
('The Meaning of Aeons'), --18
('Puppet Strings'), 
('Mirror of Mushin'),
('Daka''s Bell'),  --21
('Worldspan Fern'),
('Primordial Greenbloom'),
('Everamber') --24
;


CREATE TABLE Family (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25)
);
INSERT INTO Family (name) VALUES
    ('Elemental Lifeforms'),
    ('Hilichurls'),
    ('The Abyss Order'),
    ('Fatui'),
    ('Automaton'),
    ('Other Human factions'),
    ('Magical Beasts'),
    ('Bosses') -- Trounce Domain Boss
;

CREATE TABLE Grade (
    id SERIAL PRIMARY KEY,
    name VARCHAR(15)
);
INSERT INTO Grade (name) VALUES
    ('Regular'),
    ('Elite'),
    ('Boss'),
    ('Trounce Boss')
;