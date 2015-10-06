select   plan_hash_value, sql_id, sql_fulltext
from    v$sql 
where   sql_text like '%&tracking_text%'  -- use a part of the sql text that is easily distinguishable 
and 	sql_text like '%&tracking_text2%'
and     sql_text not like '%v$sql%';
 