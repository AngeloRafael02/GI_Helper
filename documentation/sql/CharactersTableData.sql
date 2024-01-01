--Credits to (https://genshin.honeyhunterworld.com/) for the Data

--Main Tables
CREATE TABLE Characters (
    id BIGSERIAL PRIMARY KEY,
    Name VARCHAR(50),
    Star INTEGER,
    Element_ID INT REFERENCES Elements(id),
    WeaponType_ID INT REFERENCES WeaponTypes(id),
    Region_ID INT REFERENCES Regions(id),
    SkillDomain_ID INT REFERENCES AscensionDomains(id),
    SkillDomainMaterials_ID INT REFERENCES SkillDomainMaterials(id),
    EnhancementMatID INT REFERENCES EnhancementMatSet(id),
    CharacterAscensionMatID INT REFERENCES LevelUpMaterialsSet(id),
    BossMaterial INT REFERENCES CharacterLevelUpMaterial(id),
    TrounceDomainMaterial INT REFERENCES SpecTrounceDomainMat(id),
    LocalSpecialty_ID INT REFERENCES LocalSpecialties(id),
    Availabilties INT REFERENCES Availability(id),
    ImgURL VARCHAR(30)
);
INSERT INTO Characters (
    Name, 
    Star,                   -- St
    Element_ID,             -- El
    WeaponType_ID,          -- Wt
    Region_ID,              -- R 
    SkillDomain_ID,         -- SD
    SkillDomainMaterials_ID,-- SM (Skill mats)
    EnhancementMatID,       -- eM (Mob Loot)
    CharacterAscensionMatID,-- CM (Gems)
    BossMaterial,           -- BM (Boss Loot)
    TrounceDomainMaterial,  -- TM (Weekly Domain)
    LocalSpecialty_ID,      -- LS (Region Specialty)
    Availabilties,          -- A
    ImgURL)                 -- U
VALUES
--Name                  St El WT R SD SM  eM CM BM TM LS A  U
('Amber',               4, 1, 5, 1, 1, 1, 4, 1,13, 3, 6, 1, '/amber.png'),
('Kaeya',               4, 6, 1, 1, 1, 3,19, 6,17, 6, 7, 3, '/kaeya.png'),
('Lisa',                4, 4, 4, 1, 1, 3, 1, 4, 4, 2, 2, 3, '/lisa.png'),
('Barbara',             4, 2, 4, 1, 1, 1, 6, 2, 8, 5, 5, 1, '/barbara.png'),
('Razor',               4, 4, 2, 1, 1, 2, 3, 4, 4, 2, 1, 2, '/razor.png'),
('Xiangling',           4, 1, 3, 2, 3, 5, 1, 1,13, 2, 8, 2, '/xiangling.png'),
('Beidou',              4, 4, 2, 2, 3, 6,19, 4, 4, 3,10, 3, '/beidou.png'),
('Xingqiu',             4, 2, 1, 2, 3, 6, 3, 4, 4, 4,12, 3, '/xingqiu.png'),
('Ningguang',           4, 7, 4, 2, 3, 4,11, 7, 7, 6,11, 1, '/ningguang.png'),
('Fischl',              4, 4, 5, 1, 1, 3, 4, 4, 4, 6, 6, 3, '/fischl.png'),
('Bennett',             4, 1, 1, 1, 1, 2,19, 1,13, 1, 4, 2, '/bennett.png'),
('Noelle',              4, 7, 3, 1, 1, 2, 3, 7, 7, 2, 2, 2, '/noelle.png'),
('Chongyun',            4, 6, 2, 2, 3, 5, 3, 6,17, 3,16, 2, '/chongyun.png'),
('Sucrose',             4, 3, 4, 1, 1, 1,22, 3, 3, 6, 4, 1, '/sucrose.png'),
('Jean',                5, 3, 1, 1, 1, 2, 3, 3, 3, 1, 9, 2, '/jean.png'),
('Diluc',               5, 1, 2, 1, 1, 2,11, 1,13, 1, 6, 2, '/diluc.png'),
('Qiqi',                5, 6, 1, 2, 3, 4, 5, 6,17, 4,16, 1, '/qiqi.png'),
('Mona',                5, 2, 4, 1, 1, 2,22, 2, 8, 5, 5, 2, '/mona.png'),
('Keqing',              5, 4, 1, 2, 3, 4,22, 4, 4, 5,16, 1, '/keqing.png'),
('Venti',               5, 3, 5, 1, 1, 3, 1, 3, 3, 4, 3, 3, '/venti.png'),
('Klee',                5, 1, 4, 1, 1, 1, 6, 1,13, 5, 5, 1, '/klee.png'),
('Diona',               4, 6, 5, 1, 1, 1, 4, 6,17, 8, 7, 1, '/diona.png'),
('Tartaglia',           5, 2, 5, 2, 1, 1,11, 2, 8, 8,14, 1, '/tartaglia.png'),
('Xinyan',              4, 1, 3, 2, 3, 6,19, 1,13, 7,16, 3, '/xinyan.png'),
('Zhongli',             5, 7, 3, 1, 1, 3, 6, 7, 7, 7, 3, 3, '/albedo.png'),
('Ganyu',               5, 6, 5, 2, 3, 5,22, 6,17, 9,13, 2, '/ganyu.png'),
('Xiao',                5, 3, 3, 2, 3, 4, 1, 3,19, 9,13, 1, '/xiao.png'),
('Hu Tao',              5, 1, 3, 2, 3, 5,22, 1,19, 8,11, 2, '/hutao.png'),
('Rosaria',             4, 6, 3, 1, 1, 3,11, 6,17, 9, 2, 3, '/rosaria.png'),
('Yanfei',              4, 1, 4, 2, 3, 6,19, 1,19,11,10, 3, '/yanfei.png'),
('Eula',                5, 6, 2, 1, 1, 2, 3, 6, 6,10, 9, 2, '/eula.png'),
('Kaedehara Kazuha',    5, 3, 1, 3, 3, 5,19, 3,12,12,22, 2, '/kazuha.png'),
('Kamisato Ayaka',      5, 6, 1, 3, 5, 8,20, 6,10,11,18, 2, '/ayaka.png'),
('Sayu',                4, 3, 2, 3, 5, 9,22, 3,12,13,19, 3, '/sayu.png'),
('Yoimiya',             5, 1, 5, 3, 5, 7, 6, 1, 1,11,21, 1, '/yoimiya.png'),
('Aloy',                5, 6, 5, 1, 1, 1, 2, 6, 6,14,19, 1, '/aloy.png'),
('Kujou Sara',          4, 4, 5, 3, 5, 8, 3, 4,18,16,20, 2, '/sara.png'),
('Raiden Shogun',       5, 4, 3, 3, 5, 9,20, 4,18,14,24, 3, '/shogun.png'),
('Sangonomiya Kokomi',  5, 2, 4, 3, 5, 7, 2, 2, 2,15,32, 1, '/kokomi.png'),
('Thoma',               4, 1, 3, 3, 5, 7,19, 1, 1,15,25, 1, '/thoma.png'),
('Gorou',               4, 7, 5, 3, 5, 9, 2, 7,10,14,32, 3, '/gorou.png'),
('Arataki Itto',        5, 7, 2, 3, 5, 8, 1, 7, 9,16,17, 2, '/itto.png'),
('Yun Jin',             4, 7, 3, 2, 3, 5, 3, 7, 9,16,12, 2, '/yunjin.png'),
('Shenhe',              5, 6, 3, 2, 3, 4,22, 6,20,15,13, 1, '/shenhe.png'),
('Yae Miko',            5, 4, 4, 3, 5, 9,20, 4,20,19,22, 3, '/yaemiko.png'),
('Kamisato Ayato',      5, 2, 1, 3, 5, 8,20, 2,12,17,18, 2, '/ayato.png'),
('Kuki Shinobu',        4, 4, 1, 3, 5, 8, 2, 4, 9,18,21, 2, '/shinobu.png'),
('Yelan',               5, 2, 5, 2, 3, 4,11, 2, 9,13,14, 1, '/yelan.png'),
('Shikanoin Heizou',    4, 3, 4, 3, 5, 7,19, 3, 9,19,17, 1, '/heizo.png'),  
('Collei',              4, 5, 5, 4, 7,12, 4, 5,15,18,26, 3, '/collei.png'),
('Dori',                4, 4, 2, 4, 7,11,21, 4,16,11,29, 2, '/dori.png'),
('Tighnari',            5, 5, 5, 4, 7,10,24, 5,15,19,28, 1, '/tighnari.png'),       
('Candace',             4, 2, 3, 4, 7,10,21, 2,26,18,30, 1, '/candace.png'),
('Cyno',                5, 4, 3, 4, 7,10, 6, 4,16,17,33, 1, '/cyno.png'),
('Nilou',               5, 2, 1, 4, 7,12,24, 2,11,18,27, 3, '/nilou.png'),
('Layla',               4, 6, 1, 4, 7,11, 6, 6,11,21,28, 2, '/layla.png'),
('Nahida',              5, 5, 4, 4, 7,11,24, 5, 5,20,29, 2, '/nahida.png'),
('Wanderer',            5, 3, 4, 4, 7,12,20, 3,11,22,26, 3, '/wanderer.png'),
('Faruzan',             4, 3, 5, 4, 7,10,21, 3,26,20,30, 1, '/faruzan.png'),
('Alhaitham',           5, 5, 1, 4, 7,10,21, 5,21,21,31, 2, '/alhaitham.png'),
('Yaoyao',              4, 5, 3, 2, 3, 5, 1, 5, 5,22, 8, 2, '/yaoyao.png'),
('Dehya',               5, 1, 2, 4, 7,12,21, 1,26,20,31, 3, '/dehya.png'),
('Mika',                4, 6, 3, 1, 1, 3,11, 6,21,21, 1, 3, '/mika.png'),
('Baizhu',              5, 5, 4, 2, 3, 6,24, 5, 5,23,16, 3, '/baizhu.png'),
('Kaveh',               4, 5, 2, 4, 7,11,24, 5, 5,24,32, 2, '/kaveh.png'),
('Kirara',              4, 5, 1, 3, 5, 7, 2, 5,22,24,24, 1, '/kirara.png'),
('Lyney',               5, 1, 5, 5, 9,13,11, 5,25,23,36, 1, '/lyney'),
('Lynette',             4, 3, 1, 5, 9,15,20, 1,23,24,25, 3, '/lynette'),
('Freminet',            4, 6, 2, 5, 9,14,31, 6,24,22,34, 2, '/freminet'),
('Neuvillete',          5, 2, 4, 5, 9,13,31, 2,28,24,37, 1, '/neuvillete'),
('Wriothesley',         5, 6, 4, 5, 9,15,30, 6,27,23,38, 3, '/wriothesley'),
('Furina',              5, 2, 1, 5, 9,14,22, 2,29,27,40, 2, '/furina'),
('Charlotte',           4, 6, 4, 5, 9,14,30, 6,27,26,39, 2, '/charlotte'),
('Navia',               5, 7, 2, 5, 9,13,31, 7,28,25,41, 1, '/navia'),
('Chevreuse',           4, 1, 3, 5, 9,15,30, 1,24,26,35, 3, '/chevreuse')
('Xianyun',             5, 3, 4, 2, 3, 4, 6, 3,30,26,42, 3, '/xianyun'),
('Gaming',              4, 1, 2, 2, 3, 6, 1, 1,25,27,14, 1, '/gaming')
--('',                      ,  ,  ,  ,  ,  ,  ,  ,  ,  ,  ,  , ''),
;

CREATE VIEW allCharacters AS 
SELECT 
    Characters.id,
    Characters.name,
    Characters.star,
    el.element,
    wt.type,
    re.region,
    sd.DomainName,
    STRING_TO_ARRAY(CONCAT(ss.Mat3, ',', ss.Mat4, ',', ss.Mat5), ',') as SkillMats,
    STRING_TO_ARRAY(CONCAT(em.Mat1, ',', em.Mat2, ',', em.Mat3), ',') as EnhanceMats,
    STRING_TO_ARRAY(CONCAT(cm.Gem2, ',', cm.Gem3, ',', cm.Gem4, ',', cm.Gem5), ',') as GemMats,
    bm.Material AS BossMats,
    tdm.MateriaL AS TrounceMats,
    ls.MateriaL AS LocalSpecialty,
    Availability.days,
    Characters.ImgURL
FROM Characters
LEFT JOIN elements AS el ON Characters.element_id = el.id
LEFT JOIN WeaponTypes AS wt ON Characters.WeaponType_ID = wt.id
LEFT JOIN regions AS re ON Characters.Region_ID = re.id
LEFT JOIN AscensionDomains AS sd ON Characters.SkillDomain_ID = sd.id
LEFT JOIN allSkillMatset AS ss ON Characters.SkillDomainMaterials_ID = ss.id
LEFT JOIN allMobLootSets AS em ON Characters.EnhancementMatID = em.id
LEFT JOIN allGemsSets AS cm ON Characters.CharacterAscensionMatID = cm.id
LEFT JOIN CharacterLevelUpMaterial AS bm ON Characters.BossMaterial = bm.id
LEFT JOIN spectrouncedomainmat as tdm ON Characters.TrounceDomainMaterial = tdm.id
LEFT JOIN LocalSpecialties as ls on Characters.LocalSpecialty_ID = ls.id
LEFT JOIN Availability on Characters.availabilties = Availability.id
ORDER by Characters.id
;


SELECT * FROM allCharacters
-- *PICK CONDITION HERE And Uncomment One*
-- WHERE 'Monday'  = ANY(days)
-- WHERE 'Tuesday'  = ANY(days)
-- WHERE 'Wednesday'  = ANY(days)
-- WHERE 'Thursday'  = ANY(days)
-- WHERE 'Friday'  = ANY(days)
-- WHERE 'Saturday'  = ANY(days)
-- WHERE 'Sunday'  = ANY(days)
;
