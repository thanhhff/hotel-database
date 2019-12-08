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

## 2. Create Database
-  [Create Tables](https://github.com/thanhhff/hotel-database/blob/master/project_create_table.sql)
    - Locations
    - Hotels
    - Sections
    - Sales
    - Rooms  
    - Customers
    - Reservations
  
- [Insert data into tables](https://github.com/thanhhff/hotel-database/blob/master/project_insert.sql)

## 3. Queries

- **Thanh's Queries**

1)  Đưa ra **Tên Khách Sạn**, **Tháng** mà khách sạn đó có `sale_percent` lớn nhất.
2)  Đưa ra  **Tên Khách Sạn**, **Địa Chỉ Khách Sạn** có loại phòng `KING` rẻ nhất.
3)  Đưa ra **Loại Phòng** mà các khách hàng giới tính `NAM` có xu hướng đặt.
4) Thống kê các **Loại Phòng** mà các khách sạn hiện có.
5) Đưa ra **Tên Khách Hàng** sống ở Hồ Chí Minh mà đặt phòng khách sạn ở Hà Nội.
6) Đưa ra **Tên Khách Hàng** đã từng ở khách sạn JW Marriott Hanoi.
7) Đưa ra **Số Lượng** khách `NAM` và khách `NỮ` đặt phòng trong tháng 1.
8) Đưa ra **Tên Khách Sạn**, **Số Lượng Khách Hàng Từ Tỉnh Khác** đến thuê.
9) Đưa ra **Tên Khách Hàng** ở Hà Nội thuê nhiều khách sạn nhất.
10) Đưa ra **Tên Tỉnh Thành**, **Mức Chi Tiêu Trung Bình** của người dân trong mỗi tỉnh thành trên cả nước.



- **Quang's Queries**

1)	Lấy ra tên khách sạn, địa điểm khách sạn có loại phòng ‘president’ đc đặt nhiều nhất
2)	Thống kê số lượng các khách sạn ở mỗi tỉnh
3)	Kể id phòng đc thuê nhiều nhất tại khách sạn ‘Royal Hotel’ trong năm 2019
4)	Tên khách hàng, Tên ks, id phòng giá rẻ nhất mà khách đã đặt trong trường hợp ng này chỉ ở 3 ngày
5)	Liệt kê các phòng đôi ở tầng 4 của khách sạn ‘Tan Son Nhat Hotel’
6)	Tỉnh nào có nhiều người đặt phòng nhất trong tháng 6
7)	Thống kê doanh thu các khách sạn
8)	Liệt kê những khách sạn mà Lưu Việt Tùng đã ở trong tháng 3/2019
9)	Khách có xu hướng ở tầng mấy nhất.
10)	Liệt kê các khách hàng trong năm 2019 đã ở hơn 3 tỉnh khác nhau


- **Nam's Queries**
1)  Liệt kê số phòng được đặt nhiều nhất của từng khách sạn.
2)  Tính mức chi tiêu trung bình của khách hàng ở mỗi khách sạn.
3)  Tìm tên, mức chi tiêu, số ngày ở của khách hàng có số ngày lưu lại tại khách sạn ở Hà Nội là lâu nhất.
4)  Đưa ra doanh thu của từng khách sạn tại Hà Nội tương ứng với từng tỉnh thành.
5)  Đưa ra tên khách sạn có số lượng lượt đặt phòng nhiều nhất trong tháng 12/2019
6)  Tìm ra room_id, floor, tên khách sạn của phòng được khách hàng đặt ở tầng cao nhất.
7)  Tìm phòng Đôi và có mức giảm giá nhiều nhất trong tháng 12 ở TP Hồ Chí Minh.
8)  Tính mức giảm giá trung bình của mỗi khách sạn trong tháng 10
9)  Đưa ra tổng số khách Nam, Nữ đã từng đặt phòng tương ứng với mỗi khách sạn.
10) Đưa ra thông tin đầy đủ của các phòng, tên khách sạn tương ứng có từ 2 khách hàng trở lên đặt phòng trong tháng 2 hoặc tháng 12 tại Hà Nội.
