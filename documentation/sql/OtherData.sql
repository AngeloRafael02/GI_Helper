CREATE TABLE LocalSpecialties (
    id SERIAL PRIMARY KEY,
    Material VARCHAR(30),
    Region_ID INT REFERENCES Regions(id) 
);
INSERT INTO LocalSpecialties (Material, Region_ID) VALUES
    ('Wolfhook',1),
    ('Valberry',1),
    ('Cecilia',1),
    ('Windwheel Aster',1),
    ('Philanemo Mushroom',1), --5
    ('Small Lamp Grass',1),
    ('Calla Lily',1),
    ('Jueyun Chili',2),
    ('Dandelion Seed',2),
    ('Noctilucous Jade',2), --10
    ('Silk Flower',2),
    ('Glaze Lily',2),
    ('Qingxin',2),
    ('Starconch',2),
    ('Violetgrass',2), --15
    ('Cor Lapis',2),
    ('Onikabuto',3),
    ('Sakura Bloom',3),
    ('Crystal Marrow',3),
    ('Dendrobium',3), --20
    ('Naku Weed',3),
    ('Sea Ganoderma',3),
    ('Sango Pearl',3),
    ('Amakumo Fruit',3),
    ('Fluorescent Fungus',3), --25
    ('Rukkhashava Mushrooms',4),
    ('Padisarah',4),
    ('Nilotpala Lotus',4),
    ('Kalpalata Lotus',4),
    ('Henna Berry',4), --30
    ('Sand Grease Pupa',4),
    ('Mourning Flower',4),
    ('Scarab',4),
    ('Romaritime Flower',5),
    ('Lumidouce Bell',5), --35
    ('Rainbow Rose',5),
    ('Lumitolle',5),
    ('Subdetection Unit',5),
    ('Beryl Conch', 5),
    ('Lakelight Lily', 5), --40
    ('Spring of the First Dewdrop', 5),
    ('Clearwater Jade',2)
;