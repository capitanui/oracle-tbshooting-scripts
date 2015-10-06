
PLAN_TABLE_OUTPUT
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SQL_ID  dh0zc0pznx2s7, child number 4
-------------------------------------
select this_.ID as ID333_0_, this_.BACKENDCLIENTID as BACKENDC2_333_0_,
this_.BACKENDCLIENTTYPE as BACKENDC3_333_0_, this_.CLIENTSTATUS as
CLIENTST4_333_0_, this_.PRODUCT as PRODUCT333_0_, this_.NDG as
NDG333_0_, this_.CLIDE_NAME as CLIDE7_333_0_, this_.CLIDE_OKPO as
CLIDE8_333_0_, this_.CLIDE_BRANCHCODE as CLIDE9_333_0_, this_.MSPATTERN
as MSPATTERN333_0_, this_.DOCNUMYEAR as DOCNUMYEAR333_0_,
this_.DOCNUMMONTH as DOCNUMM12_333_0_, this_.DOCNUMDAY as
DOCNUMDAY333_0_, this_.SALARYPMTONLY as SALARYP14_333_0_, this_.PARTOF
as PARTOF333_0_, this_.ENCRYPTEDUPLOAD as ENCRYPT16_333_0_,
this_.ELECTRONICSIGNATURE as ELECTRO17_333_0_, this_.ENCRYPTEDDOWNLOAD
as ENCRYPT18_333_0_, this_.ELECTRONICSIGNATUREDOWNLOAD as
ELECTRO19_333_0_, this_.AUTOMATICORDERPROCESSING as AUTOMAT20_333_0_,
this_.CLIENTALLORNOTHING as CLIENTA21_333_0_, this_.BESP as BESP333_0_,
this_.REFNRMAND as REFNRMAND333_0_, this_.DOWNLOADFORMATS as
DOWNLOA24_333_0_, this_.UPLOADMODE as UPLOADMODE333_0_,
this_.OTPMANDATORY as OTP

Plan hash value: 1046163886

----------------------------------------------------------------------------------------------------------
| Id  | Operation                        | Name                  | Rows  | Bytes | Cost (%CPU)| Time     |
----------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                 |                       |       |       |     9 (100)|          |
|   1 |  NESTED LOOPS                    |                       |       |       |            |          |
|   2 |   NESTED LOOPS                   |                       |     1 |   187 |     9  (12)| 00:00:01 |
|   3 |    VIEW                          | VW_SQ_1               |     1 |    18 |     7   (0)| 00:00:01 |
|   4 |     HASH UNIQUE                  |                       |     1 |   123 |            |          |
|   5 |      NESTED LOOPS SEMI           |                       |     1 |   123 |     7   (0)| 00:00:01 |
|*  6 |       TABLE ACCESS BY INDEX ROWID| ITL_CLI_MODULE        |     1 |    65 |     4   (0)| 00:00:01 |
|*  7 |        INDEX RANGE SCAN          | CMOD_GWSID            |     1 |       |     3   (0)| 00:00:01 |
|*  8 |       TABLE ACCESS BY INDEX ROWID| ITL_CLI_MODULE        |     1 |    58 |     3   (0)| 00:00:01 |
|*  9 |        INDEX RANGE SCAN          | CMOD_PRODUCT          |     1 |       |     2   (0)| 00:00:01 |
|* 10 |    INDEX UNIQUE SCAN             | ITL_CLI_ASSIGNMENT_PK |     1 |       |     0   (0)|          |
|* 11 |   TABLE ACCESS BY INDEX ROWID    | ITL_CLI_ASSIGNMENT    |     1 |   169 |     1   (0)| 00:00:01 |
----------------------------------------------------------------------------------------------------------

Predicate Information (identified by operation id):
---------------------------------------------------

   6 - filter(("USERMODULES_"."PRODUCT"=:8 AND "USERMODULES_"."PRODUCT"=:11 AND
              "USERMODULES_"."MODULETYPE"=:7 AND "USERMODULES_"."MODULESTATUS"=:6))
   7 - access("USERMODULES_"."GWSID"=:5)
   8 - filter(("CLIENTMODULES_"."MODULETYPE"=:10 AND "CLIENTMODULES_"."MODULESTATUS"=:9 AND
              "CLIENTMODULES_"."CLIENTASSIGNMENTID"="USERMODULES_"."CLIENTASSIGNMENTID" AND
              "CLIENTMODULES_"."PORTLETNAME"="USERMODULES_"."PORTLETNAME" AND
              "CLIENTMODULES_"."MANDANT"="USERMODULES_"."MANDANT"))
   9 - access("CLIENTMODULES_"."PRODUCT"=:8)
       filter(("CLIENTMODULES_"."PRODUCT"=:11 AND
              "CLIENTMODULES_"."PRODUCT"="USERMODULES_"."PRODUCT"))
  10 - access("ITEM_1"="THIS_"."ID")
  11 - filter(("THIS_"."BACKENDCLIENTID"=:4 AND "THIS_"."MANDANT"=:2 AND LOWER("THIS_"."PRODUCT")
              LIKE :3 AND "THIS_"."CLIENTSTATUS"=:1 AND "ITEM_2"="THIS_"."PRODUCT"))

Note
-----
   - SQL profile SYS_SQLPROF_01503c1056d30000 used for this statement


 59 rows selected


                  COUNT(DISTINCTSQL_ID)
---------------------------------------
                                      1


SQL_ID                                   EXEC_TIME_MS
------------- ---------------------------------------
dh0zc0pznx2s7                                1473,218


no rows selected


