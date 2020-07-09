BEGIN

    DECLARE x,y INT;

    SET x = 0;
    SET y = 1;
    SET @SQ = '';
    SET @SO = 'SELECT ';
    SET @SF = '';
    WHILE y <= maxDepth DO
    	IF y = maxDepth THEN 
   		SET @SF = CONCAT(@SF, 'A',x, '.id, A', x, '.name ');
   	ELSE
   		SET @SF = CONCAT(@SF, 'A',x, '.id, A', x, '.name, ');
		END IF;
      SET @SQ = CONCAT(@SQ,' LEFT JOIN Category A',y,' ON A',x,'.parent_id = A',y,'.id');
      SET x = y;
      SET y = x + 1;
    END WHILE;
    SET @SO = CONCAT(@SO, @SF);
    SET @SO = CONCAT(@SO, 'FROM Category AS A0 ', @SQ);
    SET @SO = CONCAT(@SO,' WHERE A0.id = ', category_id);
    PREPARE stmt FROM @SO;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END