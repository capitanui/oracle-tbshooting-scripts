-- check hints of plan for a particular SQL_ID
select  CHR(9)||''''
        ||regexp_replace(extractvalue(value(d),'/hint'),'''','''''')
        || ''','
from    xmltable('/*/outline_data/hint'
                passing (select     xmltype(other_xml) as xmlval
                        from        v$sql_plan
                        where       sql_id = '&GOOD_SQL_ID'
                        and         CHILD_NUMBER = &CHILD_NO
                        and         other_xml is not null)) d;