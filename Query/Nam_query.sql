-- Câu 1: Liệt kê danh sách các phòng được khách hàng đặt nhiều lần nhất tương ứng với mỗi khách sạn trong năm 2019
 
select  h.hotel_name as 'Tên Khách Sạn', 
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

select rv.hotel_id as 'ID Khách Sạn',
	   h.hotel_name as 'Tên Khách Sạn',
       avg(rv.price) as 'Muc chi tieu trung binh cua khach san trong nam 2019 (VND)'
from reservations rv
	natural join hotels h
where year(rv.day_start) = '2019'
group by rv.hotel_id
order by avg(rv.price) desc;

-- Câu 3: Đưa ra  tên, tên khách sạn, số ngày ở lại và mức chi tiêu tương ứng của khách hàng có số ngày lưu lại tại khách sạn ở Hà Nội là lâu nhất.

select c.name as 'Tên Khách Hàng',
	   (rv.day_end - rv.day_start) as 'Số ngày lưu lại',
	   rv.price as 'Chi tiêu của Khách hàng'	   
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

select h.hotel_name as 'Tên Khách Sạn có số lượt đặt phòng nhiều nhất tháng 12',
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

select r.room_id as 'ID Phòng',
	   r.floor as 'Tầng',
       h.hotel_name as 'Tên Khách Sạn'
from rooms r
	natural join reservations rv
    natural join hotels h
where 


-- Câu 7: Tìm đầy đủ thông tin của phòng Đôi và có mức giảm giá nhiều nhất trong tháng 12 ở Hà Nội.

select r.room_id as 'ID Phòng',
		h.hotel_name as 'Tên Khách sạn',
        r.floor as 'Tầng',
		s.room_type as 'Loại Phòng',
		sl.sale_percent as 'Mức giảm giá',
        sl.apply_month as 'Tháng áp dụng'
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
                        
     
