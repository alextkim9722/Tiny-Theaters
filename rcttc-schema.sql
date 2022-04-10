drop database if exists tiny_theaters;
create database tiny_theaters;

use tiny_theaters;

create table customer (
	customer_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email_address varchar(50) not null,
    phone varchar(15) null,
    physical_address varchar(50) null
);

create table play (
	play_id int primary key auto_increment,
	title varchar(75) not null
);

create table theater (
	theater_id int primary key auto_increment,
    address varchar(100) not null,
    name varchar(50) not null,
    phone varchar(50) not null,
    email varchar(50) not null
);

create table performance (
	performance_id int primary key auto_increment,
    play_id int not null,
    theater_id int not null,
    price double not null,
    play_date date not null,
    constraint fk_performance_play_id
		foreign key (play_id)
        references play(play_id),
	constraint fk_performance_theater_id
		foreign key (theater_id)
        references theater(theater_id)
);

create table ticket (
    customer_id int not null,
    performance_id int not null,
    seat varchar(5) not null,
    constraint fk_ticket_customer_id
		foreign key (customer_id)
        references customer(customer_id),
    constraint fk_ticket_performance_id
		foreign key (performance_id)
        references performance(performance_id)
);
