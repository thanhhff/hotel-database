insert into locations (location_id, city) values
(7000, 'Hà Nội'),
(7010, 'TP Hồ Chí Minh'),
(7020, 'Đà Nẵng'),
(7030, 'Hải Phòng'),
(7040, 'Quảng Ninh'),
(7050, 'Quảng Bình'),
(7060, 'Đà Lạt'),
(7070, 'Huế'),
(7080, 'Khánh Hòa'),
(7090, 'Lạng Sơn'),
(7110, 'Thanh Hóa'),
(7220, 'Nghệ An'),
(7330, 'Bắc Ninh'),
(7440, 'Hưng Yên'),
(7550, 'Nam Định'),
(7660, 'Phú Yên'),
(7770, 'Buôn Ma Thuật'),
(7880, 'Cần Thơ'),
(7990, 'Kiên Giang');

insert into hotels (hotel_id, location_id, hotel_name) values
(1100, 7000,'Royal Hotel'),
(1200, 7000, 'Sheraton Hanoi Hotel'),
(1300, 7000, 'JW Marriott Hanoi'),
(1400, 7010, 'Tan Son Nhat Hotel'),
(1500, 7010, 'Eastin Grand Hotel Saigon'),
(1600, 7020, 'Pavilion Hotel'),
(1700, 7030, 'Vinpearl Hotel Imperia Haiphong'),
(1800, 7040, 'Muong Thanh Luxury QuangNinh Hotel'),
(1900, 7060, 'Saphir DaLat Hotel');

-- insert into sections (hotel_id, section_id, room_type, floor) values

select * from hotels;
