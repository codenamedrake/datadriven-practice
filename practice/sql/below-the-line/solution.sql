with cte as ( select EXTRACT(YEAR from run_at) as yr,severity from dq_checks)
select count(*) from cte where yr='2026' and severity ='low'
