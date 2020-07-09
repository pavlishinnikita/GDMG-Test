SELECT COUNT(Opportunity.id) as 'Count of opportunity', Opportunity.id, Opportunity.product_id, Opportunity.quantity, ProductToCategory.product_id, ProductToCategory.category_id 
FROM Opportunity LEFT JOIN ProductToCategory ON Opportunity.product_id = ProductToCategory.product_id
WHERE ProductToCategory.category_id IN (1, 6, 3, 4)
GROUP BY ProductToCategory.category_id