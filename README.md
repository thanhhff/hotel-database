# Hotel Reservation Database Lab Project
[![Hotel Reservation Version](https://img.shields.io/visual-studio-marketplace/v/swellaby.rust-pack?color=1&label=Hotel%20Reservation%20Version&logo=1&logoColor=1)](https://img.shields.io/visual-studio-marketplace/v/swellaby.rust-pack?color=1&label=Hotel%20Reservation%20Version&logo=1&logoColor=1)

The main highlight of this Hotel Reservation is the `project_create_table.sql` and `project_insert.sql` resources for managing databases and database data. Providers for MySQL. See usage documentation below.

## 1. Introduction 
- **Members**

| |Full Name|Student ID|
|:--:|:--|:--:|
| 1 | [Kieu Dang Nam](https://github.com/dangnam739) | 20176830 |
| 2 | [Le Minh Quang](https://github.com/lequang-hp) | 20176856 |
| 3 | [Nguyen Trung Thanh](https://github.com/thanhhff) | 20176874 |

- **Database Name**: Hotel Reservation 

- **Database Diagram** 

![alt text](Diagram/project_diagram_v3.png)

- **Advantages**
    - Help you to built a Holtel Booking System.
    - Manage hotel reservations.
    - Gather information about hotel reservation need.
    - Recommend strategy of development of Hotel.
- **Disadvantages**
    - Simple database.
## 2. Create Database
-  [**Create Tables**](https://github.com/thanhhff/hotel-database/blob/master/project_create_table.sql)
    - Locations: address of city in Vietnam.
    - Hotels: hotel in Vietnam.
    - Sections: types of room in a hotel.
    - Sales: discounts on hotel rooms.
    - Rooms: rooms in the hotel.
    - Customers: customer information.
    - Reservations: booking list.
  
- [**Insert data into tables**](https://github.com/thanhhff/hotel-database/blob/master/project_insert.sql)

## 3. Queries

- [**Thanh's Queries**](https://github.com/thanhhff/hotel-database/blob/master/Query/Thanh_query.sql)

- [x] 1. Đưa ra Tên Khách Sạn, Tháng, % Sale mà khách sạn đó có sale_percent lớn nhất, sắp xếp theo thứ tự giảm dần sale_percent.
- [x] 2. Đưa ra Tên Khách Sạn, Địa Chỉ Khách Sạn, Giá Phòng có loại phòng KING rẻ nhất.
- [x] 3. Đưa ra Loại Phòng mà các khách hàng giới tính NAM có xu hướng đặt.
- [x] 4. Thống kê các Loại Phòng mà các khách sạn hiện có, sắp xếp theo tổng số lượng đặt phòng giảm dần. Yêu cầu in ra Tên Khách Sạn, Các Loại Phòng, Tổng Số Lượng Phòng đã được đặt.
- [x] 5. Đưa ra Tên Khách Hàng sống ở Hải Phòng mà đặt phòng khách sạn ở Hà Nội. Yêu cầu đưa thêm Tên Khách Sạn đã ở.
- [x] 6. Đưa ra Tên Khách Hàng, Địa Chỉ Khách Hàng, Ngày Bắt Đầu, Ngày Kết Thúc, Thời Gian của khách hàng đã từng ở khách sạn JW Marriott Hanoi trong khoảng thời gian từ đầu tháng 01 / 2019 đến hết tháng 5 / 2019.
- [x] 7. Đưa ra Số Lượng khách NAM và khách NỮ đặt phòng trong 4 tháng đầu năm 2019.
- [x] 8. Đưa ra Tên Khách Sạn, Địa Chỉ Khách Sạn, Số Lượng Đặt, Địa Chỉ Khách Hàng Từ Tỉnh Khác đến thuê.
- [x] 9. Đưa ra Tên Khách Hàng ở Hà Nội thuê nhiều khách sạn nhất.
- [x] 10. Đưa ra Tên Tỉnh Thành, Mức Chi Tiêu Trung Bình của người dân trong mỗi tỉnh thành trên cả nước, sắp xếp theo thứ tự chi tiêu giảm dần.

- [**Quang's Queries**](https://github.com/thanhhff/hotel-database/blob/master/Query/Quang_query.sql)

- [x] 1.	Lấy ra tên khách sạn, địa điểm khách sạn có loại phòng ‘president’ đc đặt nhiều nhất
- [x] 2.	Thống kê số lượng các khách sạn ở mỗi tỉnh
- [x] 3.	Kể id phòng đc thuê nhiều nhất tại khách sạn ‘Royal Hotel’ trong năm 2019
- [x] 4.	Tên khách hàng, Tên ks, id phòng giá rẻ nhất mà khách đã đặt trong trường hợp ng này chỉ ở 3 ngày
- [x] 5.	Liệt kê các phòng đôi ở tầng 5 của khách sạn ‘Royal Hotel’
- [x] 6.	Tỉnh nào có nhiều người đặt phòng nhất trong tháng 6
- [x] 7.	Thống kê doanh thu các khách sạn trong 2019 theo chiều giảm dần
- [x] 8.	Liệt kê những khách sạn mà Lưu Việt Tùng đã ở trong 2019
- [x] 9.	Khách có xu hướng ở tầng mấy nhất.
- [x] 10.	Liệt kê các khách hàng trong năm 2019 đã ở hơn 3 tỉnh khác nhau


- [**Nam's Queries**](https://github.com/thanhhff/hotel-database/blob/master/Query/Nam_query.sql)
- [x] 1.  Liệt kê số phòng được đặt nhiều nhất của từng khách sạn.
- [x] 2.  Đưa ra mức chi tiêu trung bình của khách hàng tương ứng với từng khách sạn trong năm 2019, sắp xếp theo chiều giảm dần.
- [x] 3.  Đưa ra  tên, tên khách sạn, số ngày ở lại và mức chi tiêu tương ứng của khách hàng có số ngày lưu lại tại khách sạn ở Hà Nội là lâu nhất.
- [x] 4.  Thống kê số lượt đặt phòng theo từng tháng, tổng số lượt đặt phòng của mỗi khách sạn trong năm 2019.
- [x] 5.  Đưa ra tên khách sạn có số lượng lượt đặt phòng nhiều nhất trong tháng 12/2019
- [x] 6.  Đưa ra danh sách các phòng ở tầng cao nhất của mỗi khách sạn.
- [x] 7.  Đưa ra đầy đủ thông tin của phòng có loại 'Double' và có mức giảm giá nhiều nhất trong tháng 12 ở Hà Nội.
- [x] 8.  Tính mức giảm giá trung bình của mỗi khách sạn trong tháng 1.
- [x] 9.  Đưa ra tổng số khách Nam, Nữ và tổng số khách đã từng đặt phòng tương ứng với mỗi khách sạn trước ngày 20/10/2019 theo thứ tự giảm dần.
- [x] 10. Đưa ra thông tin đầy đủ của các phòng, tên khách sạn tương ứng có từ 2 khách hàng trở lên đặt phòng trong tháng 2 hoặc tháng 12 tại Hà Nội.
