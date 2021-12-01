show tables;

drop table forum;

create table if not exists forum(
	f_id int NOT NULL AUTO_INCREMENT,
	f_title varchar(50),
	f_contents long,
	f_postingTime varchar(30),
	f_writer varchar(20),
	primary key (f_id)

)default character set utf8 collate utf8_general_ci;

-- 게시글 테이블 
-- id 알아서증가 title 제목 contents 작성내용 postingtime 작성시간 writer 작성자 

select * from forum;
desc forum;

insert into forum (f_id, f_title, f_contents, f_postingTime, f_writer) 
	values(1,'첫 번째 게시글입니다.','아무래도 첫 번째 게시글이니, 아무말이나 적어보겠습니다. 그래도 분량이라도 긴게 중요하지 않을까요? 제 지능 웹페이지는 나만의 홈페이지를 가지게 되는 웹페이지 입니다. 쇼핑기능도 존재하고,자기만의 글을 포스팅할수있으며, 사진을 업로드할 수 있습니다. 그리고 친구의 링크도 저장할 수 있도록 하고 싶습니다. ','2021/11/21/일요일 12:30 pm','user01');
insert into forum (f_title, f_contents, f_postingTime, f_writer) 
	values('두 번째 게시글입니다.','오늘은 지능웹설계와  네트워크 보안을 공부하는 날입니다. 교수님께서 업로드해주신 강의를 얼른 시청하고 과제도 어서 해야겠습니다. 내일 알바를 가야하기 때문에 일찍 자야합니다. ','2021/11/24/수요일 18:30 pm','user01');
insert into forum (f_title, f_contents, f_postingTime, f_writer) 
	values('귤을 먹은 날','어머니께서 귤을 주셨습니다. 역시 겨울에는 귤을 까먹으면서 공부를 해야 해요. 새콤달달하네요. 맛있게 먹었습니다. 감사합니다~ ','2021/11/25/요일 00:05 am','user01');
insert into forum (f_title, f_contents, f_postingTime, f_writer) 
	values('겨울은 춥다.','산책을 나왔다. 어느새 공기가 차가워졌다. 손 발이 시리다. 목도리와 장갑을 꺼내야겠다. 롱패딩도 까먹지말아야지. 곧 있으면 12월이다. ','2021/11/25/수요일 02:05 am','user01');
insert into forum (f_title, f_contents, f_postingTime, f_writer) 
	values('우유랑 오레오과자','갑자기 초코가 땡겨서 오레오를 사왔다. 오레오랑 우유는 국룰인데,, 냉장고를 보니 우유가 있었다. 휴 다행~  비틀어서 우유에 담궜다 먹으면 맛있다. ','2021/11/25/수요일 02:10 am','user01');
		