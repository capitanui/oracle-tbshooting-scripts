
PLAN_TABLE_OUTPUT
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SQL_ID  9wr2w4s4mm4u5, child number 0
-------------------------------------
/* SQL Analyze(2402,0) */ select * from ( select this_.ID as ID52_4_,
this_.VERSION as VERSION52_4_, this_.STATUS as STATUS52_4_,
this_.RECEPTION_TYPE as RECEPTION4_52_4_, this_.UPDATE_DT as
UPDATE5_52_4_, this_.FK_MESSAGE as FK6_52_4_, this_.FK_CUSTOMERACCOUNT
as FK7_52_4_, m1_.ID as ID43_0_, m1_.VERSION as VERSION43_0_,
m1_.FK_MESSAGE_CONTENT as FK4_43_0_, m1_.CREATORID as CREATORID43_0_,
m1_.CREATIONTIMESTAMP as CREATION6_43_0_, m1_.SUBJECT as SUBJECT43_0_,
m1_.MANDANT as MANDANT43_0_, m1_.PARENTID as PARENTID43_0_,
m1_.SUB_TYPE as SUB10_43_0_, m1_.INTERNAL_REMARKS as INTERNAL11_43_0_,
m1_.csr_rule_id as csr12_43_0_, m1_.FK_TOPIC_TICKET as FK14_43_0_,
m1_.VALIDFROM as VALIDFROM43_0_, m1_.VALIDTO as VALIDTO43_0_,
m1_.PRODUCTS as PRODUCTS43_0_, m1_.SENDTOALLCUSTOMERS as
SENDTOA21_43_0_, m1_.MANDATORYTOREAD as MANDATO22_43_0_,
m1_.REPLYAVAILABLE as REPLYAV23_43_0_, m1_.STATUS as STATUS43_0_,
m1_.LANGUAGE as LANGUAGE43_0_, m1_.PORTLETLINK as PORTLET25_43_0_,
decode(m1_.PRODUCTS,NULL,'N'

Plan hash value: 778368998

----------------------------------------------------------------------------------------------------------
| Id  | Operation                           | Name               | Rows  | Bytes | Cost (%CPU)| Time     |
----------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                    |                    |       |       |    77 (100)|          |
|*  1 |  COUNT STOPKEY                      |                    |       |       |            |          |
|   2 |   VIEW                              |                    |     1 |  3248 |    77   (2)| 00:00:01 |
|*  3 |    SORT ORDER BY STOPKEY            |                    |     1 |   390 |    77   (2)| 00:00:01 |
|*  4 |     FILTER                          |                    |       |       |            |          |
|   5 |      NESTED LOOPS OUTER             |                    |     1 |   390 |    76   (0)| 00:00:01 |
|   6 |       NESTED LOOPS                  |                    |     1 |   313 |    74   (0)| 00:00:01 |
|   7 |        NESTED LOOPS                 |                    |     1 |   286 |    72   (0)| 00:00:01 |
|   8 |         NESTED LOOPS                |                    |    24 |  3072 |    24   (0)| 00:00:01 |
|   9 |          TABLE ACCESS BY INDEX ROWID| ICO_ACCOUNT        |     1 |    76 |     3   (0)| 00:00:01 |
|* 10 |           INDEX UNIQUE SCAN         | PK_ICO_ACCOUNT_LID |     1 |       |     2   (0)| 00:00:01 |
|  11 |          TABLE ACCESS BY INDEX ROWID| CC_TICKET          |    24 |  1248 |    21   (0)| 00:00:01 |
|* 12 |           INDEX RANGE SCAN          | IDX_TICKET_STATUS  |    24 |       |     3   (0)| 00:00:01 |
|* 13 |         TABLE ACCESS BY INDEX ROWID | CC_MESSAGE         |     1 |   158 |     2   (0)| 00:00:01 |
|* 14 |          INDEX UNIQUE SCAN          | PK_CC_MESSAGE      |     1 |       |     1   (0)| 00:00:01 |
|  15 |        TABLE ACCESS BY INDEX ROWID  | CC_TOPIC_TICKET    |     1 |    27 |     2   (0)| 00:00:01 |
|* 16 |         INDEX UNIQUE SCAN           | PK_CC_TOPIC_TICKET |     1 |       |     1   (0)| 00:00:01 |
|  17 |       TABLE ACCESS BY INDEX ROWID   | ICO_ACCOUNT        |     1 |    77 |     2   (0)| 00:00:01 |
|* 18 |        INDEX UNIQUE SCAN            | PK_ICO_ACCOUNT_LID |     1 |       |     1   (0)| 00:00:01 |
----------------------------------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - filter(ROWNUM<=:17)
   3 - filter(ROWNUM<=:17)
   4 - filter((:14<=:15 AND :13>=:14 AND :12<=:15 AND :12<=:13 AND :7<=:8 AND :5<=:6))
  10 - access("CA3_"."LID"=:11)
  12 - access("THIS_"."FK_CUSTOMERACCOUNT"=:11)
       filter("THIS_"."STATUS"<>:16)
  13 - filter(("M1_"."MANDANT"=:1 AND "M1_"."STATUS"=:4 AND
              INTERNAL_FUNCTION("M1_"."CREATIONTIMESTAMP")>=:12 AND
              INTERNAL_FUNCTION("M1_"."CREATIONTIMESTAMP")<=:13 AND
              INTERNAL_FUNCTION("M1_"."CREATIONTIMESTAMP")>=:14 AND
              INTERNAL_FUNCTION("M1_"."CREATIONTIMESTAMP")<=:15 AND "M1_"."VALIDTO">=:7 AND
              INTERNAL_FUNCTION("M1_"."LANGUAGE") AND "M1_"."VALIDFROM"<=:6 AND "M1_"."VALIDTO"<=:8 AND
              (DECODE("PRODUCTS",NULL,'N','NN')=:9 OR "M1_"."PRODUCTS" LIKE :10) AND "M1_"."VALIDFROM">=:5))
  14 - access("THIS_"."FK_MESSAGE"="M1_"."ID")
  16 - access("M1_"."FK_TOPIC_TICKET"="TT2_"."ID")
  18 - access("M1_"."CREATORID"="ACCOUNT6_"."LID")


 65 rows selected


                  COUNT(DISTINCTSQL_ID)
---------------------------------------
                                      4

 1 rows selected


SQL_ID                                   EXEC_TIME_MS
------------- ---------------------------------------
dp92647rdsp4q                                1324,101
awbqh31bf4qmb                                 181,783
bdtdtcb5fdxh4                                  26,265

 3 rows selected


SQL_ID                              EXEC_TIME_MS_HIST
------------- ---------------------------------------
dp92647rdsp4q                                 945,255
8dvn7tgur0qbu                                  133,94

 2 rows selected

