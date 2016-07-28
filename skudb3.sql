delete from book;
delete from author;

commit; -- 새 트랜잭션 시작

select * from book;
select * from author;

insert into author values(1, '박경리', '토지작가');
insert into author(no, name) values(2, '이훈');
insert into author(name, no) values('공자', 3);
savepoint sp1; -- 세이브 포인트 sp1

delete from author where no = 1;
delete from author where no = 2;
savepoint sp2; -- 세이브 포인트 sp2

update author set name = '꽁자' where no = 3;
rollback to sp1; -- 세이브 포인트 sp1로 롤백
select * from author;

commit;

set transaction read only; -- select만 가능
set transaction read write; -- 오라클에서 기본으로 설정해둠
select * from author;
insert into author values(5, '전유리', null);

commit;
select * from author;
update author set name = 'yury' where name = '전유리';
commit;