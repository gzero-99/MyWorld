show tables;

drop table photo;

create table if not exists photo(
	p_id int NOT NULL AUTO_INCREMENT,
	p_title varchar(50),
	p_photo varchar(30),
	p_postingTime varchar(30),
	p_uploader varchar(20),
	p_comment varchar(50),
	primary key (p_id)

)default character set utf8 collate utf8_general_ci;

-- 사진게시글 테이블 
-- id 알아서증가 title 제목 photo 업로드사진 postingtime 작성시간 uploader 업로더  comment 사진 코멘트 

select * from photo;
desc photo;

--user01예시 
insert into photo (p_id, p_title, p_photo, p_postingTime, p_uploader, p_comment) 
	values(1,'2021년 여름방학 속초여행','ocean01.jpeg', '2021.06.29.화요일 17:40 pm','user01','정말 날씨도 좋고 바다도 예쁜 날이었다.');
insert into photo (p_title, p_photo, p_postingTime, p_uploader, p_comment) 
	values('2021년 여름방학 속초여행 2 ','ocean02.jpeg', '2021.06.30.수요일 12:12 pm','user01','사진을 볼 때마다 또 가고 싶어진다.');