show tables;

create table member2 (
  idx		int not null auto_increment,	/* 회원 고유번호 */
  mid		varchar(20) not null,					/* 회원 아이디(중복불허) */
  pwd		varchar(100) not null,				/* 비밀번호(암호화처리) */
  nickName	varchar(20) not null,			/* 별명(중복불허) */
  name			varchar(20) not null,			/* 회원 성명 */
  gender		varchar(5)  default '남자',/* 성별 */
  birthday	datetime		default now(),/* 생일 */
  tel				varchar(15),							/* 전화번호(010-1234-5678) */
  address   varchar(100),							/* 주소 */
  email			varchar(50) not null,			/* 이메일(아이디/비밀번호 분실시 필요)-형식 체크할것 */
  homePage  varchar(50),							/* 홈페이지(블로그) 주소 */
  job				varchar(20),							/* 직업 */
  hobby			varchar(60),							/* 취미 */
  photo			varchar(100) default 'noimage.jpg',	/* 회원사진 */
  content		text,											/* 자기소개 */
  userInfor char(6) default '공개', 		/* 회원 정보 공개여부(공개/비공개) */
  userDel   char(2) default 'NO',			/* 회원 탈퇴 신청 여부(OK:탈퇴신청한회원, NO:현재가입중인회원) */
  point			int default 100,					/* 회원가입포인트(최초 100, 방문시마다 1포인트 증가) */
  level 		int default 1,						/* 4:준회원, 3:정회원, 2:우수회원 (1:운영자) 0:관리자 */
  visitCnt 	int default 0,						/* 방문횟수 */
  startDate datetime default now(),		/* 최초 가입일 */
  lastDate 	datetime default now(),		/* 마지막 접속일 */
  todayCnt	int default 0,						/* 오늘 방문한 횟수 */
  primary key(idx, mid)
);

desc member2;

insert into member2 values (default,'admin','1234','관리맨','관리자',default,default,'010-3423-2704','경기도 안성시 공도로 142', 'cjsk1126@naver.com','http://blog.daum.net/cjsk1126','프리랜서','등산/바둑',default,'관리자입니다.',default,default,default,default,default,default,default,default);

select * from member2;

SELECT TIMESTAMPDIFF(DAY, '2022-05-01', '2022-05-06');
SELECT TIMESTAMPDIFF(DAY, lastDate, NOW()) from member;
SELECT TIMESTAMPDIFF(DAY, lastDate, NOW()) from member where userDel='OK';

SELECT *,TIMESTAMPDIFF(DAY, lastDate, NOW()) as applyDiff from member order by idx desc;

/*
* DATEDIFF : 날짜 차이(2022-01-31)를 구하는 함수(날짜1 - 날짜2)
* 사용법 : DATEDIFF(날짜1, 날짜2)
* 사용예 :
SELECT DATEDIFF('2022-05-01', '2022-05-06');

* TIMESTAMPDIFF함수 : 날짜와 시간(2022-01-31 12:30:50) 차이를 구하는 함수(날짜2 - 날짜1)
* 사용법 : TIMESTAMPDIFF(날짜1, 날짜2)
* 단위 :
  초 : SECOND , 분 : MINUTE , 시 : HOUR
  일 : DAY , 월 : MONTH , 년 : YEAR
* 사용예 :
SELECT TIMESTAMPDIFF(DAY, '2022-05-01', '2022-05-06');
*/
