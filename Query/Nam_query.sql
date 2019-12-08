-- Câu 1: Liệt kê danh sách các phòng được khách hàng đặt nhiều lần nhất tương ứng với mỗi khách sạn trong năm 2019

select h.hotel_name             as 'Tên Khách Sạn',
       group_concat(rv.room_id) as 'ID Phòng được đặt nhiều nhất trong năm 2019'
from hotels h
         natural join reservations rv
group by h.hotel_id, rv.room_id
having rv.room_id in (select room_id
                      from reservations
                      where hotel_id = h.hotel_id
                      group by room_id
                      having count(reservation_id) = (select count(reservation_id)
                                                      from reservations
                                                      where hotel_id = h.hotel_id
                                                      group by room_id
                                                      order by count(reservation_id) desc
                                                      limit 1));

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


-- Câu 4: Đưa ra doanh thu của từng khách sạn tại Hà Nội tương ứng với từng tỉnh thành.

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

-- Câu 6: Đưa ra room_id, floor, tên khách sạn của phòng được khách hàng đặt ở tầng cao nhất.

select r.room_id    as 'ID Phòng',
       r.floor      as 'Tầng',
       h.hotel_name as 'Tên Khách Sạn'
from rooms r
         natural join reservations rv
         natural join hotels h
where


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
group by r.room_id
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
group by r.room_id
having count(case when month(rv.day_start) = '2' then 1 end) >= 2
    or count(case when month(rv.day_start) = '12' then 1 end) >= 2;
