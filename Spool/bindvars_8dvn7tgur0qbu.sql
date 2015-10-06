
variable N1 VARCHAR2(32)
variable N2 VARCHAR2(32)
variable N3 VARCHAR2(32)
variable N4 NUMBER
variable N5 DATE
variable N6 DATE
variable N7 DATE
variable N8 DATE
variable N9 VARCHAR2(32)
variable N10 VARCHAR2(32)
variable N11 NUMBER
variable N12 VARCHAR2(32)
variable N13 VARCHAR2(32)
variable N14 VARCHAR2(32)
variable N15 VARCHAR2(32)
variable N16 NUMBER
variable N17 NUMBER

begin

:N1 := 'ro';-- 1
:N2 := 'RO';-- 1
:N3 := 'AY';-- 1
:N4 := 7;-- 2
:N5 := to_date('01-01-2000');-- 12
:N6 := to_date('30-09-2015');-- 12
:N7 := to_date('30-09-2015');-- 12
:N8 := to_date('01-01-2200');-- 12
:N9 := 'N';-- 1
:N10 := '%RBA%';-- 1
:N11 := 653588483353748103;-- 2
:N12 := to_date('31-08-2015 00:00:00');-- 180
:N13 := to_date('01-01-2200 00:00:00');-- 180
:N14 := to_date('01-01-2000 00:00:00');-- 180
:N15 := to_date('30-09-2015 23:59:59');-- 180
:N16 := 12;-- 2
:N17 := 200;-- 2

end;

/

select /* test 8dvn7tgur0qbu */ * from ( select this_.ID as ID52_4_, this_.VERSION as VERSION52_4_, this_.STATUS as STATUS52_4_, this_.RECEPTION_TYPE as RECEPTION4_52_4_, this_.UPDATE_DT as UPDATE5_52_4_, this_.FK_MESSAGE as FK6_52_4_, this_.FK_CUSTOMERAC
COUNT as FK7_52_4_, m1_.ID as ID43_0_, m1_.VERSION as VERSION43_0_, m1_.FK_MESSAGE_CONTENT as FK4_43_0_, m1_.CREATORID as CREATORID43_0_, m1_.CREATIONTIMESTAMP as CREATION6_43_0_, m1_.SUBJECT as SUBJECT43_0_, m1_.MANDANT as MANDANT43_0_, m1_.PARENTID as P
ARENTID43_0_, m1_.SUB_TYPE as SUB10_43_0_, m1_.INTERNAL_REMARKS as INTERNAL11_43_0_, m1_.csr_rule_id as csr12_43_0_, m1_.FK_TOPIC_TICKET as FK14_43_0_, m1_.VALIDFROM as VALIDFROM43_0_, m1_.VALIDTO as VALIDTO43_0_, m1_.PRODUCTS as PRODUCTS43_0_, m1_.SENDTO
ALLCUSTOMERS as SENDTOA21_43_0_, m1_.MANDATORYTOREAD as MANDATO22_43_0_, m1_.REPLYAVAILABLE as REPLYAV23_43_0_, m1_.STATUS as STATUS43_0_, m1_.LANGUAGE as LANGUAGE43_0_, m1_.PORTLETLINK as PORTLET25_43_0_, decode(m1_.PRODUCTS,NULL,'N','NN') as formula0_0_
, account6_.LID as LID12_1_, account6_.DATECREATION as DATECREA3_12_1_, account6_.DATEMODIFICATION as DATEMODI4_12_1_, account6_.PP_NAME as PP5_12_1_, account6_.PP_STATUS as PP6_12_1_, account6_.PP_LASTLOGIN as PP7_12_1_, account6_.PP_SUCCESSFULLOGINS as
PP8_12_1_, account6_.PP_FAILEDLOGINS as PP9_12_1_, account6_.GLID as GLID12_1_, account6_.MANDANT as MANDANT12_1_, account6_.PP_TYPE as PP2_12_1_, tt2_.ID as ID47_2_, tt2_.VERSION as VERSION47_2_, tt2_.FK_TOPIC as FK3_47_2_, tt2_.STATUS as STATUS47_2_, ca
3_.LID as LID12_3_, ca3_.DATECREATION as DATECREA3_12_3_, ca3_.DATEMODIFICATION as DATEMODI4_12_3_, ca3_.PP_NAME as PP5_12_3_, ca3_.PP_STATUS as PP6_12_3_, ca3_.PP_LASTLOGIN as PP7_12_3_, ca3_.PP_SUCCESSFULLOGINS as PP8_12_3_, ca3_.PP_FAILEDLOGINS as PP9_
12_3_, ca3_.GLID as GLID12_3_, ca3_.MANDANT as MANDANT12_3_ from CC_TICKET this_ inner join CC_MESSAGE m1_ on this_.FK_MESSAGE=m1_.ID left outer join ICO_ACCOUNT account6_ on m1_.CREATORID=account6_.LID inner join CC_TOPIC_TICKET tt2_ on m1_.FK_TOPIC_TICK
ET=tt2_.ID inner join ICO_ACCOUNT ca3_ on this_.FK_CUSTOMERACCOUNT=ca3_.LID where m1_.MANDANT=:N1  and m1_.LANGUAGE in (:N2 , :N3 ) and m1_.STATUS=:N4  and m1_.VALIDFROM between :N5  and :N6  and m1_.VALIDTO between :N7  and :N8  and (decode(m1_.PRODUCTS,
NULL,'N','NN')=:N9  or m1_.PRODUCTS like :N10 ) and ca3_.LID=:N11  and m1_.CREATIONTIMESTAMP between :N12  and :N13  and m1_.CREATIONTIMESTAMP between :N14  and :N15  and this_.STATUS<>:N16  order by m1_.CREATIONTIMESTAMP desc ) where rownum <= :N17 ;

