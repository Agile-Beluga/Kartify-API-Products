-- DROP TABLE IF EXISTS photos;
-- DROP TABLE IF EXISTS tempPhotos;
-- DROP TABLE IF EXISTS skus;
-- DROP TABLE IF EXISTS features;
-- DROP TABLE IF EXISTS styles;
-- DROP TABLE IF EXISTS products;
-- DROP TABLE IF EXISTS related;
-- CREATE TABLE products (
--     ID INT PRIMARY KEY,
--     NAME VARCHAR (100) NOT NULL,
--     SLOGAN VARCHAR (1000),
--     DESCRIPTION VARCHAR (1000),
--     CATEGORY VARCHAR (100) NOT NULL,
--     DEFAULT_PRICE VARCHAR (100)
-- );

-- COPY products (id, name, slogan, description, category, default_price) 
-- FROM './csv-files/product.csv' DELIMITER ',' CSV HEADER;

-- CREATE TABLE styles (
--     ID INTEGER PRIMARY KEY,
--     PRODUCT_ID INTEGER,
--     NAME VARCHAR (100) NOT NULL,
--     SALE_PRICE VARCHAR (100),
--     ORIGINAL_PRICE VARCHAR (100),
--     DEFAULT_ITEM INTEGER,
--     FOREIGN KEY (PRODUCT_ID) REFERENCES products(ID)
-- );

-- COPY styles 
-- FROM './csv-files/styles.csv' DELIMITER ',' CSV HEADER;

-- CREATE TABLE features (
--     ID INTEGER PRIMARY KEY,
--     PRODUCT_ID INTEGER,
--     FEATURE VARCHAR (1000),
--     VALUE VARCHAR (1000),
--     FOREIGN KEY (PRODUCT_ID) REFERENCES products(ID)
-- );

-- COPY features 
-- FROM './csv-files/features.csv' DELIMITER ',' CSV HEADER;

-- CREATE TABLE skus (
--     ID INTEGER PRIMARY KEY,
--     STYLE_ID INTEGER,
--     SIZE VARCHAR (10),
--     QUANTITY VARCHAR (1000),
--     FOREIGN KEY (STYLE_ID) REFERENCES styles(ID)
-- );

-- COPY skus 
-- FROM './csv-files/skus.csv' DELIMITER ',' CSV HEADER;

-- CREATE TABLE tempPhotos (
--     ID INTEGER,
--     STYLE_ID INTEGER,
--     THUMBNAIL_URL VARCHAR (100000),
--     URL VARCHAR (100000)
-- );

-- COPY tempPhotos 
-- FROM './csv-files/photos.csv' DELIMITER ',' CSV HEADER;

-- CREATE TABLE photos (
--     ID INTEGER PRIMARY KEY,
--     STYLE_ID INTEGER,
--     THUMBNAIL_URL VARCHAR (100000),
--     URL VARCHAR (100000),
--     FOREIGN KEY (STYLE_ID) REFERENCES styles(ID)
-- );

INSERT INTO photos SELECT * FROM tempPhotos ON CONFLICT DO NOTHING;
DROP TABLE tempPhotos;
-- CREATE TABLE related (
--     ID INTEGER PRIMARY KEY,
--     CURRENT_PRODUCT_ID INTEGER,
--     RELATED_PRODUCT_ID INTEGER
-- );

-- COPY related
-- FROM './csv-files/related.csv' DELIMITER ',' CSV HEADER;

CREATE INDEX sku_style_id_index ON skus (style_id);
CREATE INDEX styles_product_id_index ON styles (product_id);
CREATE INDEX features_product_id_index ON features (product_id);
CREATE INDEX photos_style_id_index ON photos (style_id);
CREATE INDEX related_current_product_id_index ON related (current_product_id);


---- TO CHANGE DATATYPES
-- ALTER TABLE styles
-- ALTER COLUMN default_item TYPE INTEGER USING default_item::integer;

