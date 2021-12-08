drop table t_member;
drop table t_category;
drop sequence t_goods_id_seq;
drop table t_goods;
drop sequence t_wish_id_seq;
drop table t_wish_list;
drop sequence t_msg_seq;
drop table t_msg;
drop table t_member_loc;
drop table t_trade_loc;
drop table t_location;
drop table t_member_img;
drop table t_goods_img;
drop table t_authorities;


--1 유저 테이블 생성
create table t_member(
    member_id varchar2(30) primary key,
    m_password varchar2(100) not null,
    m_name varchar2(20) not null,
    nick varchar2(40) not null,
    tel varchar2(11) not null,
    birth date not null,
    email varchar2(50) not null,
    gender varchar2(6) not null,
    status varchar2(4) default 'on' not null,
    constraint check_gender check( gender in('남성','여성')),
    constraint check_status check( status in('on', 'off'))
);

--2 카테고리 테이블
create table t_category(
    category_id number primary key,
    category_name varchar2(40) not null
);

--3 상품 시퀀스, 테이블 생성
create sequence t_goods_id_seq;

create table t_goods(
    goods_id number primary key,
    member_id varchar2(30) not null,
    category_id number not null,
    title varchar2(200) not null,
    info clob not null,
    price number not null,
    upload_date date default sysdate not null,
    status varchar2(20) default 'new' not null,
    view_count number default 0 not null,
    constraint seller_id foreign key (member_id) references t_member(member_id) on delete cascade,
    constraint check_goods_status check (status in ('new','reserved','soldout')),
    constraint fk_category_id foreign key (category_id) references t_category(category_id)
);

--4 찜하기 시퀀스, 테이블 생성
create sequence t_wish_id_seq;

create table t_wish_list(
    wish_id number primary key,
    member_id varchar2(30) not null,
    goods_id number not null,
    wish_date date default sysdate not null,
    CONSTRAINT wish_member_id foreign key (member_id) references t_member(member_id) on delete cascade,
    CONSTRAINT wish_goods_id foreign key (goods_id) references t_goods(goods_id) on delete cascade
);

--5 메세지 시퀀스, 테이블 생성
create sequence t_msg_seq;

create table t_msg(
    msg_id number primary key,
    member_id varchar2(30) not null,
    goods_id number not null,
    parent_id number null,
    send_time date default sysdate not null,
    msg varchar2(500) not null,
    constraint msg_member_id foreign key (member_id) references t_member(member_id) on delete set null,
    constraint msg_goods_id foreign key (goods_id) references t_goods(goods_id) on delete cascade,
    constraint reply_msg foreign key (parent_id) references t_msg(msg_id)
);

--6 위치 테이블
create table t_location(
    code varchar2(20) primary key,
    sido varchar2(20) not null,
    sigungu varchar2(30) not null,
    dong varchar2(20) not null
);

--7 유저 위치
create table t_member_loc(
    member_id varchar2(30) not null,
    code varchar2(20) not null,
    map_lat number not null,
    map_lnt number not null,
    detail varchar2(200) null,
    constraint fk_member_id foreign key (member_id) references t_member(member_id) on delete cascade,
    constraint fk_code foreign key (code) references t_location(code),
    constraint pk_member_loc primary key(member_id, code)
);

--8 거래 위치
create table t_trade_loc(
    goods_id number not null,
    code varchar2(20) not null,
    map_lat number not null,
    map_lnt number not null,
    detail varchar2(200) null,
    constraint fk_goods_id foreign key (goods_id) references t_goods(goods_id) on delete cascade,
    constraint fk_code2 foreign key (code) references t_location(code),
    constraint pk_trade_loc primary key(goods_id, code)
);


--9 상품 이미지 테이블
create table t_goods_img(
    goods_id number not null,
    img_id number not null,
    img_path varchar2(200) not null,
    constraint img_goods_id foreign key(goods_id) references t_goods(goods_id) on delete cascade,
    constraint pk_t_goods_img primary key(goods_id, img_id),
    constraint check_img_id check(img_id in(1, 2, 3, 4, 5, 6))
);


--10 유저 이미지 테이블
create table t_member_img(
    member_id varchar2(30) not null,
    img_path varchar2(300) not null,
    constraint fk_member_img foreign key (member_id) references t_member(member_id) on delete cascade,
    constraint pk_member_img primary key (member_id, img_path)
);

--11 유저 권한
create table t_authorities(
    member_id varchar2(30) not null,
    authority varchar2(10) not null,
    constraint aut_member_id foreign key (member_id) references t_member(member_id) on delete cascade
);