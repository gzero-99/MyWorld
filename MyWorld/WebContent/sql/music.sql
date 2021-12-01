show tables;

drop table music;

create table if not exists music(
	id int NOT NULL AUTO_INCREMENT,
	m_id varchar(20) not null,
	m_owner varchar(20) not null,
	m_main_on boolean not null,
	primary key (id)

)default character set utf8 collate utf8_general_ci;

-- music  테이블 
-- 소유된 음악 id(자동생성) / m_id 실제음악의 아이디 / owner 음악 주인유저 
-- 사용할때에는 owner을 확인하고, m_id를 이용해서 music_shop으로가서 등록된 상품 
-- 의 정보를 가져와 출력한다 . 
-- main_on 은 on(1) 일 경우 , main(프로필출력)에 등록된 음악이고, 0일경우 등록되지 않은 음악라 출력되지 않음

select * from music;
desc music;

--user01 예시 
insert into music (id, m_id, m_owner, m_main_on) values (1,'MCD0001','user01','1');
insert into music ( m_id, m_owner, m_main_on) values ('MCD0002','user01','0');
insert into music ( m_id, m_owner, m_main_on) values ('MCD0003','user01','0');

--음악 구매 후 edit에서 대표음악 선택해줘야 함.

