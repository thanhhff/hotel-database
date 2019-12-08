use project;

### 1. Đưa ra Tên Khách Sạn, Tháng mà khách sạn đó có sale_percent lớn nhất, sắp xếp theo thứ tự giảm dần sale_percent.

select h.hotel_name                         as "Tên Khách Sạn",
       GROUP_CONCAT(distinct s.apply_month) as "Tháng",
       max(s.sale_percent)                  as "% Sale"
from hotels h
         inner join rooms r on h.hotel_id = r.hotel_id
         inner join sales s on r.sale_id = s.sale_id
group by h.hotel_name
order by max(sale_percent) desc;

### 2. Đưa ra Tên Khách Sạn, Địa Chỉ Khách Sạn, Giá Phòng có loại phòng KING rẻ nhất.

select h.hotel_name as "Tên Khách Sạn", l.city as "Thành Phố", r.price as "Giá"
from hotels h
         inner join locations l on h.location_id = l.location_id
         inner join reservations r on h.hotel_id = r.hotel_id
         inner join sections s on h.hotel_id = s.hotel_id
where s.room_type = 'King'
group by hotel_name, city, price
having price = (select min(r2.price)
                from reservations r2
                         inner join sections s2 on r2.hotel_id = s2.hotel_id
                where s2.room_type = 'King');


### 3. Đưa ra Loại Phòng mà các khách hàng giới tính NAM có xu hướng đặt.

select room_type as "Loại Phòng", count(room_type) as "Số lần đặt"
from sections s
         inner join reservations r on s.hotel_id = r.hotel_id
         inner join customers c on r.customer_id = c.customer_id
where gender = 'Nam'
group by room_type
having count(room_type) = (select count(room_type)
                           from sections s2
                                    inner join reservations r2 on s2.hotel_id = r2.hotel_id
                                    inner join customers c2 on r2.customer_id = c2.customer_id
                           where gender = 'Nam'
                           group by room_type
                           order by count(room_type) desc
                           limit 1);

### 4. Thống kê các Loại Phòng mà các khách sạn hiện có, sắp xếp theo tổng số lượng đặt phòng giảm dần.
### Yêu cầu in ra Tên Khách Sạn, Các Loại Phòng, Tổng Số Lượng Phòng đã được đặt.

select hotel_name                       as 'Tên Khách Sạn',
       group_concat(distinct room_type) as 'Các Loại Phòng',
       count(customer_id)               as 'Số Lượng Đặt Phòng'
from hotels h
         inner join sections s on h.hotel_id = s.hotel_id
         inner join reservations r on h.hotel_id = r.hotel_id
group by hotel_name
order by count(customer_id) desc;


### 5. Đưa ra Tên Khách Hàng sống ở Hải Phòng mà đặt phòng khách sạn ở Hà Nội. Và cũng đưa ra Tên Khách Sạn đã ở.

select c.name                                                             as 'Tên Khách Hàng',
       (select hotel_name from hotels where hotels.hotel_id = r.hotel_id) as 'Tên Khách Sạn'
from customers c
         inner join reservations r on c.customer_id = r.customer_id
where c.location_id = (select l1.location_id from locations l1 where city = 'Hải Phòng')
  and r.hotel_id in (select h.hotel_id
                     from hotels h
                              inner join locations l2 on h.location_id = l2.location_id
                     where city = 'Hà Nội');

### 6. Đưa ra Tên Khách Hàng, Địa Chỉ Khách Hàng, Ngày Bắt Đầu, Ngày Kết Thúc, Thời Gian  của khách hàng đã từng ở khách sạn JW Marriott Hanoi
# trong khoảng thời gian từ đầu tháng 01 / 2019 đến hết tháng 5 / 2019.

select c.name                                                               as 'Tên Khách Hàng',
       (select l.city from locations l where l.location_id = c.location_id) as 'Địa Chỉ Khách',
       r.day_start                                                          as 'Ngày Bắt Đầu',
       r.day_end                                                            as 'Ngày Kết Thúc',
       (day_end - day_start)                                                as 'Thời Gian Ở'
from customers c
         inner join reservations r on c.customer_id = r.customer_id
where r.hotel_id = (select hotel_id from hotels where hotel_name = 'JW Marriott Hanoi')
  and 01 <= month(r.day_start)
  and month(r.day_end) < 06
order by name asc;

### 7. Đưa ra Số Lượng khách NAM và khách NỮ đặt phòng trong tháng 1.




