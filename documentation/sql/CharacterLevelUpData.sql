CREATE TABLE CharacterLevelUpMaterials ( --GEMS
    id SERIAL PRIMARY KEY,    
    Material VARCHAR(50)
);
INSERT INTO CharacterLevelUpMaterials (Material) VALUES
    ('Agnidus Agate Silver'),
    ('Agnidus Agate Fragment'),
    ('Agnidus Agate Chunk'),
    ('Agnidus Agate Gemstone'), -- Pyro (4)
    ('Varunada Lazurite Silver'),
    ('Varunada Lazurite Fragment'),
    ('Varunada Lazurite Chunk'),
    ('Varunada Lazurite Gemstone'), --Hydro (8)
    ('Vayuda Turquoise  Silver'),
    ('Vayuda Turquoise  Fragment'),
    ('Vayuda Turquoise  Chunk'),
    ('Vayuda Turquoise  Gemstone'), --Anemo (12)
    ('Vajrada Amethyst Silver'),
    ('Vajrada Amethyst Fragment'),
    ('Vajrada Amethyst Chunk'),
    ('Vajrada Amethyst Gemstone'), --Electro (16)
    ('Nagadus Emerald Silver'),
    ('Nagadus Emerald Fragment'),
    ('Nagadus Emerald Chunk'),
    ('Nagadus Emerald Gemstone'), --Dendro (20)
    ('Shivada Jade Silver'),
    ('Shivada Jade Fragment'),
    ('Shivada Jade Chunk'),
    ('Shivada Jade Gemstone'), --Cryo (24)
    ('Prithiva Topaz Silver'),
    ('Prithiva Topaz Fragment'),
    ('Prithiva Topaz Chunk'),
    ('Prithiva Topaz Gemstone') --Geo (28)
;

CREATE TABLE LevelUpMaterialsSet( --GEMS
    id SERIAL PRIMARY KEY,    
    Material2 INT REFERENCES CharacterAscensionMaterials(id),
    Material3 INT REFERENCES CharacterAscensionMaterials(id),
    Material4 INT REFERENCES CharacterAscensionMaterials(id),
    Material5 INT REFERENCES CharacterAscensionMaterials(id)
);
INSERT INTO LevelUpMaterialsSet(Material2,Material3,Material4,Material5) VALUES
    (1,2,3,4),
    (5,6,7,8),
    (9,10,11,12),
    (13,14,15,16),
    (17,18,19,20),
    (21,22,23,24),
    (25,26,27,28)
;
CREATE VIEW allGemsSets AS 
SELECT 
    LevelUpMaterialsSet.id,
    g1.Material AS Gem2,
    g2.Material AS Gem3,
    g3.Material AS Gem4,
    g4.Material AS Gem5
FROM LevelUpMaterialsSet
JOIN CharacterLevelUpMaterials AS g1 ON LevelUpMaterialsSet.Material2 = g1.id
JOIN CharacterLevelUpMaterials AS g2 ON LevelUpMaterialsSet.Material3 = g2.id
JOIN CharacterLevelUpMaterials AS g3 ON LevelUpMaterialsSet.Material4 = g3.id
JOIN CharacterLevelUpMaterials AS g4 ON LevelUpMaterialsSet.Material5 = g4.id
;