set linesize 255
set pages 999
select * from table(dbms_xplan.display_cursor(null,null,'allstats last advanced'));
/