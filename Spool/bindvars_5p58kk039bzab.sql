
variable N1 NUMBER
variable N2 NUMBER
variable N3 VARCHAR2(32)
variable N4 TIMESTAMP
variable N5 NUMBER
variable N6 NUMBER
variable N7 NUMBER

begin

no rows selected


end;

/

insert into CC_TICKET (VERSION, STATUS, RECEPTION_TYPE, UPDATE_DT, FK_MESSAGE, FK_CUSTOMERACCOUNT, ID) values (:N1 , :N2 , :N3 , :N4 , :N5 , :N6 , :N7 );
