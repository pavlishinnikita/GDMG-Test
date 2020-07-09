SELECT c1.id, c1.name, c2.id, c2.name, c3.id, c3.name, c4.id, c4.name, c5.id, c5.name FROM Category c1
  LEFT JOIN Category c2
    ON c1.parent_id = c2.id
  LEFT JOIN Category c3
    ON c2.parent_id = c3.id
  LEFT JOIN Category c4
    ON c3.parent_id = c4.id 
  LEFT JOIN Category c5
    ON c4.parent_id = c5.id  
WHERE c1.id = 7