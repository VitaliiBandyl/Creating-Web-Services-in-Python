use test
set names utf8;

-- 1. Выбрать все товары (все поля)
select * from product;

-- 2. Выбрать названия всех автоматизированных складов
select name from store where is_automated=1;

-- 3. Посчитать общую сумму в деньгах всех продаж
select sum(total) from sale;

-- 4. Получить уникальные store_id всех складов, с которых была хоть одна продажа
select distinct store_id from sale;


-- 5. Получить уникальные store_id всех складов, с которых не было ни одной продажи
select DISTINCT st.store_id from store st NATURAL LEFT JOIN sale sa where sa.sale_id is NULL;

-- 6. Получить для каждого товара название и среднюю стоимость единицы товара avg(total/quantity), если товар не продавался, он не попадает в отчет.
select p.name, AVG(s.total/s.quantity) from product p NATURAL JOIN sale s GROUP BY s.product_id;


-- 7. Получить названия всех продуктов, которые продавались только с единственного склада
select p.name from sale s NATURAL JOIN product p GROUP BY s.product_id having COUNT(DISTINCT s.store_id)=1;

-- 8. Получить названия всех складов, с которых продавался только один продукт
select st.name from sale s NATURAL JOIN store st GROUP BY s.store_id having COUNT(DISTINCT s.product_id)=1;

-- 9. Выберите все ряды (все поля) из продаж, в которых сумма продажи (total) максимальна (равна максимальной из всех встречающихся)
select sale.* from sale JOIN (select max(total) as max_val from sale) temp ON sale.total = temp.max_val;

-- 10. Выведите дату самых максимальных продаж, если таких дат несколько, то самую раннюю из них
select date from sale GROUP BY date ORDER BY sum(total) DESC, date ASC LIMIT 1;