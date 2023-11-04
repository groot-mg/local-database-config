CREATE SCHEMA sales_catalog;
CREATE USER sales_catalog_user WITH ENCRYPTED PASSWORD 'sales_catalog_pass';
-- GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA sales_catalog TO sales_catalog_user;
GRANT ALL PRIVILEGES ON SCHEMA sales_catalog TO sales_catalog_user;

-- Table: sales_catalog.products

-- DROP TABLE IF EXISTS sales_catalog.products;

CREATE TABLE IF NOT EXISTS sales_catalog.products
(
    product_id uuid NOT NULL,
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    description character varying(256) COLLATE pg_catalog."default",
    price numeric(10,2) NOT NULL,
    quantity bigint NOT NULL,
    is_reserved boolean NOT NULL,
    is_sold boolean NOT NULL,
    sales_user_id uuid NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    last_update_at timestamp(6) without time zone,
    is_deleted boolean NOT NULL,
    CONSTRAINT products_pkey PRIMARY KEY (product_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sales_catalog.products
    OWNER to sales_catalog_user;

-- Include new column
ALTER TABLE sales_catalog.products ADD COLUMN deleted_at timestamp(6) without time zone NULL;