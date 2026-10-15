WITH first_author AS (
    SELECT repo_name, author,
               ROW_NUMBER() OVER(PARTITION BY repo_name ORDER BY opened_at ASC, author ASC) AS rn
        FROM code_reviews
        )
        SELECT c.review_id, c.repo_name, c.author, f.author AS most_tenured_author
        FROM code_reviews c
        JOIN first_author f ON c.repo_name = f.repo_name AND f.rn = 1
        ORDER BY c.repo_name ASC, c.author ASC, c.review_id ASC;
