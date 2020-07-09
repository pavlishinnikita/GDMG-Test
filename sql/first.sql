SELECT ProductToCategory.id, product_id, category_id, name FROM ProductToCategory LEFT JOIN Category USING(id) 
WHERE product_id IN(1,2) 
GROUP BY name