select * from t_member;

truncate table t_member;
delete from t_member;

select * from t_member;

select * from T_AUTHORITIES;


insert into T_AUTHORITIES(member_id, authority) values('test2', 'user');
insert into T_AUTHORITIES(member_id, authority) values('test2', 'admin');
insert into T_AUTHORITIES(member_id, authority) values('testtest', 'user');

update T_MEMBER set img_path='aeyong kim.png' where member_id='test2';
update T_MEMBER set img_path='aeyong kim.png' where member_id='testtest';
update T_MEMBER set img_path='aeyong kim.png' where member_id='testtest2';

update t_member set nick='닉네임변경' where member_id='test2';

update
			t_member
		set
			nick='테스트킴애용',
			img_path='aeyong ddi.png'
		where
			member_id='test2';

select * from t_member_loc;
delete from t_member_loc where member_id='test2';
insert into t_member_loc values('testtest', '4146151000', 37.233311, 127.194260, '삼환나우빌 109동 앞');



select t_goods_id_seq.currval, t_goods_id_seq.nextval from dual;

drop sequence t_goods_id_seq;
create sequence t_goods_id_seq;
delete from t_goods;
delete from t_trade_loc;
delete from t_goods_img;
select * from T_GOODS;
select * from t_trade_loc;
select * from t_goods_img;