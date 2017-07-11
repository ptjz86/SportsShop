select * from tbl_user

alter table tbl_user add (phone varchar2(30));

commit;

--ȸ���������̺�, �ܷ�Ű: authority->user
create table tbl_user(
    id varchar2(50) primary key,
    position varchar2(50),--position �ܷ�Ű
    pw varchar2(50),
    name varchar2(50),
    addr1 varchar2(255),
    addr2 varchar2(255),
    state varchar2(50),
    email varchar2(50),
    birthday date default sysdate,
    gender varchar(50)
)

insert into tbl_user(id, pw, position) values('u001', 'u001', 'user');
insert into tbl_user(id, pw, position) values('u002', 'u002', 'user');
insert into tbl_user(id, pw, position) values('u003', 'u003', 'user');

insert into tbl_user(id, pw, position) values('admin1', 'admin1', 'admin');
insert into tbl_user(id, pw, position) values('admin2', 'admin2', 'admin');
insert into tbl_user(id, pw, position) values('admin3', 'admin3', 'admin');

insert into tbl_user(id, pw, position) values('ceo1', 'ceo1', 'ceo');
insert into tbl_user(id, pw, position) values('ceo2', 'ceo2', 'ceo');
insert into tbl_user(id, pw, position) values('ceo3', 'ceo3', 'ceo');
commit;


--�Խ������̺�, �ܷ�Ű: user->board
create table tbl_board(
    bno number(38) primary key,
    id varchar2(50),--id,position �ܷ�Ű
    position varchar2(50),
    category varchar2(50),
    title varchar2(100),
    content varchar2(4000),
    replycnt number(38) default 0,
    viewcnt number(38) default 0,
    regdate date default sysdate,
    updatedate date default sysdate
)

select * from tbl_board;

select * from tbl_board where category='soccer';
select * from tbl_board where category='baseball';
select * from tbl_board where category='basketball';


insert into tbl_board(bno, category, title, content) values(1, 'soccer', 'stitle1', 'scontent1');
insert into tbl_board(bno, category, title, content) values(2, 'soccer', 'stitle2', 'scontent2');
insert into tbl_board(bno, category, title, content) values(3, 'soccer', 'stitle3', 'scontent3');

insert into tbl_board(bno, category, title, content) values(4, 'baseball', 'btitle1', 'bcontent1');
insert into tbl_board(bno, category, title, content) values(5, 'baseball', 'btitle2', 'bcontent2');
insert into tbl_board(bno, category, title, content) values(6, 'baseball', 'btitle3', 'bcontent3');

insert into tbl_board(bno, category, title, content) values(7, 'basketball', 'bktitle1', 'bkcontent1');
insert into tbl_board(bno, category, title, content) values(8, 'basketball', 'bktitle2', 'bkcontent2');
insert into tbl_board(bno, category, title, content) values(9, 'basketball', 'bktitle3', 'bkcontent3');

alter table tbl_board add foreign key(id) references tbl_user(id);
alter table tbl_board add foreign key(position) references tbl_user(position);


--������̺�, �ܷ�Ű: board->reply
create table tbl_reply(
    rno number(38) primary key,
    bno number(38), --bno, id, position �ܷ�Ű
    id varchar2(50),
    position varchar2(50),
    content varchar2(50),
    regdate date default sysdate,
    updatedate date default sysdate
)

commit

alter table tbl_reply add foreign key(bno) references tbl_board(bno);
alter table tbl_reply add foreign key(id) references tbl_user(id);
alter table tbl_reply add foreign key(position) references tbl_authority(position);



--���ֹ�������(admin), �ܷ�Ű: user->qna
create table tbl_qna(
    qno number(38) primary key,
    id varchar2(50),--id, position �ܷ�Ű
    position varchar2(50),
    title varchar2(100),
    q_category varchar2(50),
    content varchar2(4000),
    viewcnt number(38) default 0,
    regdate date default sysdate,
    updatedate date default sysdate
)

alter table tbl_qna add foreign key(id) references tbl_user(id);
alter table tbl_qna add foreign key(position) references tbl_authority(position);

--1:1�������̺�(user), �ܷ�Ű: user->msg
create table tbl_msg(
    id varchar2(50),--id, position �ܷ�Ű
    position varchar2(50),
    title varchar2(50),
    content varchar2(4000),
    regdate date default sysdate
)

alter table tbl_msg add foreign key(id) references tbl_user(id);
alter table tbl_msg add foreign key(position) references tbl_authority(position);



--ȸ���������̺�, �ܷ�Ű: user->user_info
create table tbl_user_info(
    id varchar2(50),
    position varchar2(50),
    cash number(38) default 0,
    mileage number(38) default 0
)

alter table tbl_user_info add foreign key(id) references tbl_user(id);
alter table tbl_user_info add foreign key(position) references tbl_authority(position);

--��ǰ����
--��ǰ�������̺�, �ܷ�Ű: user->product_info(�ܷ�Ű ��������) --id,position �ܷ�Ű
create table tbl_product_info(
    pno number(38) primary key,
    id varchar2(50),
    position varchar2(50),
    p_category varchar2(50),
    p_title varchar2(100),
    p_name varchar2(50),
    p_brand_name varchar2(50),
    p_ori_price number(38),
    p_price number(38),
    p_discount_rate number(38),
    p_img_1 varchar2(255),
    p_img_2 varchar2(255),
    p_ori_amount number(38),
    p_amount number(38),
    p_made varchar2(50),
    p_content varchar2(4000),
    p_goodcnt number(38) default 0,
    p_viedcnt number(38) default 0,
    regdate date default sysdate,
    updatedate date default sysdate
)

alter table tbl_product_info add (p_size varchar2(50))

alter table tbl_product_info add(p_size varchar2(50));

alter table tbl_product_info rename column p_viedcnt to p_viewcnt;

commit;


alter table tbl_product_info add foreign key(id) references tbl_user(id);


--�ֹ�����(����)���̺�, �ܷ�Ű: p_info->o_info
create table tbl_order_info(
    ono number(38) primary key,
    pno number(38),
    id varchar2(50),
    position varchar2(50),
    o_category varchar2(50),
    o_title varchar2(100),
    o_name varchar2(50),
    o_brand_name varchar2(50),
    o_img_1 varchar2(255),
    o_amount number(38),
    o_date date default sysdate,
    o_price number(38),
    o_mileage_usage number(38),
    o_mileage_gain number(38),
    o_final_price number(38),
    u_name varchar2(50),
    u_addr1 varchar2(255),
    u_addr2 varchar2(255),
    u_phone varchar2(30)
)

alter table tbl_order_info add (p_size varchar2(50))

alter table tbl_order_info add foreign key(pno) references tbl_product_info(pno);
alter table tbl_order_info add foreign key(id) references tbl_user(id);
alter table tbl_order_info add foreign key(position) references tbl_authority(position);


--��ǰ�������̺�, �ܷ�Ű: p_info->p_review
create table tbl_product_review(
    revno number(38) primary key,
    pno number(38) not null,--pno, id, position �ܷ�Ű
    id varchar2(50) not null,
    position varchar2(50),
    content varchar2(4000),
    regdate date default sysdate,
    updatedate date default sysdate
)

alter table tbl_product_review add foreign key(pno) references tbl_product_info(pno);
alter table tbl_product_review add foreign key(id) references tbl_user(id);
alter table tbl_product_review add foreign key(position) references tbl_authority(position);


--��ٱ������̺�, �ܷ�Ű:p_info->cart
create table tbl_cart(
    cno number(38) primary key,
    pno number(38),--pno, id, position �ܷ�Ű 
    id varchar2(50),
    position varchar2(50)
)

alter table tbl_cart add foreign key(pno) references tbl_product_info(pno);
alter table tbl_cart add foreign key(id) references tbl_user(id);

commit;

alter table tbl_cart drop column position;

select * from tbl_user;

select * from tbl_product_info;

select * from tbl_cart;

��ٱ��ϸ� ���� ���� � �ش��ϴ� ������ �ִ�... �׷���,, ��ٱ��ϸ� ���� �� �ʿ��ѰŴ� � ������ � ��ǰ��ȣ�� ��Ҵ����� �߿���.

�׷��� id��, pno ���� �ʿ���...

�ٵ�.. ��α��Ͽ� ����Ʈ�� � �Ÿ� �����ְ� ������? � ���ǿ�.
���̵� �ʿ��ϳ�

select * from tbl_cart where id = 'admin1'
select * from tbl_cart where id= #{id};

������ �ϱ� ���ؼ��� cno���� �ʿ��ϴ�.........


create table tbl_ads(
    ano number(38) primary key,
    id varchar2(50),
    position varchar2(50),
    a_title varchar2(100),
    a_img_link varchar2(100),
    a_img_name varchar2(255),
    regdate date default sysdate,
    readcnt number(38),
    updatedate date default sysdate,
    register varchar2(32)
)

drop table tbl_ads;

alter table tbl_ads add foreign key(id) references tbl_user(id);

commit;
