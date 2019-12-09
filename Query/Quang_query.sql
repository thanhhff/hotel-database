###Cau 1 Lấy ra tên khách sạn có loại phòng ‘President’ đc đặt nhiều nhất ###
SELECT h.hotel_name as 'Tên khách sạn', COUNT(r.reservation_id) as 'Số lượng phòng'
FROM hotels h
         JOIN reservations r ON h.hotel_id = r.hotel_id
         JOIN sections s ON s.hotel_id = h.hotel_id
WHERE s.room_type = 'President'
GROUP BY h.hotel_id
ORDER BY COUNT(r.reservation_id) DESC
LIMIT 1;

####Cau 2 Thống kê số lượng các khách sạn ở mỗi tỉnh ####
SELECT l.city as 'Thành phố ', COUNT(h.hotel_id) as 'Số lượng khách sạn'
FROM locations l
         JOIN hotels h ON l.location_id = h.location_id
GROUP BY l.location_id
ORDER BY COUNT(h.hotel_id);

####Cau 3 Kể id phòng đc thuê nhiều nhất tại khách sạn ‘Royal Hotel’ trong năm 2019 ####
SELECT r.room_id as 'Số phòng', COUNT(r.reservation_id) as 'Số lần được đặt'
FROM reservations r
         JOIN hotels h ON r.hotel_id = h.hotel_id
WHERE h.hotel_name = 'Royal Hotel'
  AND r.day_start >= '2019-01-01'
  AND r.day_end <= '2019-12-31'
GROUP BY r.room_id
ORDER BY COUNT(r.reservation_id) DESC
LIMIT 1;

####Cau 4 Tên khách hàng, Tên Khách sạn, id phòng giá rẻ nhất mà khách đã đặt trong trường hợp người này chỉ ở 3 ngày ####
SELECT c.name as 'Khách hàng', h.hotel_name as 'Tên khách sạn', r.room_id as 'Số phòng', r.price as 'Giá tiền'
FROM customers c
         JOIN reservations r ON c.customer_id = r.customer_id
         JOIN hotels h ON r.hotel_id = h.hotel_id
WHERE r.price = (SELECT MIN(r.price) FROM reservations r WHERE (day_end - day_start = 3));

####Cau 5 Liệt kê các phòng đôi ở tầng 5 của khách sạn ‘Royal Hotel’ ####
SELECT r.room_id as 'Số phòng'
FROM rooms r
         JOIN hotels h ON h.hotel_id = r.hotel_id
         JOIN sections s ON r.section_id = s.section_id
WHERE h.hotel_name = 'Royal Hotel'
  AND r.floor = 5
  AND s.room_type = 'Double';

###Cau 6 Tỉnh nào có nhiều người đặt phòng nhất trong tháng 6 ####
SELECT l.city as 'Thành phố', count(r.reservation_id) 'Số lượng đặt'
FROM locations l
         JOIN hotels h ON l.location_id = h.location_id
         JOIN reservations r ON r.hotel_id = h.hotel_id
WHERE r.day_start >= '2019-06-01'
  AND r.day_end <= '2019-06-30'
GROUP BY l.location_id
ORDER BY COUNT(r.reservation_id) DESC
limit 1;

####Cau 7 Thống kê doanh thu các khách sạn trong 2019 theo chiều giảm dần ####
SELECT h.hotel_name as 'Tên khách sạn', SUM(r.price) 'Doanh thu'
FROM hotels h
         JOIN reservations r ON h.hotel_id = r.hotel_id
WHERE r.day_start >= '2019-01-01'
  AND r.day_end <= '2019-12-31'
GROUP BY h.hotel_id
ORDER BY SUM(r.price) DESC;

#### Câu 8 Đưa ra tên các khách sạn ở Hà Nội và id các phòng chưa có người đặt ứng với các khách sạn đó trong tháng 12 ####
SELECT h.hotel_name as 'Tên khách sạn', group_concat(distinct rooms.room_id) as 'Các phòng trống'
FROM hotels h
         JOIN reservations r ON h.hotel_id = r.hotel_id
         JOIN rooms ON rooms.hotel_id = h.hotel_id
         JOIN locations l ON h.location_id = l.location_id
WHERE rooms.room_id NOT IN (SELECT room_id FROM reservations WHERE month(day_start) = 12 AND month(day_end) = 12)
  AND l.city = 'Hà Nội'
GROUP BY h.hotel_name;

#### Câu 9 Đưa ra tên khách hàng,tên các khách sạn đã ở, tổng chi phí họ phải trả cho việc đặt phòng ####
SELECT c.name as 'Tên khách hàng', group_concat(h.hotel_name) as 'Tên khách sạn', SUM(r.price) as 'Tổng chi phí'
FROM customers c
         JOIN reservations r ON r.customer_id = c.customer_id
         JOIN hotels h ON h.hotel_id = r.hotel_id
GROUP BY c.name
ORDER BY SUM(r.price) DESC;

###Cau 10 Liệt kê các khách hàng trong năm 2019 đã ở hơn 3 tỉnh khác nhau ###
SELECT c.name 'Tên khách hàng', group_concat(l.city) as 'Các tỉnh đã ở'
FROM customers c
         JOIN reservations r ON c.customer_id = r.customer_id
         JOIN hotels h ON h.hotel_id = r.hotel_id
         JOIN locations l ON l.location_id = h.location_id
GROUP BY c.customer_id
HAVING COUNT(l.city) >= 3;
