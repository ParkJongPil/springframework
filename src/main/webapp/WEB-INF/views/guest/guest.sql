show tables;

create table guest2(
	idx 	int not null auto_increment	primary key, 		/* 방명록 고유번호 */
	name 	varchar(20) not null,							/* 방문자 성명 */
	email 	varchar(60),								/* 이메일 주소 */
	homepage  varchar(60),								/* 방문자의 홈페이지(블로그 주소) */
	vDate	datetime default now(),						/* 방문일자/ 시간 */
	hostIp	varchar(50)	not null,						/* 방문자 IP */
	content text not null								/* 방문 소감 */
);

desc guest2;

insert into guest2 values (default,'관리자','pjp8191@naver.com','blog.daum.net/cjsk1126',default,'192.168.50.117','방명록 서비스를 시작합니다');
insert into guest2 values(default,'홍길동','hkd1234@hanmail.net','blog.daum.net/cjsk1126',default,'200.148.50.117','귀사의 번영을 기원합니다.');

delete from login where name=홍길동;

drop table guest2;
