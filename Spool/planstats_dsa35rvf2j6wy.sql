
PLAN_TABLE_OUTPUT
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SQL_ID  dsa35rvf2j6wy, child number 0
-------------------------------------
select * from ( select this_.ID as ID52_4_, this_.VERSION as
VERSION52_4_, this_.STATUS as STATUS52_4_, this_.RECEPTION_TYPE as
RECEPTION4_52_4_, this_.UPDATE_DT as UPDATE5_52_4_, this_.FK_MESSAGE as
FK6_52_4_, this_.FK_CUSTOMERACCOUNT as FK7_52_4_, m1_.ID as ID43_0_,
m1_.VERSION as VERSION43_0_, m1_.FK_MESSAGE_CONTENT as FK4_43_0_,
m1_.CREATORID as CREATORID43_0_, m1_.CREATIONTIMESTAMP as
CREATION6_43_0_, m1_.SUBJECT as SUBJECT43_0_, m1_.MANDANT as
MANDANT43_0_, m1_.PARENTID as PARENTID43_0_, m1_.SUB_TYPE as
SUB10_43_0_, m1_.INTERNAL_REMARKS as INTERNAL11_43_0_, m1_.csr_rule_id
as csr12_43_0_, m1_.FK_TOPIC_TICKET as FK14_43_0_, m1_.VALIDFROM as
VALIDFROM43_0_, m1_.VALIDTO as VALIDTO43_0_, m1_.PRODUCTS as
PRODUCTS43_0_, m1_.SENDTOALLCUSTOMERS as SENDTOA21_43_0_,
m1_.MANDATORYTOREAD as MANDATO22_43_0_, m1_.REPLYAVAILABLE as
REPLYAV23_43_0_, m1_.STATUS as STATUS43_0_, m1_.LANGUAGE as
LANGUAGE43_0_, m1_.PORTLETLINK as PORTLET25_43_0_,
decode(m1_.PRODUCTS,NULL,'N','NN') as formula0_0_, acc

Plan hash value: 1084590132

--------------------------------------------------------------------------------------------------------------------
| Id  | Operation                            | Name                        | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                     |                             |       |       |    17 (100)|          |
|*  1 |  COUNT STOPKEY                       |                             |       |       |            |          |
|   2 |   VIEW                               |                             |     1 |  3248 |    17   (6)| 00:00:01 |
|*  3 |    SORT ORDER BY STOPKEY             |                             |     1 |   390 |    17   (6)| 00:00:01 |
|*  4 |     FILTER                           |                             |       |       |            |          |
|   5 |      NESTED LOOPS                    |                             |       |       |            |          |
|   6 |       NESTED LOOPS                   |                             |     1 |   390 |    16   (0)| 00:00:01 |
|   7 |        NESTED LOOPS OUTER            |                             |     1 |   338 |    12   (0)| 00:00:01 |
|   8 |         NESTED LOOPS                 |                             |     1 |   261 |    10   (0)| 00:00:01 |
|   9 |          NESTED LOOPS                |                             |     1 |   234 |     8   (0)| 00:00:01 |
|  10 |           TABLE ACCESS BY INDEX ROWID| ICO_ACCOUNT                 |     1 |    76 |     3   (0)| 00:00:01 |
|* 11 |            INDEX UNIQUE SCAN         | PK_ICO_ACCOUNT_LID          |     1 |       |     2   (0)| 00:00:01 |
|* 12 |           TABLE ACCESS BY INDEX ROWID| CC_MESSAGE                  |     1 |   158 |     5   (0)| 00:00:01 |
|* 13 |            INDEX SKIP SCAN           | IDX_TYPE_CRTTIMESTAMP       |     1 |       |     4   (0)| 00:00:01 |
|* 14 |          TABLE ACCESS BY INDEX ROWID | CC_TOPIC_TICKET             |     1 |    27 |     2   (0)| 00:00:01 |
|* 15 |           INDEX UNIQUE SCAN          | PK_CC_TOPIC_TICKET          |     1 |       |     1   (0)| 00:00:01 |
|  16 |         TABLE ACCESS BY INDEX ROWID  | ICO_ACCOUNT                 |     1 |    77 |     2   (0)| 00:00:01 |
|* 17 |          INDEX UNIQUE SCAN           | PK_ICO_ACCOUNT_LID          |     1 |       |     1   (0)| 00:00:01 |
|* 18 |        INDEX RANGE SCAN              | IDX_MESSAGE_CUSTOMERACCOUNT |     1 |       |     3   (0)| 00:00:01 |
|* 19 |       TABLE ACCESS BY INDEX ROWID    | CC_TICKET                   |     1 |    52 |     4   (0)| 00:00:01 |
--------------------------------------------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - filter(ROWNUM<=:18)
   3 - filter(ROWNUM<=:18)
   4 - filter((:15<=:16 AND :14>=:15 AND :13<=:16 AND :13<=:14 AND :7<=:8 AND :5<=:6))
  11 - access("CA3_"."LID"=:11)
  12 - filter(("M1_"."MANDANT"=:1 AND "M1_"."STATUS"=:4 AND "M1_"."VALIDTO">=:7 AND
              INTERNAL_FUNCTION("M1_"."LANGUAGE") AND "M1_"."VALIDFROM"<=:6 AND "M1_"."VALIDTO"<=:8 AND
              (DECODE("PRODUCTS",NULL,'N','NN')=:9 OR "M1_"."PRODUCTS" LIKE :10) AND "M1_"."VALIDFROM">=:5))
  13 - access("M1_"."CREATIONTIMESTAMP">=GREATEST(:13,:15) AND "M1_"."CREATIONTIMESTAMP"<=LEAST(:14,:16))
       filter(("M1_"."CREATIONTIMESTAMP">=GREATEST(:13,:15) AND "M1_"."CREATIONTIMESTAMP"<=LEAST(:14,:16)))
  14 - filter("TT2_"."FK_TOPIC"=:12)
  15 - access("M1_"."FK_TOPIC_TICKET"="TT2_"."ID")
  17 - access("M1_"."CREATORID"="ACCOUNT6_"."LID")
  18 - access("THIS_"."FK_MESSAGE"="M1_"."ID" AND "THIS_"."FK_CUSTOMERACCOUNT"=:11)
  19 - filter("THIS_"."STATUS"<>:17)


 64 rows selected


                  COUNT(DISTINCTSQL_ID)
---------------------------------------
                                      2

 1 rows selected


SQL_ID                                   EXEC_TIME_MS
------------- ---------------------------------------
dsa35rvf2j6wy                                3299,954
8dvn7tgur0qbu                                1256,913

 2 rows selected


SQL_ID                              EXEC_TIME_MS_HIST
------------- ---------------------------------------
dsa35rvf2j6wy                               12791,783
8dvn7tgur0qbu                                1187,991

 2 rows selected

