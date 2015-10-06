set trimspool on
set trimout on
set echo off
set verify off
set linesize 255;
set pagesize 50000;
set timing off;
set long 20000000;

-- Exit on error
WHENEVER SQLERROR EXIT FAILURE

  alter session set nls_date_format='dd-mm-yyyy hh24:mi:ss';  

  select sql_id,plan_hash_value,sum(executions), trunc((sum(elapsed_time)/1000)/sum(executions),3) as exec_time_ms, last_active_time
  from v$sqlstats t
  where 1=1 
  and   elapsed_time>0
  and   executions>0
  and   sql_text like '%&sql_text%'
  group by sql_id,plan_hash_value,last_active_time
  order by 4 desc;