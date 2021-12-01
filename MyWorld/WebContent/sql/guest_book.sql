show tables;

drop table guest_book;
-- guest_book : 이번 프로젝트에서는 사용하지 않음! 
create table if not exists guest_book(
	g_id int NOT NULL AUTO_INCREMENT,
	g_content varchar(50),
	g_postingTime varchar(30),
	g_writer varchar(20),
	g_reader varchar(20),
	primary key (g_id)

)default character set utf8 collate utf8_general_ci;

-- 방명록 테이블 
-- id 알아서증가 content내용  postingtime 작성시간 writer방명록작성자  reader방명록주인 

select * from guest_book;
desc guest_book;

--insert into guest_book (g_id, g_content, g_postingTime, g_writer, g_reader) 
	--values(1, '반가워요 이번에 처음 왔어요~', '2021/06/29/화요일 17:40 pm', 'user02' ,'user01');
-- 나중에 member 테이블에서 해당 writer정보 가져와서 name 뜨게 출력하기. reader에 해당하는 id의 방명록만 출
	