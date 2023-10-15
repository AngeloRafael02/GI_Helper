CREATE TABLE WeaponDomainMaterials (
    id SERIAL PRIMARY KEY,
    Material VARCHAR(50),
    star INT,
    Domain_ID INTEGER REFERENCES AscensionDomains(id),
    Availabilities INT REFERENCES Availability(id)
);
INSERT INTO WeaponDomainMaterials (Material, star, Domain_ID, Availabilities) VALUES
    ('Tile of Decarabian''s Tower',2,2,1), 
    ('Debris of Decarabian''s Tower',3,2,1),          
    ('Fragment of Decarabian''s Tower',4,2,1),             
    ('Scattered Piece of Decarabian''s Tower',5,2,1),  --4
    ('Boreal Wolf''s Milk Tooth',2,2,2),            
    ('Boreal Wolf''s Cracked Tooth',3,2,2),        
    ('Boreal Wolf''s Broken Fang',4,2,2),         
    ('Boreal Wolf''s Nostalgia',5,2,2),    --8
    ('Fetters of the Dandelion Gladiator',2,2,3),       
    ('Chains of the Dandelion Gladiator',3,2,3), 
    ('Shackles of the Dandelion Gladiator',4,2,3), 
    ('Dream of the Dandelion Gladiator',5,2,3),  --12
    ('Luminous Sands of Guyun',2,4,1), 
    ('Lustrous Stone of Guyun',3,4,1),               
    ('Relic of Guyun',4,4,1), 
    ('Relic of Guyun',5,4,1),   --16
    ('Mist Veiled Lead Elixir',2,4,2),         
    ('Mist Veiled Mercury Elixir',3,4,2), 
    ('Mist Veiled Gold Elixir',4,4,2), 
    ('Mist Veiled Primo Elixir',5,4,2), --20 
    ('Grain of Aerosiderite',2,4,3),        
    ('Piece of Aerosiderite',3,4,3),
    ('Bit of Aerosiderite',4,4,3),
    ('Chunk of Aerosiderite',5,4,3),    --24
    ('Coral Branch of a Distant Sea',2,3,1),         
    ('Jeweled Branch of a Distant Sea',3,3,1),
    ('Jade Branch of a Distant Sea',4,3,1), 
    ('Golden Branch of a Distant Sea',5,3,1),   --28        
    ('Narukami''s Wisdom',2,6,2),           
    ('Narukami''s Joy',3,6,2),  
    ('Narukami''s Affection',4,6,2),  
    ('Narukami''s Valor',5,6,2),    --32
    ('Mask of the Wicked Lieutenant',2,6,3),                
    ('Mask of the Tiger''s Bite',3,6,3), 
    ('Mask of the One-Horned',4,6,3),
    ('Mask of the Kijin',5,6,3),        --36
    ('Copper Talisman of the Forest Dew',2,8,1),            
    ('Iron Talisman of the Forest Dew',3,8,1), 
    ('Silver Talisman of the Forest Dew',4,8,1),
    ('Golden Talisman of the Forest Dew',5,8,1),    --40
    ('Oasis Garden''s Reminiscence',2,8,2),        
    ('Oasis Garden''s Kindness',3,8,2),      
    ('Oasis Garden''s Mourning',4,8,2),  
    ('Oasis Garden''s Truth',5,8,2),    --44
    ('Echo of Scorching Might',2,8,3),      
    ('Remnant Glow of Scorching Might',3,8,3),  
    ('Dream of Scorching Might',4,8,3),  
    ('Olden Days of Scorching Might',5,8,3),       --48
    ('Fragment of an Ancient Chord',2,10,1),
    ('Chapter of an Ancient Chord',3,10,1),
    ('Movement of an Ancient Chord',4,10,1),
    ('Echo of an Ancient Chord',5,10,1),    --52
    ('Dross of Pure Sacred Dewdrop',2,10,2),
    ('Sublimation of Pure Sacred Dewdrop',3,10,2),
    ('Spring of Pure Sacred Dewdrop',4,10,2),
    ('Essence of Pure Sacred Dewdrop',5,10,2),  --56
    ('Broken Goblet of the Pristine Sea',2,10,3),
    ('Wine Goblet of the Pristine Sea',3,10,3),
    ('Silver Goblet of the Pristine Sea',4,10,3),
    ('Golden Goblet of the Pristine Sea',5,10,3)    --60
    --('',,,),
    ;

CREATE TABLE WeaponMaterialSet(
    id SERIAL PRIMARY KEY,
    Material2 INT REFERENCES SkillDomainMaterials(id),
    Material3 INT REFERENCES SkillDomainMaterials(id),
    Material4 INT REFERENCES SkillDomainMaterials(id),
    Material5 INT REFERENCES SkillDomainMaterials(id)
);
INSERT INTO WeaponMaterialSet(Material2,Material3,Material4,Material5) VALUES
    -- Mondstadt
    (1,2,3,4),
    (5,6,7,8),
    (9,10,11,12),
    -- Liyue
    (13,14,15,16),
    (17,18,19,20),
    (21,22,23,24),
    -- Inazuma
    (25,26,27,28),
    (29,30,31,32),
    (33,34,35,36),
    -- Sumeru
    (37.38.39.40),
    (41,42,43,44),
    (45,46,47,48),
    -- Fontaine
    (49,50,51,52),
    (53,54,55,56),
    (57,58,59,60)
    --(,,,),
;