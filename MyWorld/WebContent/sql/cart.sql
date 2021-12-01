show tables;

drop table cart;

create table if not exists cart(
	id int NOT NULL AUTO_INCREMENT,
	music_id varchar(20) not null,
	owner varchar(20) not null,
	primary key (id)

)default character set utf8 collate utf8_general_ci;

-- cart  테이블 
-- 장바구니 id(자동생성) / music_id 실제음악의 아이디 / owner 장바구니 주인
-- 장바구니 목록에서 구매하면 owner을 확인하고, music_file 이름가져와서 구매! 
-- 구매 : (music에 등록! main_on은 뭐로 대표로 할지 고르도록 해야 한다. )
-- 하고 cart  디비에서 지운다.

select * from cart;
desc cart;

insert into cart (id, music_id, owner) values (1,'MCD0004','user01');
insert into cart ( music_id,owner) values ('MCD0005','user01');
insert into cart ( music_id, owner) values ('MCD0006','user01');

--음악 구매할때 구매하면 뭐를 대표로 할건지 고르도록 해야함 

