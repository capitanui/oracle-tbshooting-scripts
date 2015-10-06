
PLAN_TABLE_OUTPUT
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SQL_ID  0k4qg4bz33pfv, child number 0
-------------------------------------
SELECT   /*+gather_plan_statistics  test 9jsyam5dj27ua */   this_.ID
                      AS ID322_0_,   this_.BACKENDCLIENTID
AS BACKENDC2_322_0_,   this_.BACKENDCLIENTTYPE           AS
BACKENDC3_322_0_,   this_.CLIENTSTATUS                AS
CLIENTST4_322_0_,   this_.PRODUCT                     AS PRODUCT322_0_,
  this_.NDG                         AS NDG322_0_,   this_.CLIDE_NAME
              AS CLIDE7_322_0_,   this_.CLIDE_OKPO                  AS
CLIDE8_322_0_,   this_.CLIDE_BRANCHCODE            AS CLIDE9_322_0_,
this_.MSPATTERN                   AS MSPATTERN322_0_,
this_.DOCNUMYEAR                  AS DOCNUMYEAR322_0_,
this_.DOCNUMMONTH                 AS DOCNUMM12_322_0_,
this_.DOCNUMDAY                   AS DOCNUMDAY322_0_,
this_.SALARYPMTONLY               AS SALARYP14_322_0_,   this_.PARTOF
                   AS PARTOF322_0_,   this_.ENCRYPTEDUPLOAD
AS ENCRYPT16_322_0_,   this_.ELECTRONICSIGNATURE         AS
ELECTRO17_322_0_,   this

Plan hash value: 4114242582

--------------------------------------------------------------------------------------------------------
| Id  | Operation                     | Name                   | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT              |                        |       |       |    11 (100)|          |
|*  1 |  FILTER                       |                        |       |       |            |          |
|*  2 |   TABLE ACCESS BY INDEX ROWID | ITL_CLI_ASSIGNMENT     |     1 |   169 |     3   (0)| 00:00:01 |
|*  3 |    INDEX RANGE SCAN           | ITL_CLI_ASSIGNMENT_U01 |     1 |       |     2   (0)| 00:00:01 |
|   4 |   NESTED LOOPS SEMI           |                        |     1 |   123 |     8   (0)| 00:00:01 |
|*  5 |    TABLE ACCESS BY INDEX ROWID| ITL_CLI_MODULE         |     1 |    65 |     4   (0)| 00:00:01 |
|*  6 |     INDEX RANGE SCAN          | IDX_GWSID_CLASSGID     |     1 |       |     3   (0)| 00:00:01 |
|*  7 |    TABLE ACCESS BY INDEX ROWID| ITL_CLI_MODULE         |     2 |   116 |     4   (0)| 00:00:01 |
|*  8 |     INDEX RANGE SCAN          | CMOD_CLIENTID          |     5 |       |     2   (0)| 00:00:01 |
--------------------------------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - filter( IS NOT NULL)
   2 - filter("THIS_"."CLIENTSTATUS"=:N1)
   3 - access("THIS_"."BACKENDCLIENTID"=:N4 AND "THIS_"."MANDANT"=:N2)
       filter(("THIS_"."MANDANT"=:N2 AND LOWER("THIS_"."PRODUCT") LIKE :N3))
   5 - filter(("USERMODULES_"."PRODUCT"=:B1 AND "USERMODULES_"."MODULETYPE"=:N7 AND
              "USERMODULES_"."PRODUCT"=:N8 AND "USERMODULES_"."PRODUCT"=:N11 AND
              "USERMODULES_"."MODULESTATUS"=:N6))
   6 - access("USERMODULES_"."GWSID"=:N5 AND "USERMODULES_"."CLIENTASSIGNMENTID"=:B1)
   7 - filter(("CLIENTMODULES_"."PRODUCT"=:B1 AND "CLIENTMODULES_"."MODULETYPE"=:N10 AND
              "CLIENTMODULES_"."PRODUCT"=:N11 AND "CLIENTMODULES_"."PRODUCT"=:N8 AND
              "CLIENTMODULES_"."MODULESTATUS"=:N9 AND "CLIENTMODULES_"."PORTLETNAME"="USERMODULES_"."PORTLETNA
              ME" AND "CLIENTMODULES_"."MANDANT"="USERMODULES_"."MANDANT" AND
              "CLIENTMODULES_"."PRODUCT"="USERMODULES_"."PRODUCT"))
   8 - access("CLIENTMODULES_"."CLIENTASSIGNMENTID"=:B1)
       filter("CLIENTMODULES_"."CLIENTASSIGNMENTID"="USERMODULES_"."CLIENTASSIGNMENTID")


 54 rows selected


                  COUNT(DISTINCTSQL_ID)
---------------------------------------
                                      4


SQL_ID                                   EXEC_TIME_MS
------------- ---------------------------------------
0k4qg4bz33pfv                                  13,944
2dk3ajxbphwk2                                   2,163


SQL_ID                              EXEC_TIME_MS_HIST
------------- ---------------------------------------
9jsyam5dj27ua                                  17,787
5b2gxrsypyzmb                                  14,063

