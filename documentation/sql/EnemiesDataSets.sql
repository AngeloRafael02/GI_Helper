CREATE TABLE EnhancementMatSet(
    id SERIAL PRIMARY KEY,
    MaterialA INT REFERENCES EnhancementMaterials(id),
    MaterialB INT REFERENCES EnhancementMaterials(id),
    MaterialC INT REFERENCES EnhancementMaterials(id)
);
INSERT INTO EnhancementMatSet (MaterialA,MaterialB,MaterialC) VALUES
    (1,2,3),
    (4,5,6),
    (7,8,9),
    (10,11,12),
    (13,14,15), --5
    (16,17,18),
    (19,20,21),
    (22,23,24),
    (25,26,27),
    (28,29,30), --10
    (31,32,33),
    (34,35,36),
    (37,38,39),
    (40,41,42),
    (43,44,45), --15
    (46,47,48),
    (49,50,51),
    (52,53,54),
    (55,56,57),
    (58,59,60), --20
    (61,62,63),
    (64,65,66),
    (67,68,69),
    (70,71,72),
    (73,74,75), --25
    (76,77,78),
    (79,80,81),
    (82,83,84),
    (85,86,87),
    (88,89,90), --30
    (91,92,93)
    --(,,),
;
CREATE VIEW allMobLootSets AS 
SELECT 
    EnhancementMatSet.id,
    mt1.Material AS Mat1,
    mt2.Material AS Mat2,
    mt3.Material AS Mat3
FROM EnhancementMatSet 
JOIN EnhancementMaterials as mt1 ON EnhancementMatSet.MaterialA = mt1.id
JOIN EnhancementMaterials as mt2 ON EnhancementMatSet.MaterialB = mt2.id
JOIN EnhancementMaterials as mt3 ON EnhancementMatSet.MaterialC = mt3.id
;