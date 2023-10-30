CREATE SCHEMA groot_mg;
CREATE USER sales_catalog_user WITH ENCRYPTED PASSWORD 'sales_catalog_pass';
-- GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA groot_mg TO sales_catalog_user;
GRANT ALL PRIVILEGES ON SCHEMA groot_mg TO sales_catalog_user;

-- Table: groot_mg.products

-- DROP TABLE IF EXISTS groot_mg.products;

CREATE TABLE IF NOT EXISTS groot_mg.products
(
    product_id uuid NOT NULL,
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    description character varying(255) COLLATE pg_catalog."default",
    price numeric(38,2) NOT NULL,
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

ALTER TABLE IF EXISTS groot_mg.products
    OWNER to sales_catalog_user;