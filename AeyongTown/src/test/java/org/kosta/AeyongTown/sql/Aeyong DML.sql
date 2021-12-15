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