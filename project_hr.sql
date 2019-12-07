use project;
-- DDL for hotels

drop table if exists reservations cascade;
drop table if exists rooms cascade;
drop table if exists sales;
drop table if exists sections;
drop table if exists hotels;
drop table if exists customers;
drop table if exists locations;

create table if not exists locations
(
    location_id int         not null,
    city        varchar(30) not null,
    primary key (location_id)
);

create table if not exists customers
(
    customer_id  int         not null,
    name         varchar(20) not null,
    email        varchar(30) not null unique,
    phone_number varchar(10) not null,
    location_id  int,
    primary key (customer_id),
    foreign key (location_id) references locations (location_id)
);

create table if not exists hotels
(
    hotel_id    int not null,
    location_id int not null,
    hotel_name  varchar(50) default '',
    primary key (hotel_id),
    foreign key (location_id) references locations (location_id)
);

create table if not exists sections
(
    hotel_id   int         not null,
    section_id int         not null,
    room_type  varchar(30) not null default '',
    primary key (hotel_id, section_id),
    foreign key (hotel_id) references hotels (hotel_id)
);

create table if not exists sales
(
    sale_id      int not null,
    apply_month  int not null,
    sale_percent int not null,
    primary key (sale_id)
);

create table if not exists rooms
(
    room_id    int not null,
    hotel_id   int not null,
    section_id int not null,
    sale_id    int not null,
    floor      int not null,
    primary key (hotel_id, section_id, room_id),
    foreign key (hotel_id, section_id) references sections (hotel_id, section_id),
    foreign key (sale_id) references sales (sale_id)
);

create table if not exists reservations
(
    reservation_id int  not null primary key,
    customer_id    int  not null,
    hotel_id       int  not null,
    section_id     int  not null,
    room_id        int  not null,
    day_start      date not null,
    day_end        date not null,
    price          int  not null,
    foreign key (hotel_id, section_id, room_id) references rooms (hotel_id, section_id, room_id),
    foreign key (customer_id) references customers (customer_id)
);