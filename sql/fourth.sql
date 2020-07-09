SELECT COUNT(DISTINCT(Opportunity.id)) 'UNIQUE COUNT', Opportunity.product_id 'Opp prod id', ProductToCategory.product_id 'prod2Cat prod id', ProductToCategory.category_id 
FROM Opportunity LEFT JOIN ProductToCategory USING(product_id)
WHERE ProductToCategory.category_id IN (1, 2, 3, 4, 5, 6)
GROUP BY ProductToCategory.category_id
