
PLAN_TABLE_OUTPUT
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SQL_ID  5b2gxrsypyzmb, child number 0
-------------------------------------
select this_.ID as ID24_0_, this_.BACKENDCLIENTID as BACKENDC2_24_0_,
this_.BACKENDCLIENTTYPE as BACKENDC3_24_0_, this_.CLIENTSTATUS as
CLIENTST4_24_0_, this_.PRODUCT as PRODUCT24_0_, this_.NDG as NDG24_0_,
this_.CLIDE_NAME as CLIDE7_24_0_, this_.CLIDE_OKPO as CLIDE8_24_0_,
this_.CLIDE_BRANCHCODE as CLIDE9_24_0_, this_.MSPATTERN as
MSPATTERN24_0_, this_.DOCNUMYEAR as DOCNUMYEAR24_0_, this_.DOCNUMMONTH
as DOCNUMM12_24_0_, this_.DOCNUMDAY as DOCNUMDAY24_0_,
this_.SALARYPMTONLY as SALARYP14_24_0_, this_.PARTOF as PARTOF24_0_,
this_.ENCRYPTEDUPLOAD as ENCRYPT16_24_0_, this_.ELECTRONICSIGNATURE as
ELECTRO17_24_0_, this_.ENCRYPTEDDOWNLOAD as ENCRYPT18_24_0_,
this_.ELECTRONICSIGNATUREDOWNLOAD as ELECTRO19_24_0_,
this_.AUTOMATICORDERPROCESSING as AUTOMAT20_24_0_,
this_.CLIENTALLORNOTHING as CLIENTA21_24_0_, this_.BESP as BESP24_0_,
this_.REFNRMAND as REFNRMAND24_0_, this_.DOWNLOADFORMATS as
DOWNLOA24_24_0_, this_.UPLOADMODE as UPLOADMODE24_0_,
this_.OTPMANDATORY as OTPMAND26_24_0_, this_.SEGME

Plan hash value: 4114242582

--------------------------------------------------------------------------------------------------------
| Id  | Operation                     | Name                   | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT              |                        |       |       |    13 (100)|          |
|*  1 |  FILTER                       |                        |       |       |            |          |
|*  2 |   TABLE ACCESS BY INDEX ROWID | ITL_CLI_ASSIGNMENT     |     1 |   169 |     3   (0)| 00:00:01 |
|*  3 |    INDEX RANGE SCAN           | ITL_CLI_ASSIGNMENT_U01 |     1 |       |     2   (0)| 00:00:01 |
|   4 |   NESTED LOOPS SEMI           |                        |     1 |   123 |    10   (0)| 00:00:01 |
|*  5 |    TABLE ACCESS BY INDEX ROWID| ITL_CLI_MODULE         |     1 |    65 |     4   (0)| 00:00:01 |
|*  6 |     INDEX RANGE SCAN          | IDX_GWSID_CLASSGID     |     1 |       |     3   (0)| 00:00:01 |
|*  7 |    TABLE ACCESS BY INDEX ROWID| ITL_CLI_MODULE         |     1 |    58 |     6   (0)| 00:00:01 |
|*  8 |     INDEX RANGE SCAN          | CMOD_CLIENTID          |    16 |       |     2   (0)| 00:00:01 |
--------------------------------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   1 - filter( IS NOT NULL)
   2 - filter("THIS_"."CLIENTSTATUS"=:1)
   3 - access("THIS_"."BACKENDCLIENTID"=:4 AND "THIS_"."MANDANT"=:2)
       filter(("THIS_"."MANDANT"=:2 AND LOWER("THIS_"."PRODUCT") LIKE :3))
   5 - filter(("USERMODULES_"."PRODUCT"=:8 AND "USERMODULES_"."PRODUCT"=:11 AND
              "USERMODULES_"."PRODUCT"=:B1 AND "USERMODULES_"."MODULETYPE"=:7 AND
              "USERMODULES_"."MODULESTATUS"=:6))
   6 - access("USERMODULES_"."GWSID"=:5 AND "USERMODULES_"."CLIENTASSIGNMENTID"=:B1)
   7 - filter(("CLIENTMODULES_"."PRODUCT"=:11 AND "CLIENTMODULES_"."PRODUCT"=:8 AND
              "CLIENTMODULES_"."PRODUCT"=:B1 AND "CLIENTMODULES_"."MODULETYPE"=:10 AND
              "CLIENTMODULES_"."MODULESTATUS"=:9 AND "CLIENTMODULES_"."PORTLETNAME"="USERMODULES_"."PORTLETNAM
              E" AND "CLIENTMODULES_"."MANDANT"="USERMODULES_"."MANDANT" AND
              "CLIENTMODULES_"."PRODUCT"="USERMODULES_"."PRODUCT"))
   8 - access("CLIENTMODULES_"."CLIENTASSIGNMENTID"=:B1)
       filter("CLIENTMODULES_"."CLIENTASSIGNMENTID"="USERMODULES_"."CLIENTASSIGNMENTID")

Note
-----
   - SQL profile PROFILE_5b2gxrsypyzmb used for this statement


                  COUNT(DISTINCTSQL_ID)
---------------------------------------
                                      4

SQL_ID                                   EXEC_TIME_MS
------------- ---------------------------------------
9jsyam5dj27ua                                1728,688
dh0zc0pznx2s7                                 1390,91
2dk3ajxbphwk2                                   1,837
5b2gxrsypyzmb                                   1,285

SQL_ID                              EXEC_TIME_MS_HIST
------------- ---------------------------------------
dh0zc0pznx2s7                                  16,302
5b2gxrsypyzmb                                  14,063
9jsyam5dj27ua                                   1,927
