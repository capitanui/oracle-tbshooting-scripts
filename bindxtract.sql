undefine sql_id
undefine child_no

SELECT extractvalue(value(d), '/bind/@nam') AS bind_name,
    extractvalue(value(d), '/bind/@dty')       AS bind_type,
    extractvalue(value(d), '/bind')            AS bind_data
  FROM xmltable('/*/*/bind' passing
    (SELECT xmltype(other_xml) AS xmlval
    FROM v$sql_plan
    WHERE sql_id LIKE NVL('&&sql_id',sql_id)
    AND child_number =&&child_no
    AND other_xml IS NOT NULL
    ) ) d
    