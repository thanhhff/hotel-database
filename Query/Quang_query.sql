###cau 1 lấy ra tên khách sạn có loại phòng ‘president’ đc đặt nhiều nhất ###
select h.hotel_name as 'Tên khách sạn', count(r.reservation_id) as 'Số lượng phòng'
from hotels h
         join reservations r on h.hotel_id = r.hotel_id
         join sections s on s.hotel_id = h.hotel_id
where s.room_type = 'president'
group by h.hotel_id
order by count(r.reservation_id) desc
limit 1;

####cau 2 thống kê số lượng các khách sạn ở mỗi tỉnh ####
select l.city as 'Thành phố ', count(h.hotel_id) as 'Số lượng khách sạn'
from locations l
         join hotels h on l.location_id = h.location_id
group by l.location_id
order by count(h.hotel_id);

####cau 3 kể id phòng đc thuê nhiều nhất tại khách sạn ‘royal hotel’ trong năm 2019 ####
select r.room_id as 'Số phòng', count(r.reservation_id) as 'Số lần được đặt'
from reservations r
         join hotels h on r.hotel_id = h.hotel_id
where h.hotel_name = 'royal hotel'
  and r.day_start >= '2019-01-01'
  and r.day_end <= '2019-12-31'
group by r.room_id
order by count(r.reservation_id) desc
limit 1;

####cau 4 tên khách hàng, tên khách sạn, id phòng giá rẻ nhất mà khách đã đặt trong trường hợp người này chỉ ở 3 ngày ####
select c.name       as 'Khách hàng',
       h.hotel_name as 'Tên khách sạn',
       r.room_id    as 'Số phòng',
       r.price      as 'Giá tiền',
       r.day_start  as 'Ngay dat phong',
       r.day_end    as 'Ngay tra phong'
from customers c
         join reservations r on c.customer_id = r.customer_id
         join hotels h on r.hotel_id = h.hotel_id
where r.day_end - r.day_start = 3
  and r.price = (select min(price) from reservations where day_end - day_start = 3);

####cau 5 liệt kê các phòng đôi ở tầng 5 của khách sạn ‘royal hotel’ ####
select r.room_id as 'Số phòng'
from rooms r
         join hotels h on h.hotel_id = r.hotel_id
         join sections s on r.section_id = s.section_id
where h.hotel_name = 'royal hotel'
  and r.floor = 5
  and s.room_type = 'double';

###cau 6 tỉnh nào có nhiều người đặt phòng nhất trong tháng 6 ####
select l.city as 'Thành phố', count(r.reservation_id) 'Số lượng đặt'
from locations l
         join hotels h on l.location_id = h.location_id
         join reservations r on r.hotel_id = h.hotel_id
where r.day_start >= '2019-06-01'
  and r.day_end <= '2019-06-30'
group by l.location_id
order by count(r.reservation_id) desc
limit 1;

####cau 7 thống kê doanh thu các khách sạn trong 2019 theo chiều giảm dần ####
select h.hotel_name as 'Tên khách sạn', sum(r.price) 'Doanh thu'
from hotels h
         join reservations r on h.hotel_id = r.hotel_id
where r.day_start >= '2019-01-01'
  and r.day_end <= '2019-12-31'
group by h.hotel_id
order by sum(r.price) desc;

#### câu 8 đưa ra tên các khách sạn ở hà nội và id các phòng chưa có người đặt ứng với các khách sạn đó trong tháng 12 ####
select h.hotel_name as 'Tên khách sạn', group_concat(distinct rooms.room_id) as 'Các phòng trống'
from hotels h
         join reservations r on h.hotel_id = r.hotel_id
         join rooms on rooms.hotel_id = h.hotel_id
         join locations l on h.location_id = l.location_id
where rooms.room_id not in (select room_id from reservations where month(day_start) = 12 and month(day_end) = 12)
  and l.city = 'hà nội'
group by h.hotel_name;

#### câu 9 đưa ra tên khách hàng,tên các khách sạn đã ở, tổng chi phí họ phải trả cho việc đặt phòng ####
select c.name as 'Tên khách hàng', group_concat(h.hotel_name) as 'Tên khách sạn', sum(r.price) as 'Tổng chi phí'
from customers c
         join reservations r on r.customer_id = c.customer_id
         join hotels h on h.hotel_id = r.hotel_id
group by c.name
order by sum(r.price) desc;

###cau 10 liệt kê các khách hàng trong năm 2019 đã ở hơn 3 tỉnh khác nhau ###
select c.name 'Tên khách hàng', group_concat(l.city) as 'Các tỉnh đã ở'
from customers c
         join reservations r on c.customer_id = r.customer_id
         join hotels h on h.hotel_id = r.hotel_id
         join locations l on l.location_id = h.location_id
group by c.customer_id
having count(l.city) >= 3;
