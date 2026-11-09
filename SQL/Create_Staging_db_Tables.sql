CREATE DATABASE Olist_Staging;
GO
USE Olist_Staging;
GO
CREATE SCHEMA stg;
GO

CREATE TABLE stg.customers (
    customer_id               VARCHAR(50),
    customer_unique_id        VARCHAR(50),
    customer_zip_code_prefix  VARCHAR(10),
    customer_city             NVARCHAR(100),
    customer_state            VARCHAR(5),
    load_date   DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    source_file VARCHAR(100)  NOT NULL DEFAULT 'olist_customers_dataset.csv'
);

CREATE TABLE stg.geolocation (
    geolocation_zip_code_prefix VARCHAR(10),
    geolocation_lat             VARCHAR(30),
    geolocation_lng             VARCHAR(30),
    geolocation_city            NVARCHAR(100),
    geolocation_state           VARCHAR(5),
    load_date   DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    source_file VARCHAR(100)  NOT NULL DEFAULT 'olist_geolocation_dataset.csv'
);

CREATE TABLE stg.order_items (
    order_id            VARCHAR(50),
    order_item_id       VARCHAR(10),
    product_id          VARCHAR(50),
    seller_id           VARCHAR(50),
    shipping_limit_date VARCHAR(30),
    price               VARCHAR(30),
    freight_value       VARCHAR(30),
    load_date   DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    source_file VARCHAR(100)  NOT NULL DEFAULT 'olist_order_items_dataset.csv'
);

CREATE TABLE stg.order_payments (
    order_id             VARCHAR(50),
    payment_sequential   VARCHAR(10),
    payment_type         VARCHAR(30),
    payment_installments VARCHAR(10),
    payment_value        VARCHAR(30),
    load_date   DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    source_file VARCHAR(100)  NOT NULL DEFAULT 'olist_order_payments_dataset.csv'
);

CREATE TABLE stg.order_reviews (
    review_id               VARCHAR(50),
    order_id                VARCHAR(50),
    review_score            VARCHAR(5),
    review_comment_title    NVARCHAR(500),
    review_comment_message  NVARCHAR(2000),
    review_creation_date    VARCHAR(30),
    review_answer_timestamp VARCHAR(30),
    load_date   DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    source_file VARCHAR(100)  NOT NULL DEFAULT 'olist_order_reviews_dataset.csv'
);

CREATE TABLE stg.orders (
    order_id                      VARCHAR(50),
    customer_id                   VARCHAR(50),
    order_status                  VARCHAR(30),
    order_purchase_timestamp      VARCHAR(30),
    order_approved_at             VARCHAR(30),
    order_delivered_carrier_date  VARCHAR(30),
    order_delivered_customer_date VARCHAR(30),
    order_estimated_delivery_date VARCHAR(30),
    load_date   DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    source_file VARCHAR(100)  NOT NULL DEFAULT 'olist_orders_dataset.csv'
);

CREATE TABLE stg.products (
    product_id                 VARCHAR(50),
    product_category_name      NVARCHAR(100),
    product_name_lenght        VARCHAR(10),
    product_description_lenght VARCHAR(10),
    product_photos_qty         VARCHAR(10),
    product_weight_g           VARCHAR(10),
    product_length_cm          VARCHAR(10),
    product_height_cm          VARCHAR(10),
    product_width_cm           VARCHAR(10),
    load_date   DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    source_file VARCHAR(100)  NOT NULL DEFAULT 'olist_products_dataset.csv'
);

CREATE TABLE stg.sellers (
    seller_id              VARCHAR(50),
    seller_zip_code_prefix VARCHAR(10),
    seller_city            NVARCHAR(100),
    seller_state           VARCHAR(5),
    load_date   DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    source_file VARCHAR(100)  NOT NULL DEFAULT 'olist_sellers_dataset.csv'
);

CREATE TABLE stg.product_category_name_translation (
    product_category_name         NVARCHAR(100),
    product_category_name_english NVARCHAR(100),
    load_date   DATETIME2     NOT NULL DEFAULT SYSDATETIME(),
    source_file VARCHAR(100)  NOT NULL DEFAULT 'product_category_name_translation.csv'
);