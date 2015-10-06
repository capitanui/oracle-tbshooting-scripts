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




  undefine plan_hash_value
-- Get execution plan for a plan_hash_value
  define plan_hash_value=&1
  column sql_id new_value m_sql_id
  column child_number new_value m_child_no

-- Get sql_id  
  select sql_id,child_number from v$sql where plan_hash_value='&plan_hash_value';

spool c:\Workarea\Scripts\Spool\planstats_&&m_sql_id..sql
 select * from table(dbms_xplan.display_cursor('&m_sql_id',&m_child_no));

--nr of parent cursors
  select count(distinct sql_id) from v$sql where plan_hash_value='&plan_hash_value';
 
-- sql elapsed time per exec from memory for a specific plan_hash_value
  select sql_id, trunc((sum(elapsed_time)/1000)/sum(executions),3) as exec_time_ms
  from v$sqlstats t
  where plan_hash_value='&plan_hash_value'
  and   elapsed_time>0
  and   executions>0
  group by sql_id
  order by 2 desc;
  
  -- historic elapsed time per executions for sqls with a specific plan_hash_value
  select sql_id, trunc(sum(t.elapsed_time_delta/1000)/sum(t.executions_delta),3) as exec_time_ms_hist
  from dba_hist_sqlstat t
  where plan_hash_value='&plan_hash_value'
  and   elapsed_time_delta>0
  and   executions_delta>0
  group  by t.sql_id
  order by 2 desc;

spool off 