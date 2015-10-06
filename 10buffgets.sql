set linesize 999
set pagesize 999
set pages 999

spool buffgets.lst

--Top 10 sql by buffer gets 
select a.sql_id, trunc(a.ratio,2) as Buff_Gets_Per_Exec, a.executions,sql_fulltext
from  
(
  select sql_id, buffer_gets / executions ratio, executions,sql_fulltext
  from v$sql
  where executions > 10
  order by 2 desc
) a
where rownum <= 10

spool off
