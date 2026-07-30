break on RESOURCE_NAME skip 2;
set linesize 2000;
col end_interval_time for a40;
select
  rn.RESOURCE_NAME,
  s.instance_number,
  s.end_interval_time,
  rn.current_utilization,
  rn.max_utilization
from
  dba_hist_snapshot s
  join dba_hist_resource_limit rn on (s.snap_id = rn.snap_id and s.instance_number = rn.instance_number)
where
  rn.resource_name = 'sessions'
  and s.end_interval_time >= trunc(sysdate - 7)
order by
  s.end_interval_time,instance_number;