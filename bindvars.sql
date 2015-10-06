/* Extract bind variables from  V$SQL_PLAN other_xml column for a specific query
and rewrite the query with the binds to be used for testing 

Scripts accepts 2 parameters : sql_id child_number
File with query will be spooled on : c:\Workarea\Scripts\Spool\
*/

--set sqlblanklines on
set trimspool on
set trimout on
set feedback off;
set linesize 32676;
set pagesize 50000;
set timing off;
set head off
set echo off;
set verify off;
set long 20000000;

-- Exit on error
WHENEVER SQLERROR EXIT FAILURE

-- Variables
define sql_id=&1
define child_no=&2
var isdigits number
var bind_count number
var   cn     number
--col sql_fulltext for a240 word_wrap
--
--
spool c:\Workarea\Scripts\Spool\bindvars_&&sql_id..sql

begin
--
-- Check for Bind Variables
--
SELECT COUNT(*)
INTO :bind_count
FROM V$SQL_BIND_CAPTURE
WHERE sql_id = '&&sql_id';
--
--Check for numeric bind variable names
--
IF :bind_count > 0 THEN
  SELECT
      CASE regexp_substr(REPLACE(name,':',''),'[[:digit:]]')
      WHEN REPLACE(name,':','')
      THEN 1
    END
  INTO :isdigits
  FROM V$SQL_BIND_CAPTURE
  WHERE sql_id     ='&&sql_id'
  AND child_number = &&child_no
  AND rownum < 2;
END IF;
END;
/
--
-- Create variable statements
--
SELECT
  CASE
    WHEN :bind_count > 0
    THEN 'variable '
      ||
      CASE :isdigits
        WHEN 1
        THEN REPLACE(name,':','N')
        ELSE SUBSTR(name,2,30)
      END
      || ' '
      || REPLACE(datatype_string,'CHAR(','VARCHAR2(')
    ELSE NULL
  END txt
FROM V$SQL_BIND_CAPTURE
WHERE sql_id     ='&&sql_id'
AND child_number = &&child_no;
--
-- Set variable values from V$SQL_PLAN
--
SELECT
  CASE
    WHEN :bind_count > 0
    THEN 'begin'
    ELSE '-- No Bind Variables'
  END txt
FROM dual;


SELECT
  CASE
    WHEN :bind_count > 0
    THEN
      CASE :isdigits
        WHEN 1
        THEN REPLACE(bind_name,':',':N')
        ELSE bind_name
      END
      || ' := '
      ||
         case when bind_type = 1 then '''' 
              when bind_type = 12 then 'to_date(''' 
			  when bind_type = 180 then 'to_date('''
		 else null end 
    --  ||
     --    case when bind_type = 1 then display_raw(bind_data,'VARCHAR2')
       --       when bind_type = 2 then display_raw(bind_data,'NUMBER')
        --      when bind_type = 2 then
          --       to_char(dbms_stats.convert_raw_value(bind_data, :cn))
           --   when bind_type = 12 then display_raw(bind_data,'DATE')
      ||
 -- Transform raw bind data to values based on bind type
   CASE
        WHEN bind_type = 1
        THEN UTL_RAW.CAST_TO_VARCHAR2(bind_data)
        WHEN bind_type = 2
        THEN TO_CHAR(UTL_RAW.CAST_TO_NUMBER(bind_data))
        WHEN bind_type = 12
        THEN
        to_char(to_date(
        to_char( to_number( substr(bind_data, 1, 2 ), 'xx' ) - 100, 'fm00' ) ||
        to_char( to_number( substr(bind_data, 3, 2 ), 'xx' ) - 100, 'fm00' ) ||
        to_char( to_number( substr(bind_data, 5, 2 ), 'xx' ), 'fm00' ) ||
        to_char( to_number( substr(bind_data, 7, 2 ), 'xx' ), 'fm00' ) ||
        to_char( to_number( substr(bind_data, 9, 2 ), 'xx' )-1, 'fm00' ) ||
        to_char( to_number( substr(bind_data, 11, 2 ), 'xx' )-1, 'fm00' ) ||
        to_char( to_number( substr(bind_data, 13, 2 ), 'xx' )-1, 'fm00'),'yyyymmddhh24miss'))
        /*        THEN TO_CHAR(TO_DATE(TO_CHAR(TO_NUMBER(SUBSTR(CAST(bind_data AS VARCHAR2(30)), 1, 2), 'xx') - 100, 'FM00')
          || TO_CHAR(MOD(TO_NUMBER(SUBSTR(CAST(bind_data AS VARCHAR2(30)), 3, 2), 'xx'), 100), 'FM00')
          || TO_CHAR(TO_NUMBER(SUBSTR(CAST(bind_data AS VARCHAR2(30)), 5, 2), 'xx'), 'FM00')
          || TO_CHAR(TO_NUMBER(SUBSTR(CAST(bind_data AS VARCHAR2(30)), 7, 2), 'xx'), 'FM00'), 'YYYYMMDD'), 'DD-MON-YYYY') */
 WHEN bind_type = 180
        THEN
        to_char(to_date(
        to_char( to_number( substr(bind_data, 1, 2 ), 'xx' ) - 100, 'fm00' ) ||
        to_char( to_number( substr(bind_data, 3, 2 ), 'xx' ) - 100, 'fm00' ) ||
        to_char( to_number( substr(bind_data, 5, 2 ), 'xx' ), 'fm00' ) ||
        to_char( to_number( substr(bind_data, 7, 2 ), 'xx' ), 'fm00' ) ||
        to_char( to_number( substr(bind_data, 9, 2 ), 'xx' )-1, 'fm00' ) ||
        to_char( to_number( substr(bind_data, 11, 2 ), 'xx' )-1, 'fm00' ) ||
        to_char( to_number( substr(bind_data, 13, 2 ), 'xx' )-1, 'fm00'),'yyyymmddhh24miss'),'dd-mm-yyyy hh24:mi:ss')
/*        THEN TO_CHAR(TO_DATE(TO_CHAR(TO_NUMBER(SUBSTR(CAST(bind_data AS VARCHAR2(30)), 1, 2), 'xx') - 100, 'FM00')
          || TO_CHAR(MOD(TO_NUMBER(SUBSTR(CAST(bind_data AS VARCHAR2(30)), 3, 2), 'xx'), 100), 'FM00')
          || TO_CHAR(TO_NUMBER(SUBSTR(CAST(bind_data AS VARCHAR2(30)), 5, 2), 'xx'), 'FM00')
          || TO_CHAR(TO_NUMBER(SUBSTR(CAST(bind_data AS VARCHAR2(30)), 7, 2), 'xx'), 'FM00'), 'YYYYMMDD'), 'DD-MON-YYYY')    */    
		ELSE bind_data
      END
      ||
      CASE
        WHEN bind_type = 1
        THEN ''''
        WHEN bind_type = 12
        THEN ''')'
		    WHEN bind_type = 180
        THEN ''')'
        ELSE NULL
      END
      || ';'
      || '-- '
      ||bind_type
    ELSE NULL
  END txt
FROM
  (SELECT extractvalue(value(d), '/bind/@nam') AS bind_name,
    extractvalue(value(d), '/bind/@dty')       AS bind_type,
    extractvalue(value(d), '/bind')            AS bind_data
  FROM xmltable('/*/*/bind' passing
    (SELECT xmltype(other_xml) AS xmlval
    FROM v$sql_plan
    WHERE sql_id LIKE NVL('&&sql_id',sql_id)
    AND child_number =&&child_no
    AND other_xml IS NOT NULL
    ) ) d
  ) ;
  
-- add end; & / to the script  
SELECT CASE WHEN :bind_count > 0 THEN 'end;' ELSE NULL END txt FROM dual;
SELECT CASE WHEN :bind_count > 0 THEN '/' ELSE NULL END txt FROM dual;
--
-- Generate statement
--
SELECT regexp_replace(sql_fulltext,'(select |SELECT )','select /* test &&sql_id */ ',1,1) sql_fulltext
FROM
  (SELECT
    CASE :isdigits
      WHEN 1
      THEN REPLACE(sql_fulltext,':',':N')
      ELSE sql_fulltext
    END
    ||';' sql_fulltext
  FROM v$sqlarea
  WHERE sql_id = '&&sql_id'
  );

spool off;

undef sql_id
undef child_no
set feedback on;
set head on
