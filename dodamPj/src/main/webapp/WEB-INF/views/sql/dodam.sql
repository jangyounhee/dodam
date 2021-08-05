-- 유실동물 신고 관련(아래 수정사항 합친 테이블)
create table tbl_lost (
    b_no number primary key,
    b_title varchar2(50) not null,
    user_name varchar2(10) not null,
    user_email varchar2(50),
    user_tel varchar2(20) not null,
    write_date timestamp default sysdate,
    b_viewcnt number,
    p_name varchar2(10) not null,
    p_species varchar2(20) not null,
    p_age varchar2(20) not null,
    p_gender varchar2(10) not null,
    p_lostdate timestamp not null,
    p_lostplace varchar2(50) not null,
    p_character varchar2(200),
    p_picture varchar2(100),
    user_id varchar2(20)references user_info(user_id)
);

-- 유실동물 추가(db 위에 버전으로 추가했다면 이것도 추가해주세요)
alter table tbl_lost
add (p_picture varchar2(100));
alter table tbl_lost
add (user_id varchar2(20)references user_info(user_id));

-- 분실신고 게시판 시퀀스
create sequence seq_lost_bno;

-- 첨부파일 테이블1(분실신고)
create table tbl_attach(
    file_name varchar2(200) primary key,
    b_no number references tbl_lost(b_no)
);

-- 첨부파일 테이블2(보호동물)
create table tbl_protectAttach(
    file_name varchar2(200) primary key,
    a_no number references tbl_animal(a_no)
);

-- 첨부파일 테이블3(입양동물)
create table tbl_adoptAttach(
    file_name varchar2(200) primary key,
    ad_no number references tbl_adopt(ad_no)
);

-- 보호중인 유실 동물(아래 수정사항 합친 테이블)
create table tbl_animal (
    a_no number primary key,
    a_species varchar2(50) not null,
    a_color varchar2(20) not null,
    a_gender varchar2(10) not null,
    a_age varchar2(30) not null,
    a_weight varchar2(10) not null,
    a_findplace varchar2(50) not null,
    a_enterdate varchar2(30) not null,
    a_neut varchar2(10) not null,
    a_character varchar2(200),
    a_picture varchar2(100),
    a_state varchar2(50)
);

-- 보호중 동물 db 수정사항(db 위에 버전으로 추가했다면 이것도 추가해주세요)
alter table tbl_animal
add (a_picture varchar2(100));
alter table tbl_animal
add (a_state varchar2(50));
alter table tbl_animal
modify a_age varchar2(30);

-- 보호중 동물 시퀀스
create sequence seq_animal_no;

-- 입양동물 테이블
create table tbl_adopt (
    ad_no number primary key,
    ad_adoptstate varchar2(20) not null,
    ad_species varchar2(20) not null,
    ad_kind varchar2(40) not null,
    ad_gender varchar2(10) not null,
    ad_age varchar2(30) not null,
    ad_weight varchar2(20) not null,
    ad_color varchar2(50) not null,
    ad_findplace varchar2(100) not null,
    ad_resqueday varchar2(50) not null,
    ad_adoptpossible varchar2(50),
    ad_etc varchar2(500),
    ad_picture varchar2(100)
);

-- 입양 테이블 시퀀스
create sequence seq_adopt_no;

-- 입양 신청 테이블(user_id 추가)
create table tbl_apply_user (
    au_no number primary key,
    user_name varchar2(20) not null,
    user_tel varchar2(10) not null,
    adopt_date varchar2(20) not null,
    adopt_time varchar2(50) not null,
    form_title varchar2(50) not null,
    form_content varchar2(1000) not null,
    user_id varchar2(20)references user_info(user_id)
);

-- 입양 신청 테이블 user_id 추가(db 위에 버전으로 추가했다면 이것도 추가해주세요)
alter table tbl_apply_user
add (user_id varchar2(20)references user_info(user_id));

-- 입양 신청 테이블 시퀀스
create sequence seq_apply_no;

-- 회원정보 테이블
create table user_info(
    user_id varchar2(20) primary key,
    user_pw varchar2(18) not null,
    user_name varchar2(20) not null,
    user_email varchar2(30),
    phoneNum varchar2(30) default 0,
    user_birth number(10) not null,
    auth_level number default 0
);

-- 관리자 테이블
create table admin_member(
    admin_id varchar2(20) primary key,
    admin_pw varchar2(18) not null,
    admin_name varchar2(20) not null
);

-- 자유게시판 테이블
create table tbl_board(
    b_no number primary key, -- 글번호
    b_title varchar2(100) not null, -- 글제목
    b_content varchar2(1000) not null, -- 글내용
    user_id varchar2(20) references user_info(user_id), -- 작성자
    b_regdate timestamp default sysdate, -- 작성일
    b_count number default 0, -- 조회수
    re_group number default 0, -- 글그룹(원글번호)
    re_seq number default 0, -- 같은 글그룹 내에서 출력 순서
    re_level number default 0 -- 답글 들여쓰기용
);

-- 게시판 글번호용 시퀀스
create sequence seq_board_bno;

-- 봉사활동 테이블(user_id 추가)
create table tbl_volunteer (
	v_no number not null primary key,
	v_name varchar2(50) not null,
	v_age number not null,
	v_place varchar2(50) not null,
	v_phonenum varchar2(50)  not null,
	v_email varchar2(50),
	v_time varchar2(50) not null,
	v_date varchar2(50) not null,
	v_etc varchar2(1000),
    user_id varchar2(20) references user_info(user_id)
);

-- 봉사활동 테이블 (user_id추가, 윗 db로 추가하신 분들은 이것도 추가해주세요)
alter table tbl_volunteer
add user_id varchar2(20) references user_info(user_id);

-- 봉사활동 테이블 시퀀스
create sequence seq_vno;

-- 공지사항 테이블
create table notice(
    n_no number primary key,
    n_title varchar2(100),
    n_content varchar2(1000),
    n_date timestamp default sysdate,
    n_readcount number default 0,
    n_group number default 0,
    n_seq number default 0,
    n_level number default 0,
    n_filepath varchar2(200)
);

-- 공지사항 테이블 시퀀스
create sequence seq_notice_no;	

-- 댓글 테이블
create table tbl_comment(
    c_no number primary key, -- 댓글 번호(PK)
    b_no number references tbl_board(b_no), -- 해당 글번호(FK)
    user_id varchar2(50) references user_info(user_id), -- 회원 아이디(FK)
    c_content varchar2(100) not null, -- 댓글 내용
    c_regdate timestamp default sysdate, -- 댓글 작성일
	ab_no number references tbl_animalboard(ab_no) -- 동물 게시판 댓글
);

-- 댓글 시퀀스
create sequence seq_comment_cno;

-- 동물게시판 댓글 시퀀스
create sequence seq_animalcomment_cno;

-- 동물게시판 테이블(첨부파일 경로 추가)
create table tbl_animalboard(
    ab_no number primary key, -- 글번호
    ab_title varchar2(100) not null, -- 글제목
    ab_content varchar2(1000) not null, -- 글내용
    user_id varchar2(20) references user_info(user_id), -- 작성자
    ab_regdate timestamp default sysdate, -- 작성일
    ab_count number default 0, -- 조회수
    are_group number default 0, -- 글그룹(원글번호)
    are_seq number default 0, -- 같은 글그룹 내에서 출력 순서
    are_level number default 0, -- 답글 들여쓰기용
	comment_cnt number default 0, -- 댓글 카운트
    ab_picture varchar2(1000)
);

-- 동물정보뉴스 첨부파일 경로 속성 추가(윗 db로 추가하신 분들은 이것도 추가해주세요)
alter table tbl_animalboard
add (ab_picture varchar2(1000));

-- 동물게시판 글번호용 시퀀스
create sequence seq_animalboard_bno;

-- 고객센터 테이블
create table tbl_customerboard(
    cb_no number primary key, -- 글번호
    cb_title varchar2(100) not null, -- 글제목
    cb_content varchar2(4000) not null, -- 글내용
    user_id varchar2(20) references user_info(user_id), -- 작성자
    cb_regdate timestamp default sysdate, -- 작성일
    cb_count number default 0, -- 조회수
    re_group number default 0, -- 글그룹(원글번호)
    re_seq number default 0, -- 같은 글그룹 내에서 출력 순서
    re_level number default 0 -- 답글 들여쓰기용
);

-- 고객센터 글번호용 시퀀스
create sequence seq_customerboard_bno;

-- 자유게시판 첨부파일 테이블
create table tbl_file(
	file_name varchar2(200) primary key,
	b_no number references tbl_board(b_no)
);

-- 동물정보뉴스 게시판 첨부파일 테이블
create table tbl_newsfile(
    file_name varchar2(200) primary key,
    ab_no number references tbl_animalboard(ab_no)
);
