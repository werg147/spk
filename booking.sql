--계정생성 
CREATE USER sparkling IDENTIFIED BY sparkling;
grant resource, connect to sparkling;

--drop
drop table seller;
drop SEQUENCE seq_user_no;

commit;
rollback;

--////////////////////////////////
--user
create table users(
    user_no NUMBER not null,
    user_id VARCHAR2(50) not null,
    password VARCHAR2(50) not null,
    nickname VARCHAR2(30) not null,
    address VARCHAR2(300) not null,
    user_photo VARCHAR2(300) not null,
    user_level NUMBER not null,
    user_date date not null,
    PRIMARY KEY (user_no)
);

create SEQUENCE seq_users_no
INCREMENT by 1
start with 1
nocache;

SELECT
    *
FROM users;

--seller
create table seller(
    sell_no NUMBER not null,
    user_no NUMBER not null,
    sell_type VARCHAR2(50) not null,
    sell_name VARCHAR2(100) not null,
    business_no NUMBER not null,
    sell_address VARCHAR2(300) not null,
    sell_account NUMBER not null,
    sell_bank VARCHAR2(100) not null,
    PRIMARY KEY (sell_no),
    CONSTRAINT seller_fk FOREIGN KEY (user_no)
    REFERENCES users(user_no)
);

create SEQUENCE seq_seller_no
INCREMENT by 1
start with 1
nocache;

SELECT
    *
FROM seller;

--gym
create table gym(
    gym_no NUMBER not null,
    user_no NUMBER not null,
    gym_name VARCHAR2(200) not null,
    gym_address VARCHAR2(300) not null,
    gym_ph VARCHAR2(200) not null,
    gym_time VARCHAR2(300) not null,
    gym_notice VARCHAR2(4000) not null,
    gym_event VARCHAR2(50) not null,
    gym_date date not null,
    PRIMARY KEY (gym_no),
    CONSTRAINT gym_fk FOREIGN KEY (user_no)
    REFERENCES users(user_no)
);

create SEQUENCE seq_gym_no
INCREMENT by 1
start with 1
nocache;

SELECT
    *
FROM gym;

--convenience
create table convenience(
    con_no NUMBER not null,
    gym_no NUMBER not null,
    con_name VARCHAR2(200) not null,
    con_state NUMBER not null,
    PRIMARY KEY (con_no),
    CONSTRAINT con_fk FOREIGN KEY (gym_no)
    REFERENCES gym(gym_no)
);

create SEQUENCE seq_con_no
INCREMENT by 1
start with 1
nocache;

SELECT
    *
FROM convenience;

--gymimg
create table gymimg(
    gym_img_no NUMBER not null,
    gym_no NUMBER not null,
    gym_img_savename VARCHAR2(500) not null,
    gym_img_name VARCHAR2(500) not null,
    gym_img_type VARCHAR2(200) not null,
    PRIMARY KEY (gym_img_no),
    CONSTRAINT gimg_fk FOREIGN KEY (gym_no)
    REFERENCES gym(gym_no)
);

create SEQUENCE seq_gymimg_no
INCREMENT by 1
start with 1
nocache;

SELECT
    *
FROM gymimg;

--booking
create table booking(
    booking_no NUMBER not null,
    gym_no NUMBER not null,
    booking_date VARCHAR2(200) not null,
    booking_start VARCHAR2(200) not null,
    booking_end VARCHAR2(200) not null,
    booking_price NUMBER not null,
    booking_state VARCHAR2(200) not null,
    booking_reg_date date not null,
    PRIMARY KEY (booking_no),
    CONSTRAINT booking_fk FOREIGN KEY (gym_no)
    REFERENCES gym(gym_no)
);

create SEQUENCE seq_booking_no
INCREMENT by 1
start with 1
nocache;

SELECT
    *
FROM booking;