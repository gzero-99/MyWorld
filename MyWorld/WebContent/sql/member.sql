show tables;

drop table member;
delete from member where id='1'or id='2';

create table if not exists member(
	id varchar(20) not null,
	passwd varchar(20),
	name varchar(30),
	profile varchar(30),
	intro varchar(50),
	primary key (id)

)default character set utf8 collate utf8_general_ci;

-- id passwd name 이름 profile 사진 intro 자기소개 

select * from member;
desc member;
alter table member modify intro long;
-- 자기소개(intro) long 으로 변경
