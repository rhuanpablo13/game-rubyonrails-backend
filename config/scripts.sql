create database game_db_dev;
--create database game_db_test;
--create database game_db_prod;

use game_db_dev;

create table users(
    id int not null primary key auto_increment,
    name varchar(150)
) row_format=dynamic engine=innodb default charset=utf8;

create table monsters(
    id int not null primary key auto_increment,
    name varchar(150)
) row_format=dynamic engine=innodb default charset=utf8;

create table collected_coins(
    id int not null primary key auto_increment,
    user_id int not null,
    value_coin int not null,
    foreign key (user_id) references users(id)
) row_format=dynamic engine=innodb default charset=utf8;

create table killed_monster(
    id int not null primary key auto_increment,
    user_id int not null,
    monster_id int not null,
    foreign key (user_id) references users(id),
    foreign key (monster_id) references monsters(id)
) row_format=dynamic engine=innodb default charset=utf8;

create table deaths(
    id int not null primary key auto_increment,
    user_id int not null,
    time_reg timestamp not null,
    foreign key (user_id) references users(id)
) row_format=dynamic engine=innodb default charset=utf8;

create table trophy(
    id int not null primary key auto_increment,
    name varchar(45)
) row_format=dynamic engine=innodb default charset=utf8;

create table user_trophy(
    id int not null primary key auto_increment,
    user_id int not null,
    trophy_id int not null,
    foreign key (user_id) references users(id),
    foreign key (trophy_id) references trophy(id)
) row_format=dynamic engine=innodb default charset=utf8; 



insert into users values (0, 'noob_master123');
insert into users values (1, 'isa_tocadocoelho');

insert into monsters values (0, 'turtle');
insert into monsters values (1, 'bowser');

insert into trophy values (0, 'ouro');
insert into trophy values (1, 'prata');
insert into trophy values (2, 'bronze');
insert into trophy values (3, 'latao');
insert into trophy values (5, 'madeira');

insert into collected_coins values (0, 0, 1);
insert into collected_coins values (1, 0, 2);
insert into collected_coins values (2, 0, 5);
insert into collected_coins values (3, 0, 2);

insert into collected_coins values (5, 1, 1);
insert into collected_coins values (6, 1, 2);
insert into collected_coins values (7, 1, 5);
insert into collected_coins values (8, 1, 2);

insert into killed_monster values (0, 0, 1);
insert into killed_monster values (1, 0, 2);
insert into killed_monster values (2, 0, 1);
insert into killed_monster values (3, 0, 2);

insert into killed_monster values (5, 1, 1);
insert into killed_monster values (6, 1, 2);
insert into killed_monster values (7, 1, 2);
insert into killed_monster values (8, 1, 2);

insert into deaths values (0, 0, sysdate());
select sleep(3);
insert into deaths values (1, 0, sysdate());
select sleep(3);
insert into deaths values (2, 1, sysdate());

insert into user_trophy values (0, 0, 1);
insert into user_trophy values (1, 1, 3);
