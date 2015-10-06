set linesize 999
set pages 999

accept start_time char prompt "Enter start time (dd-mm-yyyy hh24:mi) :"
accept end_time char prompt "Enter end time (dd-mm-yyyy hh24:mi) :"

rem "Top Statements between &start_time and &end_time"

SELECT TO_CHAR(MIN(s.end_interval_time),'DD-MON-YYYY DY HH24:MI:SS') sample_end ,
  q.sql_id ,
  q.plan_hash_value ,
  SUM(q.EXECUTIONS_DELTA) executions ,
  ROUND((SUM(ELAPSED_TIME_delta)/greatest(SUM(executions_delta),1)/1000),1) msec_exec ,
  ROUND(SUM(DISK_READS_delta)   /greatest(SUM(executions_delta),1),1) pio_per_exec ,
  ROUND(SUM(BUFFER_GETS_delta)  /greatest(SUM(executions_delta),1),1) lio_per_exec ,
  ROUND(SUM(CPU_TIME_DELTA)     /greatest(SUM(executions_delta),1),1) cpu_per_exec ,
  ROUND(SUM(IOWAIT_DELTA)       /greatest(SUM(executions_delta),1),1) iowait_per_exec ,
  ROUND(SUM(APWAIT_DELTA)       /greatest(SUM(executions_delta),1),1) appwait_per_exec
FROM dba_hist_sqlstat q,
  dba_hist_snapshot s
WHERE 1                    =1
AND s.snap_id              = q.snap_id
AND s.dbid                 = q.dbid
AND s.instance_number      = q.instance_number
AND s.end_interval_time   >= to_date(trim('&start_time'),'dd-mm-yyyy hh24:mi')
AND s.begin_interval_time <= to_date(trim('&end_time'),'dd-mm-yyyy hh24:mi')
GROUP BY s.snap_id ,
  q.sql_id ,
  q.plan_hash_value
ORDER BY msec_exec DESC
/
 