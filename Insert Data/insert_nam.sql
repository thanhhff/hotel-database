insert into locations (location_id, city) values
(7000, 'Ha Noi'),
(7010, 'Ho Chi Minh'),
(7020, 'Da Nang'),
(7030, 'Hai Phong'),
(7040, 'Quang Ninh'),
(7050, 'Quang Binh'),
(7060, 'Da Lat'),
(7070, 'Hue'),
(7080, 'Khanh Hoa'),
(7090, 'Lang Son'),
(7110, 'Thanh Hoa'),
(7220, 'Nghe An'),
(7330, 'Bac Ninh'),
(7440, 'Hung Yen'),
(7550, 'Nam Dinh'),
(7660, 'Phu Yen'),
(7770, 'Buon Ma Thuat'),
(7880, 'Can Tho'),
(7990, 'Kien Giang');

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

insert into sales (sale_id, apply_month, sale_percent) values
(6010, 1, 30),
(6011, 1, 25),
(6012, 1, 50),
(6020, 2, 30),
(6021, 2, 40),
(6030, 3, 10),
(6031, 3, 25),
(6040, 4, 50),
(6041, 4, 35),
(6042, 4, 20),
(6050, 5, 30),
(6051, 5, 10),
(6052, 5, 20),
(6060, 6, 45),
(6061, 6, 25),
(6062, 6, 15),
(6070, 7, 15),
(6071, 7, 20),
(6080, 8, 50),
(6081, 8, 30),
(6082, 8, 10),
(6090, 9, 10),
(6091, 9, 15),
(6092, 9, 25),
(6100, 10, 30),
(6101, 10, 15),
(6102, 10, 10),
(6110, 11, 10),
(6111, 11, 30),
(6112, 11, 40),
(6120, 12, 30),
(6121, 12, 40),
(6122, 12, 50) ; 

insert into sections (hotel_id, section_id, room_type) values
(1100, 5101, 'Single'),  
(1100, 5102, 'Double'),  
(1100, 5103, 'Triple'),  
(1100, 5104, 'Quad'),    
(1100, 5105, 'King'),    
(1100, 5106, 'Twin'),    
(1200, 5201, 'Single'),  
(1200, 5202, 'Double'), 
(1200, 5203, 'Triple'),  
(1200, 5204, 'Quad'),    
(1200, 5206, 'Twin'),    
(1300, 5301, 'Single'),  
(1300, 5302, 'Double'),  
(1300, 5303, 'Triple'),  
(1300, 5304, 'Quad'),    
(1300, 5305, 'King'),    
(1300, 5306, 'President'), 
(1400, 5401, 'Single'),  
(1400, 5402, 'Double'),  
(1400, 5403, 'Triple'),  
(1400, 5404, 'Quad'),    
(1400, 5405, 'King'),    
(1500, 5501, 'Single'),  
(1500, 5502, 'Double'),  
(1500, 5503, 'Triple'),  
(1500, 5504, 'Quad'),    
(1500, 5505, 'King'),    
(1500, 5506, 'Twin'),    
(1600, 5601, 'Single'),  
(1600, 5602, 'Double'),  
(1600, 5605, 'King'),    
(1600, 5606, 'Twin'),    
(1700, 5701, 'Single'),  
(1700, 5702, 'Double'), 
(1700, 5703, 'Triple'),  
(1700, 5706, 'Twin'),    
(1800, 5801, 'Single'),  
(1800, 5802, 'Double'),  
(1800, 5803, 'Triple'),  
(1800, 5804, 'Quad'),    
(1800, 5805, 'Twin'),    
(1900, 5901, 'Single'),  
(1900, 5902, 'Double'),  
(1900, 5903, 'Triple'); 

