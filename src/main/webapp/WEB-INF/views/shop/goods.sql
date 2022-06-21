/* 대분류 */
create table goods1(
	product1 varchar(50) not null primary key	/* 대분류명 */
);

insert into goods1 values('전자제품');
insert into goods1 values('신발류');
insert into goods1 values('의류');

select * from goods1;

/* 중분류 */
create table goods2 (
	product1 varchar(50) not null,							/* 대분류명 */
	product2 varchar(50) not null primary key,	/*중분류명 */
	foreign key(product1) references goods1(product1)
	/* on update cascade on delete restrict */
);
	insert into goods2 values ('전자제품','삼성');
	insert into goods2 values ('전자제품','LG');
	insert into goods2 values ('전자제품','현대');
	insert into goods2 values ('신발류','나이키');
	insert into goods2 values ('신발류','아디다스');
	insert into goods2 values ('의류','블랙야크');
	insert into goods2 values ('의류','K2');
	insert into goods2 values ('의류','노스페이스');
	
/* 소분류 */
create table goods3 (
  idx 		 int not null auto_increment primary key,
  product1 varchar(50) not null,							/* 대분류명 */
  product2 varchar(50) not null,							/* 중분류명 */
  product3 varchar(50) not null,							/* 소분류명 */
  foreign key(product1) references goods1(product1),
	foreign key(product2) references goods2(product2)
  /* on update cascade on delete restrict */
);
	drop table goods3;
	
	insert into goods3 values (default,'전자제품','삼성','냉장고');
	insert into goods3 values (default,'전자제품','삼성','에어컨');
	insert into goods3 values (default,'전자제품','삼성','세탁기');
	insert into goods3 values (default,'전자제품','LG','냉장고');
	insert into goods3 values (default,'전자제품','LG','건조기');
	insert into goods3 values (default,'전자제품','LG','식기세척기');
	insert into goods3 values (default,'전자제품','현대','세탁기');
	insert into goods3 values (default,'전자제품','현대','스타일러');
	insert into goods3 values (default,'신발류','나이키','운동화');
	insert into goods3 values (default,'신발류','나이키','등산화');
	insert into goods3 values (default,'신발류','나이키','슬리퍼');
	insert into goods3 values (default,'신발류','아디다스','운동화');
	insert into goods3 values (default,'신발류','아디다스','축구화');
	insert into goods3 values (default,'신발류','아디다스','욕실화');
	insert into goods3 values (default,'의류','노스페이스','언더웨어');
	insert into goods3 values (default,'의류','노스페이스','바지');
	insert into goods3 values (default,'의류','노스페이스','자켓');
	insert into goods3 values (default,'의류','블랙야크','자켓');
	insert into goods3 values (default,'의류','블랙야크','바지');
	insert into goods3 values (default,'의류','블랙야크','상의');
	insert into goods3 values (default,'의류','K2','점퍼');
	insert into goods3 values (default,'의류','K2','바지');

	create table product(
	idx int not null auto_increment primary key,
	product1 varchar(50) not null,							/* 대분류명 */
  product2 varchar(50) not null,							/* 중분류명 */
  product3 varchar(50) not null,							/* 소분류명 */
  product varchar(100) not null unique,							/* 상품명 */
  price int not null,
  title varchar(100),
  content text,
  foreign key(product1) references goods1(product1),
  foreign key(product2) references goods2(product2)
	);
	drop table product;
	select * from product
	show tables;

