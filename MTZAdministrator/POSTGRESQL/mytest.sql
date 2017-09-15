drop function testf(tname varchar)  ;

CREATE OR REPLACE FUNCTION testf ( tname varchar) 
RETURNS void AS
$BODY$
DECLARE
	
BEGIN


	IF ( exists(select 1 from pg_tables where tablename=$1) )  THEN
		execute 'drop table ' || $1 ;
	ELSE
		null;
	END IF;

	--return  $1;
	
	
END;
$BODY$
LANGUAGE 'plpgsql' ;



select  testf ('sysoptions');

create table sysoptions (
id int
);

select * from sysoptions;

