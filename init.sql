CREATE DATABASE sales_catalog;
CREATE USER sales_catalog_user WITH ENCRYPTED PASSWORD 'sales_catalog_pass';
GRANT ALL PRIVILEGES ON DATABASE sales_catalog TO sales_catalog_user;