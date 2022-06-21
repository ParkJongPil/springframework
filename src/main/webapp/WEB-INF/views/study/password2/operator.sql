create table operator2 (
  oid  varchar(20) not null primary key,
  pwd  varchar(50) not null,
  name varchar(20) not null,
  keyIdx int not null
);
drop table operator2;
desc operator2;

select * from operator2;

create table operatorHashTable2 (
  idx     int not null,
  hashKey char(8) not null
);
insert into operatorHashTable2 values ( 1,'0011ABCD');
insert into operatorHashTable2 values ( 2,'0111BADA');
insert into operatorHashTable2 values ( 3,'1211CBAA');
insert into operatorHashTable2 values ( 4,'1311DAAF');
insert into operatorHashTable2 values ( 5,'2411EAAA');
insert into operatorHashTable2 values ( 6,'2511FAAA');
insert into operatorHashTable2 values ( 7,'3611ABDA');
insert into operatorHashTable2 values ( 8,'3711BAAF');
insert into operatorHashTable2 values ( 9,'4811CAAA');
insert into operatorHashTable2 values (10,'4911DAAA');
insert into operatorHashTable2 values (11,'5011EAAA');
insert into operatorHashTable2 values (12,'5111FBDF');
insert into operatorHashTable2 values (13,'6211AAAA');
insert into operatorHashTable2 values (14,'6311BAAA');
insert into operatorHashTable2 values (15,'7411CAAA');
insert into operatorHashTable2 values (16,'7511DAAF');
insert into operatorHashTable2 values (17,'6611EBDA');
insert into operatorHashTable2 values (18,'5711FAAA');
insert into operatorHashTable2 values (19,'4811AAAA');
insert into operatorHashTable2 values (20,'3911BAAF');
insert into operatorHashTable2 values (21,'0011CAAA');
insert into operatorHashTable2 values (22,'0111DBDA');
insert into operatorHashTable2 values (23,'1211EAAA');
insert into operatorHashTable2 values (24,'1311FAAF');
insert into operatorHashTable2 values (25,'2411AAAA');
insert into operatorHashTable2 values (26,'2511BAAA');
insert into operatorHashTable2 values (27,'3611CBDA');
insert into operatorHashTable2 values (28,'3771DAAF');
insert into operatorHashTable2 values (29,'4811EAAA');
insert into operatorHashTable2 values (30,'4911FAAA');
insert into operatorHashTable2 values (31,'5011AAAA');
insert into operatorHashTable2 values (32,'5111BBDF');
insert into operatorHashTable2 values (33,'6211CAAA');
insert into operatorHashTable2 values (34,'6311DAAA');
insert into operatorHashTable2 values (35,'7411EAAA');
insert into operatorHashTable2 values (36,'7511FAAF');
insert into operatorHashTable2 values (37,'6611ABDA');
insert into operatorHashTable2 values (38,'5711BAAA');
insert into operatorHashTable2 values (39,'4811CAAA');
insert into operatorHashTable2 values (40,'3911DAAF');
insert into operatorHashTable2 values (41,'0011EAAA');
insert into operatorHashTable2 values (42,'0111FBDA');
insert into operatorHashTable2 values (43,'1211AAAA');
insert into operatorHashTable2 values (44,'2311BAAF');
insert into operatorHashTable2 values (45,'3411CAAA');
insert into operatorHashTable2 values (46,'4511DAAA');
insert into operatorHashTable2 values (47,'5611EADA');
insert into operatorHashTable2 values (48,'6711FAAF');
insert into operatorHashTable2 values (49,'7811AAAA');
insert into operatorHashTable2 values (50,'3911AAAA');

delete from operatorHashTable2;