use project;

### 1. Đưa ra Tên Khách Sạn, Tháng, % Sale mà khách sạn đó có sale_percent lớn nhất, sắp xếp theo thứ tự giảm dần sale_percent.

select h.hotel_name                         as "Tên Khách Sạn",
       GROUP_CONCAT(distinct s.apply_month) as "Tháng",
       max(s.sale_percent)                  as "% Sale"
from hotels h
         inner join rooms r on h.hotel_id = r.hotel_id
         inner join sales s on r.sale_id = s.sale_id
group by h.hotel_id
order by max(sale_percent) desc;

### 2. Đưa ra Tên Khách Sạn, Địa Chỉ Khách Sạn, Giá Phòng có loại phòng KING rẻ nhất.

select h.hotel_name as "Tên Khách Sạn", l.city as "Thành Phố", r.price as "Giá"
from hotels h
         inner join locations l on h.location_id = l.location_id
         inner join reservations r on h.hotel_id = r.hotel_id
         inner join sections s on h.hotel_id = s.hotel_id
where s.room_type = 'King'
group by h.hotel_id, price
having price = (select min(r2.price)
                from reservations r2
                         inner join sections s2 on r2.hotel_id = s2.hotel_id
                where s2.room_type = 'King');

### 3. Đưa ra Loại Phòng mà các khách hàng giới tính NAM có xu hướng đặt.

select room_type as "Loại Phòng", count(room_type) as "Số lần đặt"
from customers c
         inner join reservations r on c.customer_id = r.customer_id
         natural join sections s1
where gender = 'Nam'
group by room_type
having count(room_type) = (select count(room_type)
                           from customers c2
                                    inner join reservations r2 on c2.customer_id = r2.customer_id
                                    natural join sections s2
                           where gender = 'Nam'
                           group by room_type
                           order by count(room_type) desc
                           limit 1);

### 4. Thống kê các Loại Phòng mà các khách sạn hiện có, sắp xếp theo tổng số lượng đặt phòng giảm dần.
### Yêu cầu in ra Tên Khách Sạn, Các Loại Phòng, Tổng Số Lượng Phòng đã được đặt.

select hotel_name                       as 'Tên Khách Sạn',
       group_concat(distinct room_type) as 'Các Loại Phòng',
       count(distinct customer_id)      as 'Số Lượng Đặt Phòng'
from hotels h
         inner join sections s on h.hotel_id = s.hotel_id
         inner join reservations r on h.hotel_id = r.hotel_id
group by h.hotel_id
order by count(customer_id) desc;


### 5. Đưa ra Tên Khách Hàng sống ở Hải Phòng mà đặt phòng khách sạn ở Hà Nội. Yêu cầu đưa thêm Tên Khách Sạn đã ở.

select c.name                                                             as 'Tên Khách Hàng',
       (select city from locations where c.location_id = location_id)     as 'Địa Chỉ Khách Hàng',
       (select hotel_name from hotels where hotels.hotel_id = r.hotel_id) as 'Tên Khách Sạn'
from customers c
         inner join reservations r on c.customer_id = r.customer_id
where c.location_id = (select l1.location_id from locations l1 where city = 'Hải Phòng')
  and r.hotel_id in (select h.hotel_id
                     from hotels h
                              inner join locations l2 on h.location_id = l2.location_id
                     where city = 'Hà Nội');

### 6. Đưa ra Tên Khách Hàng, Địa Chỉ Khách Hàng, Ngày Bắt Đầu, Ngày Kết Thúc, Thời Gian
# của khách hàng đã từng ở khách sạn JW Marriott Hanoi
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

### 7. Đưa ra Số Lượng khách NAM và khách NỮ đặt phòng trong 4 tháng đầu năm 2019.

select count(case when c.gender = 'Nam' then 1 end) as 'Số Lượng Khách Nam',
       count(case when c.gender = 'Nữ' then 1 end)  as 'Số Lượng Khách Nữ'
from customers c
         inner join reservations r on c.customer_id = r.customer_id
where month(day_start) >= 01
  and month(day_start) <= 04;


### 8. Đưa ra Tên Khách Sạn, Địa Chỉ Khách Sạn, Số Lượng Đặt, Địa Chỉ Khách Hàng Từ Tỉnh Khác đến thuê.

select h.hotel_name                                                   as 'Tên Khách Sạn',
       (select city from locations where h.location_id = location_id) as 'Địa Chỉ Khách Sạn',
       count(c.customer_id)                                           as 'Số Lượng Đặt Phòng',
       group_concat(distinct (select city
                              from locations
                              where c.location_id = location_id)
                    separator ', ')                                   as 'Địa Chỉ Khách Hàng'
from hotels h
         inner join reservations r on h.hotel_id = r.hotel_id
         inner join customers c on r.customer_id = c.customer_id
where h.location_id != c.location_id
group by h.hotel_id
order by count(c.customer_id) desc;


### 9. Đưa ra Tên Khách Hàng ở Hà Nội thuê nhiều khách sạn nhất.
select name as 'Tên Khách Hàng', count(r.reservation_id) as 'Số Lượng Khách Sạn Đã Thuê'
from customers c
         inner join reservations r on c.customer_id = r.customer_id
where c.location_id = (select location_id from locations where city = 'Hà Nội')
group by r.customer_id
having count(reservation_id) = (select count(r2.reservation_id)
                                from reservations r2
                                group by r2.customer_id
                                order by count(r2.reservation_id) desc
                                limit 1);

### 10. Đưa ra Tên Tỉnh Thành, Mức Chi Tiêu Trung Bình của người dân trong mỗi tỉnh thành trên cả nước,
### sắp xếp theo thứ tự chi tiêu giảm dần.
select l.city, avg(r.price)
from locations l
         inner join customers c on l.location_id = c.location_id
         inner join reservations r on c.customer_id = r.customer_id
group by l.location_id
order by avg(r.price) desc;

### Nam's Queries

-- Câu 1: Liệt kê danh sách các phòng được khách hàng đặt nhiều lần nhất tương ứng với mỗi khách sạn trong năm 2019

select h.hotel_name             as 'Tên Khách Sạn',
       rv.room_id               as 'ID Phòng được đặt nhiều nhất trong năm 2019',
       count(rv.reservation_id) as 'Số lượt đặt phòng'
from hotels h
         natural join reservations rv
where year(rv.day_start) = '2019'
group by h.hotel_id, rv.room_id
having count(rv.reservation_id) = (select count(reservation_id)
								   from reservations
                                   where hotel_id = h.hotel_id
                                   group by room_id
                                   order by count(reservation_id) desc
                                   limit 1);

-- Câu 2: Đưa ra mức chi tiêu trung bình của khách hàng tương ứng với từng khách sạn trong năm 2019, sắp xếp theo chiều giảm dần.

select rv.hotel_id   as 'ID Khách Sạn',
       h.hotel_name  as 'Tên Khách Sạn',
       avg(rv.price) as 'Muc chi tieu trung binh cua khach san trong nam 2019 (VND)'
from reservations rv
         natural join hotels h
where year(rv.day_start) = '2019'
group by rv.hotel_id
order by avg(rv.price) desc;

-- Câu 3: Đưa ra  tên, tên khách sạn, số ngày ở lại và mức chi tiêu tương ứng của khách hàng có số ngày lưu lại tại khách sạn ở Hà Nội là lâu nhất.

select c.name                      as 'Tên Khách Hàng',
       (rv.day_end - rv.day_start) as 'Số ngày lưu lại',
       rv.price                    as 'Chi tiêu của Khách hàng'
from reservations rv
         natural join customers c
where rv.hotel_id in (select h.hotel_id
                      from hotels h
                               natural join locations l
                      where l.city = 'Hà Nội')
  and (rv.day_end - rv.day_start) = (select max(day_end - day_start)
                                     from reservations
                                     where hotel_id in (select h.hotel_id
                                                        from hotels h
                                                                 natural join locations l
                                                        where l.city = 'Hà Nội'));

-- Câu 4: Thống kê số lượt đặt phòng theo từng tháng, tổng số lượt đặt phòng của mỗi khách sạn trong năm 2019

select h.hotel_name                                           as 'Tên Khách sạn',
       count(case when month(rv.day_start) = '1' then 1 end)  as 'Tháng 1',
       count(case when month(rv.day_start) = '2' then 1 end)  as 'Tháng 2',
       count(case when month(rv.day_start) = '3' then 1 end)  as 'Tháng 3',
       count(case when month(rv.day_start) = '4' then 1 end)  as 'Tháng 4',
       count(case when month(rv.day_start) = '5' then 1 end)  as 'Tháng 5',
       count(case when month(rv.day_start) = '6' then 1 end)  as 'Tháng 6',
       count(case when month(rv.day_start) = '7' then 1 end)  as 'Tháng 7',
       count(case when month(rv.day_start) = '8' then 1 end)  as 'Tháng 8',
       count(case when month(rv.day_start) = '9' then 1 end)  as 'Tháng 9',
       count(case when month(rv.day_start) = '10' then 1 end) as 'Tháng 10',
       count(case when month(rv.day_start) = '11' then 1 end) as 'Tháng 11',
       count(case when month(rv.day_start) = '12' then 1 end) as 'Tháng 12',
       count(rv.reservation_id)                               as 'Tổng số lượng đặt phòng'
from hotels h
         natural join reservations rv
where year(rv.day_start) = '2019'
group by h.hotel_id
order by count(rv.reservation_id) desc;


-- Câu 5: Đưa ra tên khách sạn có số lượng lượt đặt phòng nhiều nhất trong tháng 12/2019

select h.hotel_name             as 'Tên Khách Sạn có số lượt đặt phòng nhiều nhất tháng 12',
       count(rv.reservation_id) as 'Số lượt đặt phòng'
from hotels h
         natural join reservations rv
where month(rv.day_start) = '12'
group by rv.hotel_id
having count(rv.reservation_id) = (select count(reservation_id)
                                   from reservations
                                   where month(day_start) = '12'
                                   group by hotel_id
                                   order by count(reservation_id) desc
                                   limit 1);

-- Câu 6: Liệt kê id các phòng ở tầng cao nhất tương ứng với mỗi khách sạn.

select h.hotel_name            as 'Tên Khách Sạn',
       group_concat(r.room_id) as 'ID Phòng',
       r.floor                 as 'Tầng'
from rooms r
         natural join hotels h
group by h.hotel_id, r.floor
having r.floor = (select max(floor)
                  from rooms
                  where hotel_id = h.hotel_id)
order by r.floor desc;


-- Câu 7: Tìm đầy đủ thông tin của phòng Đôi và có mức giảm giá nhiều nhất trong tháng 12 ở Hà Nội.

select r.room_id       as 'ID Phòng',
       h.hotel_name    as 'Tên Khách sạn',
       r.floor         as 'Tầng',
       s.room_type     as 'Loại Phòng',
       sl.sale_percent as 'Mức giảm giá',
       sl.apply_month  as 'Tháng áp dụng'
from sales sl
         natural join rooms r
         natural join sections s
         natural join hotels h
where s.room_type = 'Double'
  and r.hotel_id in (select hotels.hotel_id
                     from hotels
                              natural join locations
                     where locations.city = 'Hà Nội')
  and sl.apply_month = 12
group by r.room_id, h.hotel_name, r.floor, sl.sale_percent
having max(sl.sale_percent);

-- Câu 8: Tính mức giảm giá trung bình của mỗi khách sạn trong tháng 1

select h.hotel_name         as 'Tên Khách sạn',
       avg(sl.sale_percent) as 'Mức giảm giá trung bình tháng 1'
from rooms r
         inner join hotels h on r.hotel_id = h.hotel_id
         inner join sales sl on r.sale_id = sl.sale_id
where sl.apply_month = 1
group by h.hotel_id;

-- Câu 9: Đưa ra tổng số khách Nam, Nữ và tổng số khách đã từng đặt phòng tương ứng với mỗi khách sạn trước ngày 20/10/2019 theo thứ tự giảm dần.

select h.hotel_name                                 as 'Tên Khách sạn',
       count(case when c.gender = 'Nam' then 1 end) as 'Số khách hàng Nam',
       count(case when c.gender = 'Nữ' then 1 end)  as 'Số khách hàng Nữ',
       count(rv.customer_id)                        as 'Tổng số khách'
from reservations rv
         inner join customers c on rv.customer_id = c.customer_id
         inner join hotels h on rv.hotel_id = h.hotel_id
where rv.day_start < '2019-10-20'
group by h.hotel_id
order by count(rv.customer_id) desc;


-- Câu 10: Đưa ra thông tin đầy đủ của các phòng, tên khách sạn tương ứng có từ 2 khách hàng trở lên đặt phòng trong tháng 2 hoặc tháng 12 tại Hà Nội.

select r.room_id                                              as 'ID Phòng',
       h.hotel_name                                           as 'Tên Khách sạn',
       s.room_type                                            as 'Loại phòng',
       sl.sale_percent                                        as 'Mức giảm giá',
       count(case when month(rv.day_start) = '2' then 1 end)  as 'Số lượt đặt trong tháng 2',
       count(case when month(rv.day_start) = '12' then 1 end) as 'Số lượt đặt trong tháng 12'
from rooms r
         natural join reservations rv
         natural join hotels h
         natural join sales sl
         natural join sections s
where h.hotel_id in (select hotels.hotel_id
                     from hotels
                              natural join locations
                     where locations.city = 'Hà Nôi')
group by r.room_id, h.hotel_name, s.room_type, sl.sale_percent
having count(case when month(rv.day_start) = '2' then 1 end) >= 2
    or count(case when month(rv.day_start) = '12' then 1 end) >= 2;

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
