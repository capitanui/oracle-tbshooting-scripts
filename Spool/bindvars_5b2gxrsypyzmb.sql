Commit

Error starting at line : 34 File @ C:\Workarea\Scripts\bindvars.sql
In command -
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
Error report -
ORA-01403: no data found
ORA-06512: at line 13
01403. 00000 -  "no data found"
*Cause:    No data was found from the objects.
*Action:   There was no data from the objects which may be due to end of fetch.
