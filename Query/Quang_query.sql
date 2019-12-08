###Cau 1###
SELECT h.hotel_name,COUNT(r.reservation_id) FROM hotels h
JOIN reservations r ON h.hotel_id = r.hotel_id
JOIN sections s ON s.hotel_id = h.hotel_id
WHERE s.room_type = 'President'
GROUP BY h.hotel_id
ORDER BY COUNT(r.reservation_id) DESC LIMIT 1;

####Cau 2####
SELECT l.city, COUNT(h.hotel_id) FROM locations l
JOIN hotels h ON l.location_id = h.location_id
GROUP BY l.location_id
ORDER BY COUNT(h.hotel_id);

####Cau 3####
SELECT r.room_id,COUNT(r.reservation_id) FROM reservations r
JOIN hotels h  ON r.hotel_id = h.hotel_id
WHERE h.hotel_name = 'Royal Hotel' AND r.day_start >= '2019-01-01' AND r.day_end <= '2019-12-31'
GROUP BY r.room_id
ORDER BY COUNT(r.reservation_id) DESC LIMIT 1;

####Cau 4####
SELECT c.name,h.hotel_name,r.room_id,r.price FROM customers c
JOIN reservations r ON c.customer_id = r.customer_id
JOIN hotels h ON r.hotel_id = h.hotel_id
WHERE r.price = (SELECT MIN(r.price) FROM reservations r WHERE (day_end-day_start = 3));

####Cau 5 ####
SELECT r.room_id FROM rooms r
JOIN hotels h ON h.hotel_id = r.hotel_id
JOIN sections s ON r.section_id = s.section_id
WHERE h.hotel_name = 'Royal Hotel' AND r.floor = 5 AND s.room_type = 'Double';

###Cau 6####
SELECT l.city, count(r.reservation_id) FROM locations l
JOIN hotels h ON l.location_id = h.location_id
JOIN reservations r ON r.hotel_id = h.hotel_id
WHERE r.day_start >= '2019-06-01' AND r.day_end <= '2019-06-30' 
GROUP BY l.location_id
ORDER BY COUNT(r.reservation_id) DESC limit 1;

####Cau 7####
SELECT h.hotel_name, SUM(r.price) FROM hotels h
JOIN reservations r ON h.hotel_id = r.hotel_id
WHERE r.day_start >= '2019-01-01' AND r.day_end <= '2019-12-31'
GROUP BY h.hotel_id ORDER BY SUM(r.price) DESC; 

###Cau 8####
SELECT h.hotel_name FROM hotels h
JOIN reservations r ON h.hotel_id = r.hotel_id
JOIN customers c ON r.customer_id = c.customer_id
WHERE c.name = 'Lưu Việt Tùng';

###Cau 9###
SELECT rooms.floor,COUNT(r.reservation_id) FROM rooms
JOIN reservations r ON rooms.room_id = r.room_id
GROUP BY rooms.floor ORDER BY COUNT(r.reservation_id) DESC limit 1;

###Cau 10###
SELECT c.name,group_concat(l.city) FROM customers c
JOIN reservations r ON c.customer_id = r.customer_id
JOIN hotels h ON h.hotel_id = r.hotel_id
JOIN locations l ON l.location_id = h.location_id
GROUP BY c.customer_id
HAVING COUNT(l.city) >= 3;
