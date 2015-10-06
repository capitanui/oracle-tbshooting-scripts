
variable N1 VARCHAR2(32)
variable N2 VARCHAR2(32)
variable N3 VARCHAR2(32)
variable N4 VARCHAR2(128)
variable N5 VARCHAR2(128)
variable N6 VARCHAR2(32)
variable N7 VARCHAR2(32)
variable N8 VARCHAR2(32)
variable N9 VARCHAR2(32)
variable N10 VARCHAR2(32)
variable N11 VARCHAR2(32)

begin

:N1 := 'A';-- 1
:N2 := 'ua';-- 1
:N4 := '144011204';-- 1
:N5 := 'mrsfilina';-- 1
:N6 := 'A';-- 1
:N7 := 'U';-- 1
:N8 := 'CBA';-- 1
:N9 := 'A';-- 1
:N10 := 'C';-- 1
:N11 := 'CBA';-- 1

end;

/

select /* test 9jsyam5dj27ua */ this_.ID as ID322_0_, this_.BACKENDCLIENTID as BACKENDC2_322_0_, this_.BACKENDCLIENTTYPE as BACKENDC3_322_0_, this_.CLIENTSTATUS as CLIENTST4_322_0_, this_.PRODUCT as PRODUCT322_0_, this_.NDG as NDG322_0_, this_.CLIDE_NAME as CLIDE7_322_0_, this_.CLIDE_OKPO as CLIDE8_322_0_, this_.CLIDE_BRANCHCODE as CLIDE9_322_0_, this_.MSPATTERN as MSPATTERN322_0_, this_.DOCNUMYEAR as DOCNUMYEAR322_0_, this_.DOCNUMMONTH as DOCNUMM12_322_0_, this_.DOCNUMDAY as DOCNUMDAY322_0_, this_.SALARYPMTONLY as SALARYP14_322_0_, this_.PARTOF as PARTOF322_0_, this_.ENCRYPTEDUPLOAD as ENCRYPT16_322_0_, this_.ELECTRONICSIGNATURE as ELECTRO17_322_0_, this_.ENCRYPTEDDOWNLOAD as ENCRYPT18_322_0_, this_.ELECTRONICSIGNATUREDOWNLOAD as ELECTRO19_322_0_, this_.AUTOMATICORDERPROCESSING as AUTOMAT20_322_0_, this_.CLIENTALLORNOTHING as CLIENTA21_322_0_, this_.BESP as BESP322_0_, this_.REFNRMAND as REFNRMAND322_0_, this_.DOWNLOADFORMATS as DOWNLOA24_322_0_, this_.UPLOADMODE as UPLOADMODE322_0_, this_.OTPMANDATORY as OTPMAND26_322_0_, this_.SEGMENTATION_CATEGORY as SEGMENT27_322_0_, this_.SEGMENTATION_REGION as SEGMENT28_322_0_, this_.CREDITLINEVISIBLE as CREDITL29_322_0_, this_.CRTUSER as CRTUSER322_0_, this_.CRTTIME as CRTTIME322_0_, this_.CHGUSER as CHGUSER322_0_, this_.CHGTIME as CHGTIME322_0_, this_.MANDANT as MANDANT322_0_ from ITL_CLI_ASSIGNMENT this_ where (this_.CLIENTSTATUS=:N1  and this_.MANDANT=:N2 ) and lower(this_.PRODUCT) like :N3  and (this_.BACKENDCLIENTID=:N4 ) and exists (select usermodules_.ID as y0_ from ITL_CLI_MODULE usermodules_ where usermodules_.CLIENTASSIGNMENTID=this_.ID and usermodules_.GWSID=:N5  and usermodules_.MODULESTATUS=:N6  and usermodules_.MODULETYPE=:N7  and usermodules_.PRODUCT=this_.PRODUCT and usermodules_.PRODUCT=:N8  and exists (select clientmodules_.ID as y0_ from ITL_CLI_MODULE clientmodules_ where clientmodules_.CLIENTASSIGNMENTID=usermodules_.CLIENTASSIGNMENTID and clientmodules_.PORTLETNAME=usermodules_.PORTLETNAME and clientmodules_.MANDANT=usermodules_.MANDANT and clientmodules_.PRODUCT=usermodules_.PRODUCT and clientmodules_.MODULESTATUS=:N9  and clientmodules_.MODULETYPE=:N10  and clientmodules_.PRODUCT=:N11 ));
