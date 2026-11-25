-- Aperçu de 10 commandes
select *
from orders
limit10;

-- 1. Aperçu de 5 produits
select *
from products
limit 5;

-- 2. Identifiant, statut et date d'achat de 10 commandes
select order_id, order_status, order_purchase_timestamp
from orders
limit 10;

-- 3. Identifiant, ville et État de 15 vendeurs
select seller_id, seller_city, seller_state
from sellers
limit 15;


--notion 2

-- 1. Vendeurs de l'État de Rio de Janeiro (RJ)
select *
from sellers
where seller_state = 'RJ';

-- 2. Articles vendus à plus de 1000
select *
from order_items
where price > 1000;

-- 3. Commandes annulées passées depuis le 1er janvier 2018
select *
from orders
where order_status = 'canceled' and order_purchase_timestamp >= '2018-01-01';

-- 4. 20 clients des États SP, RJ ou MG
select * 
from customers
where customer_state in ('SP' , 'RJ' , 'MG')
limit 20;

-- 5. Produits entre 50 et 100 avec moins de 10 de frais de port
select *
from products
where price between 50 and 100 and freight_value < 10;

--notion 3

-- 1. Liste des statuts de commande, sans doublons
SELECT DISTINCT order_status
FROM orders;

-- 2. Les 10 articles les plus chers
SELECT *
FROM order_items
ORDER BY price DESC
LIMIT 10;

-- 3. Les 20 commandes les plus récentes
SELECT order_id, order_purchase_timestamp
FROM orders
ORDER BY order_purchase_timestamp DESC
LIMIT 20;

-- 4. Liste des États avec des clients, triés par ordre alphabétique
SELECT DISTINCT customer_state
FROM customers
ORDER BY customer_state ASC;

-- 5. Vendeurs de SP, triés par ville puis par seller_id
SELECT seller_id, seller_city, seller_state
FROM sellers
WHERE seller_state = 'SP'
ORDER BY seller_city, seller_id;