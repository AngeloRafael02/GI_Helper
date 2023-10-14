CREATE TABLE SkillDomainMaterials (
    id SERIAL PRIMARY KEY,
    Material VARCHAR(50),
    star INT,
    Domain_ID INTEGER REFERENCES AscensionDomains(id),
    Availabilities INT REFERENCES Availability(id)
);
INSERT INTO SkillDomainMaterials (Material, star, Domain_ID, Availabilities) VALUES 
    ('Teachings of Freedom',2,1,1),     
    ('Guide to Freedom',3,1,1),          
    ('Philosophies of Freedom',4,1,1),   --3
    ('Teachings of Resistance',2,1,2),   
    ('Guide to Resistance',3,1,2), 
    ('Philosophies of Resistance',4,1,2), --6
    ('Teachings of Ballad',2,1,3),       
    ('Guide to Ballad',3,1,3),          
    ('Philosophies of Ballad',4,1,3),   --9
    ('Teachings of Prosperity',2,3,1),   
    ('Guide to Prosperity',3,3,1),      
    ('Philosophies of Prosperity',4,3,1), --12
    ('Teachings of Diligence',2,3,2),    
    ('Guide to Diligence',3,3,2),        
    ('Philosophies of Diligence',4,3,2), --15
    ('Teachings of Gold',2,3,3),         
    ('Guide to Gold',3,3,3),             
    ('Philosophies of Gold',4,3,3), --18
    ('Teachings of Transience',2,5,1),  
    ('Guide to Transience',3,5,1),       
    ('Philosophies of Transience',4,5,1), --21
    ('Teachings of Elegance',2,5,2),     
    ('Guide to Elegance',3,5,2),         
    ('Philosophies of Elegance',4,5,2),  --24
    ('Teachings of Light',2,5,3),        
    ('Guide to Light',3,5,3),            
    ('Philosophies of Light',4,5,3),     --27
    ('Teachings of Admonition',2,7,1),   
    ('Guide to Admonition',3,7,1),    
    ('Philosophies of Admonition',4,7,1), --30
    ('Teachings of Ingenuity',2,7,2),    
    ('Guide to Ingenuity',3,7,2),      
    ('Philosophies of Ingenuity',4,7,2),  --33
    ('Teachings of Praxis',2,7,3),       
    ('Guide to Praxis',3,7,3),          
    ('Philosophies of Praxis',4,7,3), --36
    ('Teachings of Equity',2,9,1),
    ('Guide to Equity',3,9,1),
    ('Philosophies of Equity',4,9,1), --39
    ('Teachings of Justice',2,9,2),
    ('Guide to Justice',3,9,2),
    ('Philosophies of Justice',4,9,2), --42
    ('Teachings of Order',2,9,3),
    ('Guide to Order',3,9,3),
    ('Philosophies of Order',4,9,3) --45
    --('',,,)
    ;

CREATE TABLE SkillMaterialsSet (
    id SERIAL PRIMARY KEY,
    Material2 INT REFERENCES SkillDomainMaterials(id),
    Material3 INT REFERENCES SkillDomainMaterials(id),
    Material4 INT REFERENCES SkillDomainMaterials(id)
);
INSERT INTO SkillMaterialsSet (Material2,Material3,Material4) VALUES
    -- Mondstadt
    (1,2,3),
    (4,5,6),
    (7,8,9), 
    -- Liyue
    (10,11,12),
    (13,14,15),
    (16,17,18),
    -- Inazuma
    (19,20,21),
    (22,23,24),
    (25,26,27),
    -- Sumeru
    (28,29,30),
    (31,32,33),
    (34,35,36),
    -- Fontaine
    (37,38,39),
    (40,41,42),
    (43,44,45)
    --(,,),
; 

CREATE VIEW allSkillMatSet AS 
SELECT 
    SkillMaterialsSet.id,
    m3.Material AS Mat3,
    m4.Material AS Mat4,
    m5.Material AS Mat5
FROM SkillMaterialsSet
JOIN SkillDomainMaterials AS m3 ON SkillMaterialsSet.Material2 = m3.id
JOIN SkillDomainMaterials AS m4 ON SkillMaterialsSet.Material3 = m4.id
JOIN SkillDomainMaterials AS m5 ON SkillMaterialsSet.Material4 = m5.id
;