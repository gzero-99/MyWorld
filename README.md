# MyWorld
MyWorld : jsp web programming project 

지능웹설계 201812245 장지영
2021-2 지능 웹 설계 프로젝트 [MyWorld] 

================================================

< MyWorld 실행 가이드 >

(0) MyWorld Project file - Tomcat Server에 등록
(1) MySQL DB *
* Database (myworlddb)에 
* Table 6개 -> sql 폴더 안의 .sql 파일들 execute All
- member
- music_shop
- music
- forum
- photo
- cart 
sql문을 실행하여 위 6개의 table 을 추가한다.

(2)
initial.jsp를 Run 한다. *
[ 관리자 로그인 ] / [ 회원 로그인 ]/ [ 회원 가입 ] / 특징소개 / 연락 

(2-1) 관리자로그인 ( mw_admin / 1234 ) 
-> 음악 상품 추가 등록

(2-2) 회원가입 후에 *
-> 사용자의 id로 myWorld_user01.jsp 의 파일 속 내용을 복사 붙여넣기 하여 jsp 파일을 하나 추가로 만든다.
ex. id 가 korla2 라면 myWorld_korla2.jsp 파일을 WebContent 폴더에 직접 생성해주고 / 위 설명대로 진행.

(3) 그 후 사용자의 계정으로 로그인 진행
edit / home / forum / photo  / shop  메뉴 있음
ex. korla2 가 로그인 했다면 myWorld_korla2.jsp가 열림 (세션 생성)

(3-1) home 
사용자 프로필 / 사진 글 출력 
[로그아웃] && [집 아이콘] -> (initial.jsp로 back) 
프로필 음악을 사용하려면 (3-4) shop에서  (2-1)에서 추가한 음악들 구매 후 (3-5)edit 에서 음악 선택

(3-2) forum
사용자 게시글 출력  
[글 작성하기] -> 게시글 작성 후 [post] 

(3-3) photo
사용자 사진 글 출력 
[사진 업로드하기] -> 사진 글 작성 후 [post]

(3-4) shop
등록한 음악 장르별로 출력 ( pop / electronica / cinematic / jazz / acoustic )
음악 재생 가능  / [ 구매 >> ]  -> 사용자 장바구니에 음악 추가
[ 장바구니 ] -> 장바구니로 이동

(3-4-1) 장바구니
장바구니에 추가한 음악 가격과 정보 출력
[삭제] : 음악 개별 삭제 가능 / [삭제하기] : 장바구니 내역 전부 삭제 가능
[결제하기] : 장바구니 음악 결제 정보 입력 페이지(3-4-2)로 이동 
[<< 쇼핑계속하기] : (3-4)로 back

(3-4-2) 결제 정보 입력
사용자 개인정보, 결제할 카드 정보 입력 
[등록] : 결제 안내 페이지(3-4-3)로 이동

(3-4-3) : 입력한 결제정보 / 장바구니 내역 출력
[결제완료] : 음악 구매 완료 music DB에 사용자 프로필 음악 목록에 추가됨
 -> (3-5) edit 에서 대표 프로필 음악 선택 가능

(3-5) edit 
사용자 자기소개 / 프로필 사진 / 프로필 음악 변경 
[적용] :  프로필 사진과 음악은 변경 필수 / 자기소개는 변경하지 않아도 됨 

================================================
 < 소스코드 설명 #1 >

* initial.jsp 에서 시작 	초기화면 
- initial_features.jsp	특징
- initial_contact.jsp 	연락처
- initial_header.jsp 	헤더
- footer.jsp

[0] 관리자 로그인 (tomcat server : tomcat-users.xml 에 등록된)
-  id: mw_admin / pw: 1234 / role: mw_admin
- admin_login.jsp	관리자 로그인
- admin_process.jsp	관리자 로그인 동작
- login_failed.jsp	로그인 실패
- logout.jsp 
- footer.jsp

-> addMusic.jsp  	music_shop DB 음악 추가 등록
- addMusic_process.jsp	음악 등록 동작 
- footer.jsp

[1] 회원 가입 
- signup.jsp		회원가입
- signup_process.jsp	회원 가입 동작 	member  DB
- footer.jsp
 
[2] 회원 로그인 (session) 
- signin.jsp		회원 로그인 
- signin_process.jsp	회원 로그인 동작 
- footer.jsp

ex.
-> id : user01 pw:1234 로 로그인 (member table 에 저장된)
->  본인 웹사이트 open 됨.
myWorld_user01.jsp

————————————————————
< 소스코드 설명 #2 >

*  myWorld_user01.jsp 
[0] home 
- main_header.jsp	메인 헤더 
- main_profile.jsp	프로필 출력		member DB
- main_photo.jsp		사진글 출력		photo DB
- footer.jsp		메인 푸터
- logout.jsp		로그아웃 
<img width="1427" alt="home" src="https://user-images.githubusercontent.com/70897603/144176572-d7335d9b-faab-4a81-b31b-b5bddda4b2f6.png">

[1] edit
- main_header.jsp
- main_edit.jsp		프로필 편집 페이지	member DB
- edit_process.jsp 	프로필 편집 동작 
- footer.jsp
<img width="1427" alt="edit" src="https://user-images.githubusercontent.com/70897603/144176605-b1105fac-55e0-4d1e-9e22-c8f80fb48ca6.png">

[2] forum
- main_header.jsp
- forum_board.jsp	게시글 출력 
- forum_post.jsp 	게시글 작성 	forum DB
- forumPost_process.jsp 	게시글 작성 동작 
- footer.jsp
<img width="1427" alt="forum" src="https://user-images.githubusercontent.com/70897603/144176627-7158829a-eca7-4203-8898-ab50df0b2414.png">

[3]  photo
- main_header.jsp
- main_photo.jsp
- photo_board.jsp	사진글 출력
- photo_post.jsp		사진글 작성 	photo DB
- photoPost_process.jsp 	사진글 작성 동작 
- footer.jsp
<img width="1427" alt="photo" src="https://user-images.githubusercontent.com/70897603/144176642-a8078d17-e14c-45e2-bcb6-b0f6925e63fd.png">

[4] shop
- shop.jsp			음악 쇼핑  		music_shop DB
- shop_cart.jsp			장바구니 출력		cart DB
- shop_addCart.jsp		장바구니에 추가
- shop_deleteCart.jsp		장바구니에서 음악 모두 삭제 
- shop_removeCart.jsp		장바구니에서 음악 한 개 삭제 
- shop_purchaseCart.jsp 		장바구니에서 구매		music DB
- footer.jsp
<img width="1427" alt="shop" src="https://user-images.githubusercontent.com/70897603/144176655-be167095-97a9-48c8-acbc-7a609d95373e.png">

- paymentInfo.jsp 		결제정보등록 		쿠키 이용
- paymentInfo_process.jsp		결제 정보 처리 페이지 
- paymentInfo_print.jsp 		결제정보 입력 화면 출력 -> 결제완료로 음악 등록 완료 music DB
- footer.jsp

———————————————————

* 그 외 
validation.js
bundle.message_en.properties
bundle.message.properties
web.xml
tomcat server : tomcat-users.xml 
blog.css
cover.css
connection.jsp
dbconn.jsp

———————————————————





