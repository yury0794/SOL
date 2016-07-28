-- insert1
insert into author values(1, '박경리', '토지작가');
insert into author(name, no) values('공자', 3);

-- insert2, 지정되지 않은 칼럼은 null이 들어감, 순서 바꿔도 들어감
insert into author(no, name) values(2, '이훈');
insert into author(name, no) values('공자', 3);
select * from author;

-- inset3
insert into book values(1, '토지', null, 1);
insert into book(no, title, author_no) values(2, '칼의노래', 2);
select * from book;

-- insert4 (subquery)
insert into book(select 3, '논어', null, 3 from dual);
select * from book;

-- update1
update book set title = '토지3판', rate = 5, author_no = 3 where no = 1;
select * from book;
rollback; -- commit을 하지 않았기 때문에 다 삭제됨
commit; -- commit을 하고 rollback을 하면 없어지지 않음

-- update2
update book set rate = 5 where author_no = (select no from author where name = '이훈');
select * from book;

-- delete1
delete from book where no = 3;
select * from book;
rollback;
commit;

--delete2
delete from book where author_no = (select no from author where name = '이훈');
select * from book;
commit;

-- pseudo column
select user from book; -- 현재 사용자 알아내기