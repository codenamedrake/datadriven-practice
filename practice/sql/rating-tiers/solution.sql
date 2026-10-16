SELECT 
    product_name, 
    category, 
    rating, 
    DENSE_RANK() OVER (PARTITION BY category ORDER BY FLOOR(rating) DESC) AS position
FROM 
    products
WHERE 
    rating IS NOT NULL
ORDER BY 
    category ASC, 
    position ASC, 
    rating DESC;
