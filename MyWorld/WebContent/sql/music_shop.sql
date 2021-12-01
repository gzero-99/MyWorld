show tables;

drop table music_shop;

create table if not exists music_shop(
	m_id varchar(10) not null,
	m_name varchar(50),
	m_filename varchar(30),
	m_price integer,
	m_singer varchar(50),
	m_description long,
	m_releaseDate varchar(20),
	m_genre varchar(20),
	primary key (m_id)

)default character set utf8 collate utf8_general_ci;

-- music shop 테이블 
-- id 음악 아이디, name 이름,filename 음악파일.mp3, 
-- price 가격, singer 가수, description 설명, releaseDate 발매일
-- genre 장르 

select * from music_shop;
desc music_shop;

