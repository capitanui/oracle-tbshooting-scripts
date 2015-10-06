set heading on
set pagesize 180
set pages 999
select sql_id, plan_hash_value, sql_profile from v$sqlarea where sql_profile in (select name  from dba_sql_profiles);
