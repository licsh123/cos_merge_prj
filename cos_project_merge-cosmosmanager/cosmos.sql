create table product(
product_seq number(20) primary key,
product_title varchar2(500),
product_price number(20),
product_color varchar2(500),
product_img varchar2(500),
product_gender varchar2(500),
product_size varchar2(500),
product_stock number(20),
product_sale number(20),
product_category varchar2(500),
product_content varchar2(3000)
);

drop table product;
create sequence product_seq INCREMENT by 1 start with 0 minvalue 0;
drop sequence product_seq;
insert into product values(product_seq.nextval, '스프라이트 랩 드레스', 150000, 'BLACK', '이미지1', '남자', 'XL', 350, 78, '바지', '통풍 잘되는 바지');
insert into product values(product_seq.nextval, '', 30000, 'BLUE', '이미지2', '여자', 'M', 120, 31, '치마', '면 치마');
insert into product values(product_seq.nextval, '스프라이트 랩 드레스', 150000, 'Blue', '이미지1', '남자', 'XL', 350, 78, '바지', '통풍 잘되는 바지');

insert into product values(product_seq.nextval, '스프라이트 랩 드레스', 150000, 'red', '이미지1', '남자', 'XL', 350, 78, '바지', '통풍 잘되는 바지');

insert into product values(product_seq.nextval, '스프라이트 랩 드레스', 150000, 'yellow', '이미지1', '남자', 'XL', 350, 78, '바지', '통풍 잘되는 바지');

delete from product;
select * from product;
commit;
SELECT * FROM PRODUCT;

        SELECT * FROM product
        ORDER BY product_seq;
        
        SELECT * FROM product WHERE product_seq = 1;
        
        select * from users;
        
        commit;
        
        
create table fileuploadtest(
fileseq number(5) primary key,
filename varchar2(300),
filecontent blob
);



create table test1(
test1_seq number(5) primary key,
test1_name varchar2(300),
test1_price number(10),
test1_style varchar2(300));

drop table test1;
drop table test2;
create table test2(
test1_seq number(5),
test2_size1 varchar2(300),
constraints test1_seq foreign key(test1_seq) references test1(test1_seq));

create sequence test1_seq increment by 1 start with 0 minvalue 0;

select * from test1;
select * from test2;
insert into test1 values(test1_seq.nextval, '상품4', 4000, '상의');
insert into test1 values(test1_seq.nextval, '상품5', 57000, '하의');
insert into test1 values(test1_seq.nextval, '상품6', 63000, '모자');
insert into test1 values(test1_seq.nextval, '상품7', 25000, '신발');
insert into test1 values(test1_seq.nextval, '상품8', 14000, '신발');
insert into test1 values(test1_seq.nextval, '상품9', 28000, '모자');
insert into test1 values(test1_seq.nextval, '상품10', 72000, '상의');
insert into test1 values(test1_seq.nextval, '상품11', 30000, '하의');

insert into test2 values(1, 'black');
insert into test2 values(1, 'blue');
insert into test2 values(1, 'lightblue');
insert into test2 values(1, 'yellow');
insert into test2 values(1, 'pink');
insert into test2 values(1, 'white');
insert into test2 values(1, 'green');

insert into test2 values(2, 'black');
insert into test2 values(2, 'blue');
insert into test2 values(2, 'lightblue');
insert into test2 values(2, 'yellow');
insert into test2 values(2, 'pink');
insert into test2 values(2, 'white');
insert into test2 values(2, 'green');

select * from test2;
select * from test1;

select * from (select t1.test1_name, t1.test1_price, t1.test1_style, t2.test2_size1 from test1 t1, test2 t2) where test1_name='상품1' and test2_size1='black';




-- USER SQL
CREATE USER "test1" IDENTIFIED BY "test1"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER "test1" QUOTA UNLIMITED ON "USERS";

-- ROLES
GRANT "DBA" TO "test1" WITH ADMIN OPTION;

-- SYSTEM PRIVILEGES

        select * from (select p.product_seq, p.product_title, p.product_price, p.product_img, p.product_gender, p.product_size, p.product_saled, p.product_category, p.product_content, c.color1, c.color2, c.color3, c.color4, c.color5, c.color6, c.color7, c.color8, c.color9, c.color10, c.color11, c.color12
        from product p, product_color c where p.product_seq = c.fk_product_seq);
        select * from product_color where fk_product_seq = 1;
        
        select * from product where product_category = '치마';
        select * from product_color;
        update product_color set color1='black' where fk_product_seq = 5;
        commit;
        
        select * from product;
        
        select * from color;
        
create table color(
product_seq number(5),
product_color varchar2(300),
constraints product_seq foreign key(product_seq) references product(product_seq));


insert into color values(4,'black');
insert into color values(4,'pink');
insert into color values(4,'blue');
insert into color values(4,'white');
insert into color values(4,'gray');
insert into color values(4,'green');
insert into color values(5,'yellow');
insert into color values(6,'orange');
insert into color values(6,'purple');
select * from color;
commit;


create table test1(
seq number(5) primary key,
title varchar2(30),
content varchar2(30));

drop table test1;

create table test2(
seq number(5),
color varchar2(50),
constraints seq foreign key(seq) references test1(seq));

insert into test1 values(3,'상품3','상품3');

insert into test2 values(3,'blue');

select * from test1;

select t1.seq,t1.title,t1.content,t2.color from test1 t1, test2 t2 where t1.seq=t2.seq;

select * from test2;

select seq, max(case when color = 'black' then 1 else 0 end) color1 from 
(select t1.seq, t1.title, t1.content, t2.color from test1 t1, test2 t2 where t1.seq=t2.seq) group by seq;

select * from test1 t1,
(select seq,
max(decode(color, 'black', 'black',null)) as black, 
max(decode(color, 'purple', 'purple', null)) as purple,
max(decode(color, 'blue', 'blue', null)) as blue,
max(decode(color, 'white', 'white', null)) as white,
max(decode(color, 'green', 'green', null)) as green,
max(decode(color, 'gray', 'gray', null)) as gray,
max(decode(color, 'yellow', 'yellow', null)) as yellow
from test2 group by seq) t2 where t1.seq = t2.seq;


select t1.seq, min(decode(color, 'black', 'black', null)) as black from ;
select * from product;
select * from color;

select * from (select p.product_title, p.product_price, p.product_gender, p.product_category, p.product_content, c.* from product p,
(select product_seq,
max(decode(product_color, 'black','black',null)) as black,
max(decode(product_color, 'pink','pink',null)) as pink,
max(decode(product_color, 'blue','blue',null)) as blue,
max(decode(product_color, 'white','white',null)) as white,
max(decode(product_color, 'gray','gray',null)) as gray,
max(decode(product_color, 'green','green',null)) as green,
max(decode(product_color, 'yellow','yellow',null)) as yellow,
max(decode(product_color, 'orange','orange',null)) as orange,
max(decode(product_color, 'purple','purple',null)) as purple
from color group by product_seq) c where p.product_seq = c.product_seq) where product_category = '치마';


select * from color where product_seq = 4;


SELECT * FROM COLOR WHERE PRODUCT_SEQ = 4 ;

select p.*,c.product_color from product p, (select product_seq, substr(xmlagg(xmlelement(col,',',product_color)).extract('//text()').getstringval(),2)product_color from color group by product_seq) c where p.product_seq = c.product_seq;
commit;
--select product_seq, group_concat(product_color) from color group by product_seq;


select p.*,c.product_color from product p, (select product_seq, substr(xmlagg(xmlelement(col,',',product_color)).extract('//text()').getstringval(),2)product_color from color group by product_seq) c where p.product_seq = c.product_seq;
commit;

select * from color;

create table optiontest(
product_seq number(5),
product_color varchar2(30),
product_size varchar2(30));

insert into optiontest values(17,'black','95');
insert into optiontest values(18,'white','95');
insert into optiontest values(19,'white','100');
insert into optiontest values(20,'white','105');
insert into optiontest values(20,'pink','95');
insert into optiontest values(20,'yellow','95');
insert into optiontest values(21,'green','95');
insert into optiontest values(22,'black','95');
insert into optiontest values(23,'purple','95');
insert into optiontest values(22,'purple','100');
insert into optiontest values(24,'purple','105');

select * from optiontest  order by product_color desc;
select * from product;
select * from product p, optiontest o where p.product_seq = o.product_seq;

insert into product values(4,'상품2',27000,'이미지2','여성','L',300,120,'치마','예쁜 치마');

select p.*,c.product_color, c.product_size from product p, 
(select 
product_seq, 
substr(xmlagg(xmlelement(col,',',product_color)).extract('//text()').getstringval(),2)product_color, 
substr(xmlagg(xmlelement(col,',',product_size)).extract('//text()').getstringval(),2)product_size 
from optiontest group by product_seq) 
c where p.product_seq = c.product_seq and p.product_category = '치마' and c.product_color like '%pink%' and c.product_size like '%95%';

select * from color;
insert into color values(;

select * from optiontest;

select p.*,c.product_color, c.product_size from product p, 
(select 
product_seq, 
substr(xmlagg(xmlelement(col,',',product_color)).extract('//text()').getstringval(),2)product_color, 
substr(xmlagg(xmlelement(col,',',product_size)).extract('//text()').getstringval(),2)product_size 
from optiontest group by product_seq) 
c where p.product_seq = c.product_seq;

commit;




-- rownum을 적용해서 해당 행만 출력하는 쿼리
select * from
(select ROW_NUMBER() OVER(ORDER BY p.product_seq) RNUM, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, substr(xmlagg(xmlelement(col,',',product_color)).extract('//text()').getstringval(),2)product_color, substr(xmlagg(xmlelement(col,',',product_size)).extract('//text()').getstringval(),2)product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq) where rownum between ((1-1)*10)+1 and (1*10);


select rownum, p.* from product p;


WITH MAIN AS
(
SELECT 'R1' SEQ FROM DUAL UNION ALL
SELECT 'R2' SEQ FROM DUAL UNION ALL
SELECT 'R3' SEQ FROM DUAL UNION ALL
SELECT 'R4' SEQ FROM DUAL UNION ALL
SELECT 'R5' SEQ FROM DUAL UNION ALL
SELECT 'R6' SEQ FROM DUAL UNION ALL
SELECT 'R7' SEQ FROM DUAL UNION ALL
SELECT 'R8' SEQ FROM DUAL UNION ALL
SELECT 'R9' SEQ FROM DUAL UNION ALL
SELECT 'R10' SEQ FROM DUAL 
)
SELECT * FROM 
(SELECT ROW_NUMBER() OVER(ORDER BY SEQ) RNUM, SEQ FROM MAIN) TOTAL
WHERE TOTAL.RNUM >= 1 AND TOTAL.RNUM <= 5;

-- 하나의 페이지에 5개 행만 보여준다면 1page 파라미터는 1,5 2page 파라미터는 6,10




-- 프로덕트 테이블에 rownum 넣어서 조회 - 실패
select * from (select ROW_NUMBER() OVER(ORDER BY p.product_seq) RNUM, p.* from product p) where rownum between ((1-1)*10)+1 and (1*10);



-- product + optiontest 테이블 조인 후 rownum 넣어서 조회 - 성공
select * from
(select ROW_NUMBER() OVER(ORDER BY p.product_seq) RNUM, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq) where rnum between ((1-1)*10)+1 and (1*10) and product_color like '%purple%' order by product_seq;

select * from optiontest;


create table product(
product_seq number(20) primary key,
product_title varchar2(500),
product_content varchar2(3000),
product_price number(20),
product_gender varchar2(500),
product_category varchar2(500),
product_img varchar2(500)
);

create table product_option(
product_option_seq number(5),
constraints product_option_seq foreign key(product_option_seq) references product(product_seq),
product_color varchar2(30),
product_size varchar2(30),
product_stock number(30),
product_saled number(30));

drop table product_option;

select /* +INDEX_DESC(product SYS_C0011407) */ * from product where product_seq > 0 order by product_seq desc;
select * from product_option;

select /* +index_desc(product STS_C0011407)*/* from optiontest order by product_seq;
select /* +index_desc(product STS_C0011407)*/ * from optiontest;
select * from optiontest;
-- 이 두개가 왜 차이가 나는 것일까? -> 2개의 차이점을 줄이기 위해서 ORDER BY를 사용할 수 있고, 힌트를 줄 수도 있다. 

select * from user_indexes;


SELECT * FROM PRODUCT;


select ROW_NUMBER() OVER(ORDER BY p.product_seq) RNUM, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq and rownum between ((3-1)*2)+1 and (3*2) and c.product_color like '%purple%' order by p.product_seq;



select * from (select rownum rnum, p.* from product p where rownum <= 10) where rnum >=1;

select * from (select rownum rnum, p.* from product p where rownum <= (2*10)) where rnum >=((2-1)*10)+1;

-- 실패
select * from
(select rownum rnum, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq and rownum <= (1*10)) where rnum >= ((1-1)*10)+1 and product_category = '상의';

-- 실패 : 1페이지부터여야만 뜬다.
select rownum rnum, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq and rownum between ((1-1)*10)+1 and (1*10);

-- 성공 : where를 안에 넣자
select * from (select rownum rnum, p.* ,c.product_color, c.product_size as product_size2 from product p, 
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq and p.product_category='상의') where rnum between 1 and 3;


-- max rownum을 뽑고싶어
select max(rownum) from product p,
(select product_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from optiontest group by product_seq) c 
where p.product_seq = c.product_seq and p.product_category='상의';

select * from product;
select * from product_option;



drop table product;
drop table product_option;
drop sequence product_seq;

create sequence product_seq increment by 1 start with 0 minvalue 0;



create table product(
product_seq number(20) primary key,
product_title varchar2(500),
product_content varchar2(3000),
product_price number(20),
product_gender varchar2(500),
product_category varchar2(500),
product_img varchar2(500)
);




create table product_option(
product_option_seq number(5),
constraints product_option_seq foreign key(product_option_seq) references product(product_seq),
product_color varchar2(30),
product_size varchar2(30),
product_stock number(30),
product_saled number(30));




insert into product values(product_seq.nextval, '상품1', '상품1내용', 25000, 'M', '바지', 'IMAGE01');
insert into product values(product_seq.nextval, '상품2', '상품2내용', 25000, 'W', '모자', 'IMAGE02');
insert into product values(product_seq.nextval, '상품3', '상품3내용', 25000, 'M', '바지', 'IMAGE03');
insert into product values(product_seq.nextval, '상품4', '상품4내용', 25000, 'W', '치마', 'IMAGE04');
insert into product values(product_seq.nextval, '상품5', '상품5내용', 25000, 'W', '원피스', 'IMAGE05');
insert into product values(product_seq.nextval, '상품6', '상품6내용', 25000, 'W', '원피스', 'IMAGE06');
insert into product values(product_seq.nextval, '상품7', '상품7내용', 25000, 'W', '원피스', 'IMAGE07');
insert into product values(product_seq.nextval, '상품8', '상품8내용', 25000, 'W', '치마', 'IMAGE08');
insert into product values(product_seq.nextval, '상품9', '상품9내용', 25000, 'M', '모자', 'IMAGE09');
insert into product values(product_seq.nextval, '상품10', '상품10내용', 25000, 'W', '치마', 'IMAGE10');
insert into product values(product_seq.nextval, '상품11', '상품11내용', 25000, 'W', '치마', 'IMAGE11');
insert into product values(product_seq.nextval, '상품12', '상품12내용', 25000, 'W', '치마', 'IMAGE12');
insert into product values(product_seq.nextval, '상품13', '상품13내용', 25000, 'W', '원피스', 'IMAGE13');
insert into product values(product_seq.nextval, '상품14', '상품14내용', 25000, 'W', '치마', 'IMAGE14');
insert into product values(product_seq.nextval, '상품15', '상품15내용', 25000, 'W', '원피스', 'IMAGE15');
insert into product values(product_seq.nextval, '상품16', '상품16내용', 25000, 'M', '모자', 'IMAGE16');
insert into product values(product_seq.nextval, '상품17', '상품17내용', 25000, 'W', '치마', 'IMAGE17');
insert into product values(product_seq.nextval, '상품18', '상품18내용', 25000, 'M', '모자', 'IMAGE18');
insert into product values(product_seq.nextval, '상품19', '상품19내용', 25000, 'W', '치마', 'IMAGE19');
insert into product values(product_seq.nextval, '상품20', '상품20내용', 25000, 'W', '모자', 'IMAGE20');
insert into product values(product_seq.nextval, '상품21', '상품21내용', 25000, 'W', '치마', 'IMAGE21');
insert into product values(product_seq.nextval, '상품22', '상품22내용', 25000, 'W', '치마', 'IMAGE22');
insert into product values(product_seq.nextval, '레귤러 핏 셔츠', '옷장 속에 클래식함을 더하는 일상적인 디자인의 셔츠입니다. 지속 가능한 방식으로 제작된 텐셀™ 라이오셀과 코튼 혼방 소재로 만들어졌으며, 시즌이 지나서도 변함없이 함께하기 좋은 감각적인 아이템입니다. - 레귤러 핏 - 클래식 칼라 - 앞면 버튼업 디자인 - 커프스 타입의 긴소매 - 가슴 부분의 패치 포켓', 27000, 'M', '티셔츠', '티셔츠사진');
insert into product values(product_seq.nextval, '루즈 핏 바지', '옷장 속에 있는 티셔츠를 되살릴 혁신적인 바지', 31000, 'M', '바지', '바지사진');
insert into product values(product_seq.nextval, '티셔츠', '티셔츠', 26000, 'M', '티셔츠', 'IMAGE티셔츠');
insert into product values(product_seq.nextval, '악세사리이름1', '설명1', 26000, 'W', '악세사리', '이미지');
insert into product values(product_seq.nextval, '악세사리이름2', '설명2', 27000, 'M', '악세사리', '이미지');
insert into product values(product_seq.nextval, '악세사리이름3', '설명3', 28000, 'W', '악세사리', '이미지');
insert into product values(product_seq.nextval, '악세사리이름4', '설명4', 20000, 'M', '악세사리', '이미지');
insert into product values(product_seq.nextval, '아동복1', '설명1', 20000, 'KIDS', '모자', '이미지');
insert into product values(product_seq.nextval, '아동복2', '설명2', 25000, 'KIDS', '티셔츠', '이미지');
insert into product values(product_seq.nextval, '아동복3', '설명3', 15000, 'KIDS', '티셔츠', '이미지');
insert into product values(product_seq.nextval, '아동복4', '설명4', 29000, 'KIDS', '바지', '이미지');
insert into product values(product_seq.nextval, '아동복5', '설명5', 30000, 'KIDS', '모자', '이미지');
insert into product values(product_seq.nextval, '아동복6', '설명6', 27000, 'KIDS', '티셔츠', '이미지');
insert into product values(product_seq.nextval, '아동복7', '설명7', 21000, 'KIDS', '원피스', '이미지');
insert into product values(product_seq.nextval, '아동복8', '설명8', 15000, 'KIDS', '원피스', '이미지');
insert into product values(product_seq.nextval, '아동용품1', '설명1', 21000, 'KIDS', '악세사리', '이미지');
insert into product values(product_seq.nextval, '아동용품2', '설명2', 30000, 'KIDS', '악세사리', '이미지');
insert into product values(product_seq.nextval, '아동용품3', '설명3', 87000, 'KIDS', '악세사리', '이미지');
insert into product values(product_seq.nextval, '아동용품4', '설명4', 10000, 'KIDS', '악세사리', '이미지');
insert into product values(product_seq.nextval, '아동용품5', '설명5', 8000, 'KIDS', '악세사리', '이미지');
insert into product values(product_seq.nextval, '아동용품6', '설명6', 20000, 'KIDS', '악세사리', '이미지');


insert into product_option values(1, 'BLACK', 'M', 250, 250);
insert into product_option values(1, 'WHITE', 'XL', 250, 250);
insert into product_option values(1, 'RED', 'L', 250, 250);
insert into product_option values(2, 'YELLOW', 'S', 250, 250);
insert into product_option values(2, 'GREEN', 'M', 250, 250);
insert into product_option values(2, 'BLACK', 'M', 250, 250);
insert into product_option values(2, 'WHITE', 'XL', 250, 250);
insert into product_option values(2, 'RED', 'L', 250, 250);
insert into product_option values(3, 'YELLOW', 'S', 250, 250);
insert into product_option values(3, 'GREEN', 'M', 250, 250);
insert into product_option values(3, 'BLACK', 'M', 250, 250);
insert into product_option values(3, 'WHITE', 'XL', 250, 250);
insert into product_option values(4, 'RED', 'L', 250, 250);
insert into product_option values(4, 'YELLOW', 'S', 250, 250);
insert into product_option values(4, 'GREEN', 'M', 250, 250);
insert into product_option values(4, 'BLACK', 'M', 250, 250);
insert into product_option values(5, 'WHITE', 'XL', 250, 250);
insert into product_option values(5, 'RED', 'L', 250, 250);
insert into product_option values(6, 'YELLOW', 'S', 250, 250);
insert into product_option values(6, 'GREEN', 'M', 250, 250);
insert into product_option values(7, 'BLACK', 'M', 250, 250);
insert into product_option values(8, 'WHITE', 'XL', 250, 250);
insert into product_option values(9, 'RED', 'L', 250, 250);
insert into product_option values(10, 'YELLOW', 'S', 250, 250);
insert into product_option values(11, 'GREEN', 'M', 250, 250);
insert into product_option values(12, 'BLACK', 'M', 250, 250);
insert into product_option values(12, 'WHITE', 'XL', 250, 250);
insert into product_option values(12, 'RED', 'L', 250, 250);
insert into product_option values(13, 'YELLOW', 'S', 250, 250);
insert into product_option values(13, 'GREEN', 'M', 250, 250);
insert into product_option values(13, 'BLACK', 'M', 250, 250);
insert into product_option values(14, 'WHITE', 'XL', 250, 250);
insert into product_option values(14, 'RED', 'L', 250, 250);
insert into product_option values(14, 'YELLOW', 'S', 250, 250);
insert into product_option values(15, 'GREEN', 'M', 250, 250);
insert into product_option values(15, 'BLACK', 'M', 250, 250);
insert into product_option values(16, 'WHITE', 'XL', 250, 250);
insert into product_option values(16, 'RED', 'L', 250, 250);
insert into product_option values(16, 'YELLOW', 'S', 250, 250);
insert into product_option values(16, 'GREEN', 'M', 250, 250);
insert into product_option values(16, 'BLACK', 'M', 250, 250);
insert into product_option values(17, 'WHITE', 'XL', 250, 250);
insert into product_option values(18, 'RED', 'L', 250, 250);
insert into product_option values(19, 'YELLOW', 'S', 250, 250);
insert into product_option values(19, 'GREEN', 'M', 250, 250);
insert into product_option values(19, 'BLACK', 'M', 250, 250);
insert into product_option values(20, 'WHITE', 'XL', 250, 250);
insert into product_option values(21, 'RED', 'L', 250, 250);
insert into product_option values(22, 'YELLOW', 'S', 250, 250);
insert into product_option values(22, 'GREEN', 'M', 250, 250);
insert into product_option values(22, 'BLACK', 'M', 250, 250);
insert into product_option values(23, 'WHITE', 'XL', 250, 250);
insert into product_option values(23, 'RED', 'L', 250, 250);
insert into product_option values(23, 'YELLOW', 'S', 250, 250);
insert into product_option values(24, 'GREEN', 'M', 250, 250);
insert into product_option values(24, 'BLACK', 'L', 250, 220);
insert into product_option values(24, 'YELLOW', 'M', 250, 200);
insert into product_option values(24, 'PINK', 'XS', 250, 220);
insert into product_option values(24, 'ORANGE', 'XS', 250, 200);

insert into product_option values(25, 'BLACK', 'L', 250, 150);
insert into product_option values(25, 'YELLOW', 'M', 250, 120);
insert into product_option values(25, 'PINK', 'XS', 250, 210);
insert into product_option values(25, 'ORANGE', 'XS', 250, 240);

insert into product_option values(26, 'BLACK', 'L', 250, 150);
insert into product_option values(26, 'BLACK', 'M', 250, 120);
insert into product_option values(26, 'BLACK', 'XS', 250, 210);
insert into product_option values(26, 'BLACK', 'XL', 250, 240);
insert into product_option values(26, 'YELLOW', 'L', 250, 150);
insert into product_option values(26, 'YELLOW', 'M', 250, 120);
insert into product_option values(26, 'YELLOW', 'XS', 250, 210);
insert into product_option values(26, 'YELLOW', 'XL', 250, 240);
insert into product_option values(26, 'RED', 'L', 250, 150);
insert into product_option values(26, 'RED', 'M', 250, 120);
insert into product_option values(26, 'RED', 'XS', 250, 210);
insert into product_option values(26, 'RED', 'XL', 250, 240);

insert into product_option values(27, 'BLACK', 'L', 250, 150);
insert into product_option values(27, 'BLACK', 'M', 250, 120);
insert into product_option values(27, 'BLACK', 'XS', 250, 210);
insert into product_option values(27, 'BLACK', 'XL', 250, 240);
insert into product_option values(27, 'YELLOW', 'L', 250, 150);
insert into product_option values(27, 'YELLOW', 'M', 250, 120);
insert into product_option values(27, 'YELLOW', 'XS', 250, 210);
insert into product_option values(27, 'YELLOW', 'XL', 250, 240);
insert into product_option values(27, 'RED', 'L', 250, 150);
insert into product_option values(27, 'RED', 'M', 250, 120);
insert into product_option values(27, 'RED', 'XS', 250, 210);
insert into product_option values(27, 'RED', 'XL', 250, 240);

insert into product_option values(28, 'BLACK', 'L', 250, 150);
insert into product_option values(28, 'BLACK', 'M', 250, 120);
insert into product_option values(28, 'BLACK', 'XS', 250, 210);
insert into product_option values(28, 'RED', 'L', 250, 150);
insert into product_option values(28, 'RED', 'M', 250, 120);
insert into product_option values(28, 'RED', 'XL', 250, 240);

insert into product_option values(29, 'YELLOW', 'L', 250, 150);
insert into product_option values(29, 'YELLOW', 'M', 250, 120);
insert into product_option values(29, 'YELLOW', 'XS', 250, 210);
insert into product_option values(29, 'YELLOW', 'XL', 250, 240);
insert into product_option values(29, 'RED', 'L', 250, 150);
insert into product_option values(29, 'RED', 'M', 250, 120);
insert into product_option values(29, 'RED', 'XS', 250, 210);
insert into product_option values(29, 'RED', 'XL', 250, 240);

insert into product_option values(30, 'BLACK', 'L', 250, 150);
insert into product_option values(30, 'BLACK', 'M', 250, 120);
insert into product_option values(30, 'BLACK', 'XS', 250, 210);
insert into product_option values(30, 'BLACK', 'XL', 250, 240);
insert into product_option values(30, 'YELLOW', 'L', 250, 150);
insert into product_option values(30, 'YELLOW', 'M', 250, 120);
insert into product_option values(30, 'YELLOW', 'XS', 250, 210);
insert into product_option values(30, 'YELLOW', 'XL', 250, 240);
insert into product_option values(30, 'RED', 'L', 250, 150);
insert into product_option values(30, 'RED', 'M', 250, 120);
insert into product_option values(30, 'RED', 'XS', 250, 210);
insert into product_option values(30, 'RED', 'XL', 250, 240);

insert into product_option values(31, 'DARKRED', 'XS', 250, 240);
insert into product_option values(31, 'INDIANRED', 'L', 250, 240);
insert into product_option values(32, 'LIGHTYELLOW', 'L', 250, 240);
insert into product_option values(32, 'DARKRED', 'S', 250, 240);
insert into product_option values(33, 'LIMEGREEN', 'XL', 250, 240);
insert into product_option values(33, 'RED', 'L', 250, 240);
insert into product_option values(33, 'INDIANRED', 'XL', 250, 240);
insert into product_option values(34, 'RED', 'L', 250, 240);
insert into product_option values(34, 'LIGHTYELLOW', 'XL', 250, 240);
insert into product_option values(34, 'DARKRED', 'L', 250, 240);
insert into product_option values(34, 'RED', 'XL', 250, 240);
insert into product_option values(35, 'LIGHTYELLOW', 'XL', 250, 240);
insert into product_option values(36, 'DARKRED', 'XS', 250, 240);
insert into product_option values(36, 'RED', 'XL', 250, 240);
insert into product_option values(37, 'GREENYELLOW', 'XL', 250, 240);
insert into product_option values(37, 'INDIANRED', 'XS', 250, 240);
insert into product_option values(38, 'DARKRED', 'S', 250, 240);
insert into product_option values(38, 'YELLOW', 'M', 250, 240);
insert into product_option values(39, 'INDIANRED', 'M', 250, 240);
insert into product_option values(39, 'DARKRED', 'XL', 250, 240);
insert into product_option values(40, 'LAWNGREEN', 'XL', 250, 240);
insert into product_option values(40, 'RED', 'XL', 250, 240);
insert into product_option values(41, 'YELLOW', 'M', 250, 240);
insert into product_option values(41, 'INDIANRED', 'M', 250, 240);
insert into product_option values(41, 'RED', 'XL', 250, 240);
insert into product_option values(42, 'LAWNGREEN', 'M', 250, 240);
insert into product_option values(42, 'LAWNGREEN', 'L', 250, 240);
insert into product_option values(43, 'LIMEGREEN', 'XS', 250, 240);
insert into product_option values(44, 'GREENYELLOW', 'L', 250, 240);
insert into product_option values(44, 'LAWNGREEN', 'S', 250, 240);


DELETE FROM PRODUCT_OPTION WHERE product_option_seq BETWEEN 31 AND 44;






select * from product order by product_seq desc;
select * from product_option;


select rownum rnum, p.* ,o.product_color, o.product_size, o.product_saled from product p, 
(select product_option_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size, sum(product_saled) product_saled from product_option group by product_option_seq) o 
where p.product_seq = o.product_option_seq and p.product_category != '악세사리';

select 
    product_option_seq, 
    wm_concat(product_color) product_color, 
    wm_concat(product_size) product_size, 
    sum(product_saled) product_saled 
    from product_option 
    group by product_option_seq;



COMMIT;

select product_img from (select rownum rnum, p.* from product p where p.product_gender =#{product_gender}) where rnum between #{product_~} and #{~~};


drop table product;
drop table product_option;
drop table product1;
drop table product_option1;
drop sequence product_seq;

create sequence product_seq increment by 1 start with 0 minvalue 0;



-- 20210604 테이블 수정 --

-- 테이블 리빌딩
create table product(
product_seq number(20) primary key,
product_id number(20) not null,
product_title varchar2(500) not null,
product_content varchar2(3000) not null,
product_price number(20) not null,
product_gender varchar2(500) not null,
product_category varchar2(500) not null,
product_img varchar2(500) not null,
product_color varchar2(30) not null,
product_size varchar2(30) not null,
product_material varchar2(30) not null,
product_date date default sysdate
);



create table product_option(
product_option_seq number(5),
constraints product_option_seq foreign key(product_option_seq) references product(product_seq),
product_option_id number(5) not null,
product_stock number(30) not null,
product_saled number(30) default 0
);


insert into product values(1, 1, '아동상품1', '상품1', 20000, 'KIDS', '악세사리', '이미지', 'BLACK', 'XL', '면', sysdate);
insert into product values(2, 1, '아동상품1', '상품1', 20000, 'KIDS', '악세사리', '이미지', 'BLACK', 'L', '면', sysdate);
insert into product values(3, 1, '아동상품1', '상품1', 20000, 'KIDS', '악세사리', '이미지', 'WHITE', 'XS', '면', sysdate);
insert into product values(4, 1, '아동상품1', '상품1', 20000, 'KIDS', '악세사리', '이미지', 'WHITE', 'M', '면', sysdate);
insert into product values(5, 2, '남자상품1', '상품1', 20000, 'M', '악세사리', '이미지', 'BLACK', 'XL', '우레탄', sysdate);
insert into product values(6, 2, '남자상품1', '상품1', 20000, 'M', '악세사리', '이미지', 'BLACK', 'L', '우레탄', sysdate);
insert into product values(7, 2, '남자상품1', '상품1', 20000, 'M', '악세사리', '이미지', 'WHITE', 'XS', '우레탄', sysdate);
insert into product values(8, 3, '여자상품1', '상품1', 20000, 'W', '악세사리', '이미지', 'WHITE', 'M', '나일론', sysdate);
insert into product values(9, 3, '여자상품1', '상품1', 20000, 'W', '악세사리', '이미지', 'BLACK', 'XL', '나일론', sysdate);
insert into product values(10, 4, '아동상품2', '상품1', 20000, 'KIDS', '바지', '이미지', 'BLACK', 'L', '나일론', sysdate);
insert into product values(11, 4, '아동상품2', '상품1', 20000, 'KIDS', '바지', '이미지', 'WHITE', 'XS', '나일론', sysdate);
insert into product values(12, 4, '아동상품2', '상품1', 20000, 'KIDS', '바지', '이미지', 'WHITE', 'M', '나일론', sysdate);
insert into product values(13, 5, '여자상품2', '상품1', 20000, 'W', '치마', '이미지', 'BLACK', 'XL', '스판', sysdate);
insert into product values(14, 5, '여자상품2', '상품1', 20000, 'W', '치마', '이미지', 'BLACK', 'L', '스판', sysdate);
insert into product values(15, 5, '여자상품2', '상품1', 20000, 'W', '치마', '이미지', 'WHITE', 'XS', '스판', sysdate);
insert into product values(16, 6, '남자상품2', '상품1', 20000, 'M', '바지', '이미지', 'WHITE', 'M', '모직', sysdate);
insert into product values(17, 6, '남자상품2', '상품1', 20000, 'M', '바지', '이미지', 'BLACK', 'XL', '모직', sysdate);
insert into product values(18, 6, '남자상품2', '상품1', 20000, 'M', '바지', '이미지', 'BLACK', 'L', '모직', sysdate);
insert into product values(19, 6, '남자상품2', '상품1', 20000, 'M', '바지', '이미지', 'WHITE', 'XS', '모직', sysdate);
insert into product values(20, 7, '남자상품3', '상품1', 20000, 'M', '모자', '이미지', 'WHITE', 'M', '모직', sysdate);
insert into product values(21, 7, '남자상품3', '상품1', 20000, 'M', '모자', '이미지', 'BLACK', 'XL', '모직', sysdate);
insert into product values(22, 8, '여자상품3', '상품1', 20000, 'W', '모자', '이미지', 'BLACK', 'L', '면', sysdate);
insert into product values(23, 8, '여자상품3', '상품1', 20000, 'W', '모자', '이미지', 'WHITE', 'XS', '면', sysdate);
insert into product values(24, 8, '여자상품3', '상품1', 20000, 'W', '모자', '이미지', 'WHITE', 'M', '면', sysdate);
insert into product values(25, 8, '여자상품3', '상품1', 20000, 'W', '모자', '이미지', 'BLACK', 'XL', '면', sysdate);
insert into product values(26, 9, '아동상품3', '상품1', 20000, 'KIDS', '모자', '이미지', 'BLACK', 'L', '면', sysdate);
insert into product values(27, 9, '아동상품3', '상품1', 20000, 'KIDS', '모자', '이미지', 'WHITE', 'XS', '면', sysdate);
insert into product values(28, 10, '여자상품4', '상품1', 20000, 'W', '원피스', '이미지', 'WHITE', 'M', '우레탄', sysdate);
insert into product values(29, 11, '여자상품5', '상품1', 20000, 'W', '모자', '이미지', 'WHITE', 'XS', '우레탄', sysdate);
insert into product values(30, 12, '남자상품4', '상품1', 20000, 'M', '원피스', '이미지', 'WHITE', 'M', '우레탄', sysdate);
insert into product values(31, 13, '아동상품1', '상품1', 20000, 'KIDS', '악세사리', '이미지', 'RED', 'XL', '면', sysdate);
insert into product values(32, 13, '아동상품1', '상품1', 20000, 'KIDS', '악세사리', '이미지', 'GREEN', 'L', '면', sysdate);
insert into product values(33, 14, '아동상품1', '상품1', 20000, 'KIDS', '악세사리', '이미지', 'PINK', 'XS', '면', sysdate);
insert into product values(34, 14, '아동상품1', '상품1', 20000, 'KIDS', '악세사리', '이미지', 'WHITE', 'M', '면', sysdate);
insert into product values(35, 15, '남자상품1', '상품1', 20000, 'M', '악세사리', '이미지', 'YELLOW', 'XL', '우레탄', sysdate);
insert into product values(36, 15, '남자상품1', '상품1', 20000, 'M', '악세사리', '이미지', 'BLACK', 'L', '우레탄', sysdate);
insert into product values(37, 16, '남자상품1', '상품1', 20000, 'M', '악세사리', '이미지', 'ORANGE', 'XS', '우레탄', sysdate);
insert into product values(38, 16, '여자상품1', '상품1', 20000, 'W', '악세사리', '이미지', 'WHITE', 'M', '나일론', sysdate);
insert into product values(39, 16, '여자상품1', '상품1', 20000, 'W', '악세사리', '이미지', 'GREEN', 'XL', '나일론', sysdate);
insert into product values(40, 16, '아동상품2', '상품1', 20000, 'KIDS', '바지', '이미지', 'YELLOW', 'L', '나일론', sysdate);
insert into product values(41, 17, '아동상품2', '상품1', 20000, 'KIDS', '바지', '이미지', 'PURPLE', 'XS', '나일론', sysdate);
insert into product values(42, 17, '아동상품2', '상품1', 20000, 'KIDS', '바지', '이미지', 'RED', 'M', '나일론', sysdate);
insert into product values(43, 17, '여자상품2', '상품1', 20000, 'W', '치마', '이미지', 'RED', 'XL', '스판', sysdate);
insert into product values(44, 17, '여자상품2', '상품1', 20000, 'W', '치마', '이미지', 'PURPLE', 'L', '스판', sysdate);
insert into product values(45, 18, '여자상품2', '상품1', 20000, 'W', '치마', '이미지', 'YELLOW', 'XS', '스판', sysdate);
insert into product values(46, 18, '남자상품2', '상품1', 20000, 'M', '바지', '이미지', 'PURPLE', 'M', '모직', sysdate);
insert into product values(47, 19, '남자상품2', '상품1', 20000, 'M', '바지', '이미지', 'BLACK', 'XL', '모직', sysdate);
insert into product values(48, 19, '남자상품2', '상품1', 20000, 'M', '바지', '이미지', 'RED', 'L', '모직', sysdate);
insert into product values(49, 19, '남자상품2', '상품1', 20000, 'M', '바지', '이미지', 'YELLOW', 'XS', '모직', sysdate);
insert into product values(50, 20, '남자상품3', '상품1', 20000, 'M', '모자', '이미지', 'PURPLE', 'M', '모직', sysdate);
insert into product values(51, 20, '남자상품3', '상품1', 20000, 'M', '모자', '이미지', 'GREEN', 'XL', '모직', sysdate);
insert into product values(52, 20, '여자상품3', '상품1', 20000, 'W', '모자', '이미지', 'PURPLE', 'L', '면', sysdate);
insert into product values(53, 21, '여자상품3', '상품1', 20000, 'W', '모자', '이미지', 'RED', 'XS', '면', sysdate);
insert into product values(54, 22, '여자상품3', '상품1', 20000, 'W', '모자', '이미지', 'WHITE', 'M', '면', sysdate);
insert into product values(55, 23, '여자상품3', '상품1', 20000, 'W', '모자', '이미지', 'GREEN', 'XL', '면', sysdate);
insert into product values(56, 24, '아동상품3', '상품1', 20000, 'KIDS', '모자', '이미지', 'PURPLE', 'L', '면', sysdate);
insert into product values(57, 24, '아동상품3', '상품1', 20000, 'KIDS', '모자', '이미지', 'RED', 'XS', '면', sysdate);
insert into product values(58, 25, '여자상품4', '상품1', 20000, 'W', '원피스', '이미지', 'WHITE', 'M', '우레탄', sysdate);
insert into product values(59, 25, '여자상품5', '상품1', 20000, 'W', '모자', '이미지', 'GREEN', 'XS', '우레탄', sysdate);
insert into product values(60, 26, '남자상품4', '상품1', 20000, 'M', '원피스', '이미지', 'RED', 'M', '우레탄', sysdate);
insert into product values(61, 27, '남자상품9', '상품2', 25000, 'M', '바지', '이미지1,이미지2', 'BLACK', 'M', '우레탄');
insert into product values(62, 27, '남자상품9', '상품2', 25000, 'M', '바지', '이미지1,이미지2', 'RED', 'L', '우레탄');
insert into product values(63, 27, '남자상품9', '상품2', 25000, 'M', '바지', '이미지1,이미지2', 'YELLOW', 'XL', '우레탄');
delete from product where product_seq = 63;
select * from product;

insert into product_option values(1, 1, 250, 200);
insert into product_option values(2, 1, 230, 100);
insert into product_option values(3, 1, 210, 500);
insert into product_option values(4, 1, 240, 700);
insert into product_option values(5, 2, 250, 200);
insert into product_option values(6, 2, 230, 100);
insert into product_option values(7, 2, 210, 500);
insert into product_option values(8, 3, 240, 700);
insert into product_option values(9, 3, 250, 200);
insert into product_option values(10, 4, 230, 100);
insert into product_option values(11, 4, 210, 500);
insert into product_option values(12, 4, 240, 700);
insert into product_option values(13, 5, 250, 200);
insert into product_option values(14, 5, 230, 100);
insert into product_option values(15, 5, 210, 500);
insert into product_option values(16, 6, 240, 700);
insert into product_option values(17, 6, 250, 200);
insert into product_option values(18, 6, 230, 100);
insert into product_option values(19, 6, 210, 500);
insert into product_option values(20, 7, 240, 700);
insert into product_option values(21, 7, 250, 200);
insert into product_option values(22, 8, 230, 100);
insert into product_option values(23, 8, 210, 500);
insert into product_option values(24, 8, 240, 700);
insert into product_option values(25, 8, 250, 200);
insert into product_option values(26, 9, 230, 100);
insert into product_option values(27, 9, 210, 500);
insert into product_option values(28, 10, 240, 700);
insert into product_option values(29, 11, 240, 700);
insert into product_option values(30, 12, 240, 700);
insert into product_option values(31, 13, 250, 200);
insert into product_option values(32, 13, 230, 100);
insert into product_option values(33, 14, 210, 500);
insert into product_option values(34, 14, 240, 700);
insert into product_option values(35, 15, 250, 200);
insert into product_option values(36, 15, 230, 100);
insert into product_option values(37, 16, 210, 500);
insert into product_option values(38, 16, 240, 700);
insert into product_option values(39, 16, 250, 200);
insert into product_option values(40, 16, 230, 100);
insert into product_option values(41, 17, 210, 500);
insert into product_option values(42, 17, 240, 700);
insert into product_option values(43, 17, 250, 200);
insert into product_option values(44, 17, 230, 100);
insert into product_option values(45, 18, 210, 500);
insert into product_option values(46, 18, 240, 700);
insert into product_option values(47, 19, 250, 200);
insert into product_option values(48, 19, 230, 100);
insert into product_option values(49, 19, 210, 500);
insert into product_option values(50, 20, 240, 700);
insert into product_option values(51, 20, 250, 200);
insert into product_option values(52, 20, 230, 100);
insert into product_option values(53, 21, 210, 500);
insert into product_option values(54, 22, 240, 700);
insert into product_option values(55, 23, 250, 200);
insert into product_option values(56, 24, 230, 100);
insert into product_option values(57, 24, 210, 500);
insert into product_option values(58, 25, 240, 700);
insert into product_option values(59, 25, 240, 700);
insert into product_option values(60, 26, 240, 700);
insert into product_option values(61, 27, 240, 150);
insert into product_option values(62, 27, 240, 660);
insert into product_option values(63, 27, 240, 100);












COMMIT;







select p.product_id, p.product_title, p.product_content, p.product_price, p.product_gender, p.product_category, p.product_img, p.product_color, p.product_size, o.product_stock, o.product_saled from product1 p, product_option1 o where p.product_seq = o.product_option1_seq;


select * from product1 p, product_option1 o where p.product_seq = o.product_option1_seq;

select * from product1;

select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img;

select max(rnum) from (select rownum rnum, t.* from (select p.product_title, product_content, product_price, product_gender, product_category, product_img, product_color, product_size, sum(o.product_saled) product_saled from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p, product_option1 o group by product_title, product_content, product_price, product_gender, product_category, product_img, product_color, product_size) t where product_size like '%L%');

commit;

select rownum rnum, p.* ,o.product_color, o.product_size, o.product_saled from product p,
(select product_option_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size, sum(product_saled) product_saled from product_option group by product_option_seq) o
 where p.product_seq = o.product_option_seq;
 
 
 
select max(rownum) 
from product p, 
(select product_option_seq, wm_concat(product_color) product_color, wm_concat(product_size) product_size from product_option group by product_option_seq) o 
where p.product_seq = o.product_option_seq;

select * from product;
select * from product_option;



select *
from 
(select rownum rnum, t.* 
from 
(select product_title, product_content, product_price, product_gender, product_category, product_img, product_color, product_size, sum(o.product_saled) product_saled 
from 
(select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size 
from product1 
group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p, product_option1 o 
group by product_title, product_content, product_price, product_gender, product_category, product_img, product_color, product_size) t 
where product_size like '%L%');








commit;


-- 조건에 맞는 상품 리스트 출력 쿼리문
select * from (select rownum rnum, p.* from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size 
from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p where product_category = '치마') where rnum between 1 and 20;

-- 조건에 맞는 상품 페이지 출력 쿼리문
select max(rownum) from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size 
from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p;

select max(rownum) from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size
from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p where product_color like '%BLACK%';


select * from (select rownum rnum, p.* from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size 
from product1 group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p where product_gender = 'W') where rnum between 1 and 20;




select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size from product;
select * from product;

select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size 
from product group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img;


































-- 20210606 유저테이블 제작


-- 고객
CREATE TABLE cos_user (
    user_seq number(20) primary key, -- 기본키
    user_email VARCHAR2(200) not null, -- 이메일,
    user_password VARCHAR2(200) NOT NULL, -- 비밀번호,
    user_name VARCHAR2(200) NOT NULL, -- 이름,
    user_birthday VARCHAR2(200) NOT NULL, -- 생년월일,
    user_phone VARCHAR2(200) NOT NULL, -- 핸드폰,
    user_regdate date default sysdate, -- 가입일자
    user_role varchar2(200) -- 고객권한
);


-- 고객 주소
CREATE TABLE tbl_address (
    user_seq number(20),
    constraints user_seq foreign key(user_seq) references tbl_user(user_seq),
    user_email VARCHAR2(100) not null, -- 이메일
    address_name varchar2(100) not null,
    postcode NUMERIC NULL, -- 우편번호,
    address VARCHAR2(200) NULL, -- 주소,
    detailAddress VARCHAR2(200) NULL -- 상세주소
);

select * from cos_user;

select * from cos_address;

drop table cos_user;
drop table cos_address;

insert into tbl_user values(1, 'suovj140@gmail.com', 'rnwlgns2', '구지훈', '1993-06-15', '010-4474-9986','M',sysdate, 'costomer', null, null, null);
insert into tbl_user values(2, 'test1@gmail.com', 'test1', 'test1', '1966-04-85', '010-4357-7979','W',sysdate, 'costomer', null, null, null);

insert into tbl_address values(1, 'suovj140@gmail.com', '내집', 95554, '서울특별시 영등포구 당산동 121-289', '가온빌 701호');
insert into tbl_address values(1, 'suovj140@gmail.com', '본가', 95554, '서울특별시 마포구 이대', '학원 301호');
insert into tbl_address values(1, 'suovj140@gmail.com', '자취방', 95554, '서울특별시 서초구 고터', '고터 1층');
insert into tbl_address values(1, 'suovj140@gmail.com', '친구집', 95554, '서울특별시 어딘가 여기', '아파트 44층');


insert into tbl_address values(2, 'test1@gmail.com', '어딘가1', 54354, '이세상 어딘가 1', '여긴어디니');
insert into tbl_address values(2, 'test1@gmail.com', '어딘가2', 46748, '이세상은 맞냐', '어딘지몰라');


commit;



select * from cos_address where user_email = 'suovj140@gmail.com';



update cos_user set user_email = '변경할값' where user_email = '넘어온값'

vo에 change_email, change_phone, change_password 필요함;






select * from cos_user;
select * from cos_address;

update cos_user set user_email = 'test2@gmail.com' where user_email = 'suovj140@gmail.com';
update cos_user set user_email = 'suovj140@gmail.com' where user_email = 'test2@gmail.com';

commit;



SELECT P.PRODUCT_ID, P.PRODUCT_TITLE, P.PRODUCT_PRICE, P.PRODUCT_GENDER, P.PRODUCT_CATEGORY, P.PRODUCT_IMG, 
    SUBSTR(XMLAGG(XMLELEMENT(COL,',',P.PRODUCT_COLOR)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_COLOR, 
    SUBSTR(XMLAGG(XMLELEMENT(COL,',',P.PRODUCT_SIZE)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SIZE,
    SUBSTR(XMLAGG(XMLELEMENT(COL,',',PO.PRODUCT_STOCK)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_STOCK,
    SUBSTR(XMLAGG(XMLELEMENT(COL,',',PO.PRODUCT_SALED)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SALED 
    FROM PRODUCT P, PRODUCT_OPTION PO 
    WHERE P.PRODUCT_ID=PO.PRODUCT_OPTION_ID 
    GROUP BY P.PRODUCT_ID,PO.PRODUCT_OPTION_ID, P.PRODUCT_TITLE, P.PRODUCT_PRICE, P.PRODUCT_GENDER, P.PRODUCT_CATEGORY, P.PRODUCT_IMG,PO.PRODUCT_OPTION_ID
   ;
   
select * from (select product_id, product_title, product_price, product_gender, product_category, product_img,
SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_COLOR)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_COLOR, 
SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_SIZE)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SIZE from product group by product_id, product_title, product_price, product_gender, product_category, product_img) p;

select  * from (select product_option_id, SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_STOCK)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_STOCK,
    SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_SALED)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SALED 
    from product_option group by product_option_id) o;







select * from 
(select product_id, product_title, product_price, product_gender, product_category, product_img,
SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_COLOR)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_COLOR, 
SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_SIZE)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SIZE 
from product group by product_id, product_title, product_price, product_gender, product_category, product_img) p, 
(select product_option_id, SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_STOCK)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_STOCK,
SUBSTR(XMLAGG(XMLELEMENT(COL,',',PRODUCT_SALED)).EXTRACT('//text()').GETSTRINGVAL(),2) PRODUCT_SALED 
from product_option group by product_option_id) o where p.product_id = o.product_option_id;


drop table cos_address;
drop table cos_user;


CREATE TABLE tbl_user (
    user_seq number(20) primary key, -- 기본키
    user_email VARCHAR2(200) not null, -- 이메일,
    user_password VARCHAR2(200) NOT NULL, -- 비밀번호,
    user_name VARCHAR2(200) NOT NULL, -- 이름,
    user_birthday VARCHAR2(200) NOT NULL, -- 생년월일,
    user_phone VARCHAR2(200) NOT NULL, -- 핸드폰,
    user_gender VARCHAR2(50) NULL, --성별
    user_regdate date default sysdate, -- 가입일자
    user_role varchar2(200), -- 고객권한
    user_bank varchar2(200), -- 고객 은행
    user_account varchar2(200), -- 고객 환불 계좌번호
    user_repay varchar2(200) -- 소득공제용 번호
);

COMMIT;


select * from cos_user;
select * from cos_address;


-- order table --


create table tbl_order(

order_id number(20) not null primary key, --order_id를 null값이 오지못하게 하고 기본키로 설정함

user_email varchar2(100) not null, --user_email를 null값이 오지못하게 설정

product_seq number(20) not null, --product_seq를 null값이 오지못하게 설정

amount number(20) default 0, --amount속성을 기본값을 0으로 설정

total_price number(20) default 0
);

alter table tbl_order add constraint order_user_email_fk
foreign key(user_email) references cos_user(user_email);

alter table tbl_order add constraint order_product_seq_fk
foreign key(product_seq) references product(product_seq);

select * from product;
select * from tbl_order;

insert into tbl_order values(1, 'suovj140@gmail.com', 1, 0, 0);

-- 
select product_title, p.product_price, p.product_img from product p, (select * from tbl_order where user_email = 'suovj140@gmail.com') o where p.product_seq = o.product_seq;

select * from product where ;


create table user_account(
user_email varchar2(100) primary key,
user_name varchar2(100),
user_bank varchar2(100),
user_account number(30)
);

drop table user_account;
commit;

select * from user_account;

select * from cos_user;
select * from cos_address;
drop table cos_address;
drop table user_account;
drop table cos_user;











-- 2021 06 07 테이블 구조


CREATE TABLE tbl_user (
    user_seq number(20) primary key, -- 기본키
    user_email VARCHAR2(200) not null, -- 이메일,
    user_password VARCHAR2(200) NOT NULL, -- 비밀번호,
    user_name VARCHAR2(200) NOT NULL, -- 이름,
    user_birthday VARCHAR2(200) NOT NULL, -- 생년월일,
    user_phone VARCHAR2(200) NOT NULL, -- 핸드폰,
    user_gender VARCHAR2(50) NULL, --성별
    user_regdate date default sysdate, -- 가입일자
    user_role varchar2(200), -- 고객권한
    user_bank varchar2(200), -- 고객 은행
    user_account varchar2(200), -- 고객 환불 계좌번호
    user_repay varchar2(200) -- 소득공제용 번호
);


CREATE TABLE tbl_address (
    address_seq number(20) primary key,
    user_seq number(20),
    constraints user_seq foreign key(user_seq) references tbl_user(user_seq),
    user_email VARCHAR2(100) not null, -- 이메일
    address_name varchar2(100) not null,
    postcode varchar2(50) NULL, -- 우편번호,
    address VARCHAR2(200) NULL, -- 주소,
    detailAddress VARCHAR2(200) NULL, -- 상세주소
    user_phone varchar2(200) not null,
    user_phone2 varchar2(200)
);

insert into tbl_user values(1, 'suovj140@gmail.com', 'rnwlgns2', '구지훈', '1993-06-15', '010-4474-9986','M',sysdate, 'costomer', null, null, null);
insert into tbl_user values(2, 'test1@gmail.com', 'test1', 'test1', '1966-04-85', '010-4357-7979','W',sysdate, 'costomer', null, null, null);

insert into tbl_address values(1, 1, 'suovj140@gmail.com', '내집', '95554', '서울특별시 영등포구 당산동 121-289', '가온빌 701호', '010-4474-9986', null);
insert into tbl_address values(2, 1, 'suovj140@gmail.com', '본가', '95554', '서울특별시 마포구 이대', '학원 301호', '010-4444-7897', null);
insert into tbl_address values(3, 1, 'suovj140@gmail.com', '자취방', '95554', '서울특별시 서초구 고터', '고터 1층', '010-0044-4979', null);
insert into tbl_address values(4, 1, 'suovj140@gmail.com', '친구집', '95554', '서울특별시 어딘가 여기', '아파트 44층', '010-4949-7797', null);


insert into tbl_address values(2, 'test1@gmail.com', '어딘가1', 54354, '이세상 어딘가 1', '여긴어디니');
insert into tbl_address values(2, 'test1@gmail.com', '어딘가2', 46748, '이세상은 맞냐', '어딘지몰라');


create table tbl_order(

order_id number(20) not null primary key, --order_id를 null값이 오지못하게 하고 기본키로 설정함
user_email varchar2(100) not null, --user_email를 null값이 오지못하게 설정
product_seq number(20) not null, --product_seq를 null값이 오지못하게 설정
amount number(20) default 0, --amount속성을 기본값을 0으로 설정
total_price number(20) default 0
);

select * from tbl_user;
select * from tbl_address;


drop table tbl_address;
commit;

update tbl_user set user_repay = null where user_email = 'suovj140@gmail.com';

create sequence tbl_address_seq increment by 1 start with 0 minvalue 0;

insert into dual values(tbl_address_seq.nextval);


select * from product;

select * from ;

commit;















--
 select *
        from
        (select rownum rnum, p.*
        from
        (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size
        from
        product group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p);
       
       
       
       
       
       
       
       
select product_option_id, sum(product_saled) product_saled from product_option group by product_option_id;
       
select *
from
(select rownum rnum, p.* 
from
(select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size, product_saled
from
product, (select product_option_id, sum(product_saled) product_saled from product_option group by product_option_id) where product_id = product_option_id
group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img, product_saled) p);

commit;






select *
from
(select rownum rnum, p.*        
from
(select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size
from
product, (select product_option_id, sum(product_saled) product_saled from product_option group by product_option_id) where product_id = product_option_id
group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img, product_saled) p);
       
       
update product set product_img = '이미지1.jpg,이미지2.jpg';
       
    
commit;


drop table tbl_order;
receipt;

-- 20210611
-- 주문 테이블 


create table tbl_order (
    order_id     varchar2(50) not null,
    user_email      VARCHAR2(200) not null,
    address   varchar2(100) not null,
    detailAddress varchar2(100) not null,
    orderProductAmount number       not null,
    total_price number not null,
    order_status varchar2(20) default '배송준비중',
    orderDate   Date default sysdate,   
    primary key(order_Id)
);

drop table tbl_order;

select * from tbl_user;

create table tbl_orderDetail (
    orderDetailsNum number not null,
    order_id     varchar2(50) not null,
    product_seq number(20) not null,
    money number       not null,
    amount number not null,
    primary key(orderDetailsNum)
);
create sequence tbl_order_details_seq;

alter table tbl_orderDetail
    add constraint tbl_order_detail_orderId foreign key(order_Id)
    references tbl_order(order_id);
alter table tbl_orderDetail
    add constraint tbl_order_detail_product_seq foreign key(product_seq)
    references product(product_seq);
    
    select * from tbl_order where user_email = 'suovj140@gmail.com';
    
select * from tbl_order;

insert into tbl_order values('주문1', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-289', '가온빌 701호', 2, 254000, '배송준비중', sysdate);
insert into tbl_order values('주문2', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문3', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문4', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문5', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문6', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문7', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문8', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문9', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문10', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문11', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문12', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문13', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문14', 'suovj140@gmail.com', '서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);


commit;















-- 테이블 모두 변경

SELECT * FROM tbl_user WHERE user_email = 'suovj140@gmail.com';
select * from tbl_address where user_email = 'suovj140@gmail.com';



CREATE TABLE tbl_user (
    user_email VARCHAR2(100) primary key, -- 이메일,
    user_password VARCHAR2(100), -- 비밀번호,
    user_name VARCHAR2(50), -- 이름,
    user_birthday VARCHAR2(100) , -- 생년월일,
    user_phone VARCHAR2(100) , -- 핸드폰,
    user_gender VARCHAR2(20) , --성별
    user_regdate VARCHAR2(50), -- 가입일자,
    user_role NUMBER, -- 고객권한
    user_bank varchar2(20), --은행 
    user_account varchar2(100), --계좌번호
    user_repay varchar2(100) -- 소득공제용 정보
);


insert into tbl_user values('suovj140@gmail.com', 'rnwlgns2', '구지훈', '1993-06-15', '010-4474-9986','M', '2021-06-11', 0, null, null, null);
insert into tbl_user values('test1@gmail.com', 'test1', 'test1', '1966-04-85', '010-4357-7979','W',sysdate, 1, null, null, null);

commit;

drop table tbl_user;
drop table tbl_address;




CREATE TABLE tbl_address_info (
    address_seq number(20) primary key,
    user_email VARCHAR2(100) not null, -- 이메일
    constraints user_email foreign key(user_email) references tbl_user(user_email),
    post_code varchar2(100) NULL, -- 우편번호,
    address VARCHAR2(200) NULL, -- 주소,
    detail_address VARCHAR2(200) NULL, -- 상세주소
    address_name varchar2(100) not null,
    address_phone varchar2(100) not null,
    address_phone2 varchar2(100)
);


insert into tbl_address_info values(tbl_address_info_seq.nextval, 'suovj140@gmail.com', '95554', '서울특별시 영등포구 당산동 121-289', '가온빌 701호', '내집',   '010-4474-9986', null);
insert into tbl_address_info values(2, 'suovj140@gmail.com', '95554', '서울특별시 마포구 이대', '학원 301호', '본가',   '010-4444-7897', null);
insert into tbl_address_info values(3, 'suovj140@gmail.com', '95554', '서울특별시 서초구 고터', '고터 1층', '자취방',   '010-0044-4979', null);
insert into tbl_address_info values(4, 'suovj140@gmail.com', '95554', '서울특별시 어딘가 여기', '아파트 44층', '친구집',   '010-4949-7797', null);


insert into tbl_address_info values(5, 'test1@gmail.com', '54354', '이세상 어딘가 1', '여긴어디니', '어딘가1',  '010-0000-0000', null);
insert into tbl_address_info values(6, 'test1@gmail.com', '46748', '이세상은 맞냐', '어딘지몰라', '어딘가2',  '010-0000-0000', null);



commit;

select * from tbl_user;
select * from tbl_address_info;
delete tbl_address_info;


drop sequence tbl_address_seq;

create sequence tbl_address_info_seq;


drop table tbl_user;
drop table tbl_address;
drop table users;


create table tbl_order (
    order_id     varchar2(50) not null,
    user_email      VARCHAR2(200) not null,
    post_code varchar2(100) not null,
    address   varchar2(100) not null,
    detail_address varchar2(100) not null,
    order_product_amount number       not null,
    total_price number not null,
    order_status varchar2(20) default '배송준비중',
    order_date   varchar2(50),   
    primary key(order_Id)
);
alter table tbl_order
    add constraint tbl_order_user_email foreign key(user_email)
    references tbl_user(user_email);


insert into tbl_order values('주문1', 'suovj140@gmail.com', '53497', '서울특별시 영등포구 당산동 121-289', '가온빌 701호', 2, 254000, '배송준비중', sysdate);
insert into tbl_order values('주문2', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문3', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문4', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문5', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문6', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문7', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문8', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문9', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문10', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문11', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문12', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문13', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);
insert into tbl_order values('주문14', 'suovj140@gmail.com', '53497','서울특별시 영등포구 당산동 121-111', '가온빌 1101호', 3, 557000, '배송준비중', sysdate);













create table tbl_order_detail (
    order_detail_num number not null,
    order_id     varchar2(50) not null,
    product_seq number(20) not null,
    money number       not null,
    amount number not null,
    primary key(order_detail_num)
);
drop sequence tbl_order_details_seq;

create sequence tbl_order_details_seq;

create sequence tbl_address_info_seq;

alter table tbl_order_detail
    add constraint tbl_order_detail_orderId foreign key(order_Id)
    references tbl_order(order_id);
    
alter table tbl_order_detail
    add constraint tbl_order_detail_product_seq foreign key(product_seq)
    references tbl_product(product_seq);
    
    
    
select * from tbl_order;

commit;


select * from product;

update product set product_img = '이미지1.jpg';

drop sequence product_seq;
drop table product;
drop table product_option;








-- 2021 06 13 상품, 상품옵션테이블 변경


select *
from
(select rownum rnum, p.*
from
(select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size, product_saled
from
product, (select product_option_id, sum(product_saled) product_saled from product_option group by product_option_id) where product_id = product_option_id
group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img, product_saled) p);



CREATE TABLE tbl_product (
	product_seq NUMERIC NOT NULL, -- 상품번호,
	product_id NUMERIC NOT NULL, -- 상품아이디,
	product_title VARCHAR2(100) NOT NULL, -- 상품제목,
	product_price NUMERIC NOT NULL, -- 상품가격,
	product_img VARCHAR2(100) NOT NULL, -- 상품이미지,
	product_size VARCHAR2(100) NULL, -- 상품사이즈,
	product_color VARCHAR2(100) NULL, -- 상품컬러,
	product_gender VARCHAR2(100) NOT NULL, -- 상품성별,
	product_content VARCHAR2(100) NULL, -- 상품내용,
	product_material VARCHAR2(100) NULL, -- 상품재질,
	product_category VARCHAR2(50) NULL, -- 상품카테고리,
	product_date VARCHAR2(30) NULL -- 상품등록날짜
);

-- 상품
ALTER TABLE tbl_product
	ADD CONSTRAINT PK_tbl_product -- 상품 기본키
	PRIMARY KEY (
		product_seq -- 상품번호
	);
    
    
    
-- 상품옵션
CREATE TABLE tbl_product_option (
	product_seq NUMERIC NULL, -- 상품번호,
	product_id NUMERIC NULL, -- 상품아이디,
	product_stock NUMERIC NULL, -- 상품재고,
	product_saled NUMERIC NULL -- 상품판매량
);

ALTER TABLE tbl_product_option
	ADD CONSTRAINT fk_tbl_product_option foreign key(product_seq)-- 상품 기본키
	references tbl_product(product_seq); -- 상품번호;
    
    
    
    
select * from tbl_product;
    
    
create sequence tbl_product_seq increment by 1 start with 0 minvalue 0;
create sequence tbl_product_option_seq increment by 1 start with 0 minvalue 0;
drop table tbl_product;
drop table tbl_product_option;
drop table tbl_order;
drop table tbl_order_detail;
drop table product;
drop sequence tbl_product_seq;
drop sequence tbl_product_option_seq;

select * from tbl_product;

insert into tbl_product values(tbl_product_seq.nextval, 1, '아동상품1', 20000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 1, '아동상품1', 20000, '이미지4.jpg', 'L','WHITH','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 2, '아동상품2', 23000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 2, '아동상품2', 23000, '이미지4.jpg', 'L','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 3, '아동상품3', 25000, '이미지4.jpg', 'L','RED','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 3, '아동상품3', 25000, '이미지4.jpg', 'M','DARKRED','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 3, '아동상품3', 25000, '이미지4.jpg', 'S','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 3, '아동상품3', 25000, '이미지4.jpg', 'S','GREEN','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 3, '아동상품3', 25000, '이미지4.jpg', 'XS','YELLOW','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 4, '아동상품4', 19000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 5, '여성상품1', 20000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 5, '여성상품1', 20000, '이미지4.jpg', 'L','WHITH','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 6, '여성상품2', 23000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 6, '여성상품2', 23000, '이미지4.jpg', 'L','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 6, '여성상품2', 23000, '이미지4.jpg', 'L','RED','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 7, '여성상품3', 25000, '이미지4.jpg', 'M','DARKRED','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 7, '여성상품3', 25000, '이미지4.jpg', 'S','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 8, '여성상품4', 25000, '이미지4.jpg', 'S','GREEN','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 8, '여성상품4', 25000, '이미지4.jpg', 'XS','YELLOW','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 9, '여성상품5', 19000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 10, '남성상품1', 20000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 10, '남성상품1', 20000, '이미지4.jpg', 'L','WHITH','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 11, '남성상품2', 23000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 11, '남성상품2', 23000, '이미지4.jpg', 'L','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 12, '남성상품3', 25000, '이미지4.jpg', 'L','RED','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 12, '남성상품3', 25000, '이미지4.jpg', 'M','DARKRED','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '남성상품4', 26000, '이미지4.jpg', 'S','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '남성상품4', 26000, '이미지4.jpg', 'S','GREEN','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '남성상품4', 26000, '이미지4.jpg', 'XS','YELLOW','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 13, '남성상품4', 26000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 14, '아동악세서리1', 20000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','악세사리',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 14, '아동악세서리1', 20000, '이미지4.jpg', 'L','WHITH','KIDS','아동상품입니다.','면','악세사리',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 14, '아동악세서리1', 20000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','악세사리',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '아동악세서리2', 23000, '이미지4.jpg', 'L','BLACK','KIDS','아동상품입니다.','면','악세사리',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '아동악세서리2', 23000, '이미지4.jpg', 'L','RED','KIDS','아동상품입니다.','면','악세사리',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '아동악세서리2', 23000, '이미지4.jpg', 'M','DARKRED','KIDS','아동상품입니다.','면','악세사리',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 15, '아동악세서리2', 23000, '이미지4.jpg', 'S','BLACK','KIDS','아동상품입니다.','면','악세사리',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 16, '아동악세서리3', 25000, '이미지4.jpg', 'S','GREEN','KIDS','아동상품입니다.','면','악세사리',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 16, '아동악세서리3', 25000, '이미지4.jpg', 'XS','YELLOW','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 16, '아동악세서리3', 25000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 20, '여성악세서리1', 20000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 20, '여성악세서리1', 20000, '이미지4.jpg', 'L','WHITH','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 21, '여성악세서리2', 23000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 21, '여성악세서리2', 23000, '이미지4.jpg', 'L','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 22, '여성악세서리3', 25000, '이미지4.jpg', 'L','RED','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 22, '여성악세서리3', 25000, '이미지4.jpg', 'M','DARKRED','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 23, '여성악세서리4', 25000, '이미지4.jpg', 'S','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 23, '여성악세서리4', 25000, '이미지4.jpg', 'S','GREEN','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 23, '여성악세서리4', 25000, '이미지4.jpg', 'XS','YELLOW','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 24, '여성악세서리5', 19000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);

insert into tbl_product values(tbl_product_seq.nextval, 25, '남성악세서리1', 20000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 25, '남성악세서리1', 20000, '이미지4.jpg', 'L','WHITH','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 26, '남성악세서리2', 23000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 26, '남성악세서리2', 23000, '이미지4.jpg', 'L','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '남성악세서리3', 25000, '이미지4.jpg', 'L','RED','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '남성악세서리3', 25000, '이미지4.jpg', 'M','DARKRED','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '남성악세서리3', 25000, '이미지4.jpg', 'S','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '남성악세서리3', 25000, '이미지4.jpg', 'S','GREEN','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '남성악세서리3', 25000, '이미지4.jpg', 'XS','YELLOW','KIDS','아동상품입니다.','면','바지',SYSDATE);
insert into tbl_product values(tbl_product_seq.nextval, 27, '남성악세서리3', 25000, '이미지4.jpg', 'XL','BLACK','KIDS','아동상품입니다.','면','바지',SYSDATE);


update tbl_product set product_gender = 'W' where product_id between 20 and 24;
update tbl_product set product_gender = 'M' where product_id between 25 and 27;
update tbl_product set product_category = '악세사리' where product_id between 14 and 27;

commit;


DROP TABLE TBL_PRODUCT;
drop table tbl_product_option;
drop sequence tbl_product_seq;
drop sequence tbl_product_option_seq;

insert into tbl_product_option values(tbl_product_option_seq.nextval, 1, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 1, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 2, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 2, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 3, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 3, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 3, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 3, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 3, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 4, 100, 900);

insert into tbl_product_option values(tbl_product_option_seq.nextval, 5, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 5, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 6, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 6, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 6, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 7, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 7, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 8, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 8, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 9, 100, 900);

insert into tbl_product_option values(tbl_product_option_seq.nextval, 10, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 10, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 11, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 11, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 12, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 12, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 13, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 13, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 13, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 13, 100, 900);

insert into tbl_product_option values(tbl_product_option_seq.nextval, 14, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 14, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 14, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 15, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 15, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 15, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 15, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 16, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 16, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 16, 100, 900);

insert into tbl_product_option values(tbl_product_option_seq.nextval, 20, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 20, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 21, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 21, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 22, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 22, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 23, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 23, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 23, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 24, 100, 900);

insert into tbl_product_option values(tbl_product_option_seq.nextval, 25, 250, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 25, 260, 300);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 26, 240, 800);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 26, 100, 100);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 200, 10);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 30, 20);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 250, 30);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 270, 70);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 290, 500);
insert into tbl_product_option values(tbl_product_option_seq.nextval, 27, 100, 900);

select * from tbl_product;

select * from tbl_product_option;








commit;





select max(rownum) from (select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size
from tbl_product group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img) p;






select *
from
(select rownum rnum, p.*
from
(select product_id, product_title, product_content, product_price, product_gender, product_category, product_img, wm_concat(product_color) product_color, wm_concat(product_size) product_size, product_saled
from
tbl_product, (select product_id product_option_id, sum(product_saled) product_saled from tbl_product_option group by product_id) where product_id = product_option_id
group by product_id, product_title, product_content, product_price, product_gender, product_category, product_img, product_saled) p);










drop table tbl_orderdetail;




select * from tbl_order_detail;
insert into tbl_order_detail values(1, '주문1', 1, 172000, 2);
insert into tbl_order_detail values(2, '주문1', 7, 10000, 1);
insert into tbl_order_detail values(3, '주문1', 8, 25000, 4);
select * from tbl_order o, tbl_order_detail od where o.order_id = od.order_id;


alter table tbl_order add pay_info varchar2(100);
update tbl_order set pay_info = '카카오페이';

select * from tbl_order where order_id = '주문1';
select p.*, od.order_id, od.money, od.amount from tbl_order_detail od, tbl_product p where od.order_id = '주문1' and od.product_seq = p.product_seq;




-- 20210614 아침시작
select * from tbl_user;
select * from tbl_address_info;
select * from tbl_product;
select * from tbl_product_option;
select * from tbl_order;
select * from tbl_order_detail;
insert into tbl_order_detail values(4, '주문2', 3, 27560, 3);
insert into tbl_order_detail values(5, '주문2', 1, 2550, 7);
insert into tbl_order_detail values(6, '주문3', 2, 277760, 2);
insert into tbl_order_detail values(7, '주문3', 7, 2990, 1);
insert into tbl_order_detail values(8, '주문3', 10, 23000, 3);


alter table tbl_order add user_name varchar2(100);
update tbl_order set user_name = '후니택배';

commit;