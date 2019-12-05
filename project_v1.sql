-- DDL for hotels

drop table if exists reservations cascade;
drop table if exists rooms cascade;
drop table if exists bedding_type_prices;
drop table if exists base_bedding_type_prices;
drop table if exists bedding_types;
drop table if exists sections;
drop table if exists hotels;
drop table if exists customers;

create table if not exists customers
(
    customer_id  int auto_increment not null primary key,
    first_name   varchar(20)        not null,
    last_name    varchar(10)        not null,
    email        varchar(30)        not null unique,
    phone_number varchar(10)        not null
);

create table if not exists hotels
(
    hotel_id int auto_increment not null primary key,
    address  varchar(30)        not null,
    city     varchar(30)        not null,
    state    varchar(30)        not null,
    zipcode  varchar(10)        not null
);

create table if not exists sections
(
    hotel_id   int         not null,
    section_id int         not null,
    name       varchar(30) not null,
    room_type  varchar(30) not null default '',
    floor      int         not null,
    primary key (hotel_id, section_id),
    foreign key (hotel_id) references hotels (hotel_id)
);

create table if not exists bedding_types
(
    name varchar(30) primary key
);

create table if not exists rooms
(
    hotel_id     int         not null,
    section_id   int         not null,
    room_id      int         not null,
    name         varchar(30) not null,
    bedding_type varchar(30) not null,
    primary key (hotel_id, section_id, room_id),
    foreign key (hotel_id) references sections (hotel_id),
    foreign key (bedding_type) references bedding_types (name)
);

create table if not exists bedding_type_prices
(
    hotel_id        int           not null,
    bedding_type    varchar(30)   not null,
    apply_start     date          not null,
    apply_end       date          not null,
    monday_price    numeric(8, 2) not null,
    tuesday_price   numeric(8, 2) not null,
    wednesday_price numeric(8, 2) not null,
    thursday_price  numeric(8, 2) not null,
    friday_price    numeric(8, 2) not null,
    saturday_price  numeric(8, 2) not null,
    sunday_price    numeric(8, 2) not null,
    primary key (hotel_id, bedding_type),
    foreign key (bedding_type) references bedding_types (name)
);

create table if not exists reservations
(
    id                int auto_increment not null primary key,
    customer_id       int                not null,
    hotel_id          int                not null,
    section_id        int                not null,
    room_id           int                not null,
    day_start         date               not null,
    day_end           date               not null,
    reservation_names varchar(30)        not null default '',
    foreign key (hotel_id, section_id, room_id) references rooms (hotel_id, section_id, room_id),
    foreign key (customer_id) references customers (customer_id)
)