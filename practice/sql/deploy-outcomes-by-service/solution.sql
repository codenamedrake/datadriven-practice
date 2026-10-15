select trim(lower(svc_name)),count(case when trim(lower(status) = 'success') then 1 END) as success_count,
count(case when trim(lower(status) = 'failed') then 1 END) as failed_count,
count(case when trim(lower(status) = 'rolled_back') then 1 END) as rolled_back_count from deploy_logs group by trim(lower(svc_name))
