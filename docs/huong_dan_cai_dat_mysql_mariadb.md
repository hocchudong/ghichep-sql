# Hướng dẫn cài đặt MySQL 

Tài liệu hướng dẫn cài đặt MySQL, MariaDB để thực hành SQL. Do vậy, các khai báo chỉ đủ các bước để bạn có thể sử dụng MySQl hoặc MariaDB để thực hành về SQL nói chung.

## 1. Cài đặt MySQL 5.x trên CentOS 7

- Thực hiện cập nhật OS và cài đặt các gói phần mềm bổ trợ
    ```
    yum update -y 

    yum install -y wget byobu yum-utils git

    yum install -y epel-release
    ```

- Khai báo repos của MySQL cho CentOS 
    ```
    wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
    sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
    yum update -y
    ```

 - Cài đặt MySQL
    ```
    sudo yum install -y mysql-server
    ```  

- Khởi động MySQL
    ```
    sudo systemctl start mysqld
    sudo systemctl enable mysqld
    ```

- Kiểm tra phiên bản của MySQL 
    ```
    mysql -V
    ```
- Ta sẽ có kết quả
    ```
    mysql  Ver 14.14 Distrib 5.6.46, for Linux (x86_64) using  EditLine wrapper
    ```

Thực hiện khai báo mật khẩu lần đầu tiên cho MySQL.

Chạy lệnh được tích hợp sẵn `sudo mysql_secure_installation` để thiết lập mật khẩu lần đầu đăng nhập đối với MySQL. Ta sẽ làm theo các hướng dẫn.

- Tại dòng `Enter current password for root (enter for none)` ấn `Enter` (mật khẩu trống) để chuyển sang bước tiếp vì ngay từ đầu MySQL không có mật khẩu để truy cập.

-  Tại dòng `Set root password? [Y/n]` lựa chọn `Y` để bắt đầu nhập mật khẩu cho tài khoản `root` của MySQL.

- Tài dòng `New password:` và `Re-enter new password` tiến hành nhập mật khẩu. Hãy ghi nhớ mật khẩu này để dùng cho các bước tiếp. Sau khi thực hiện ta sẽ có kết quả như bên dưới là thành công
    ```
    Password updated successfully!
    Reloading privilege tables..
    ... Success!
    ```
- Tại dòng `Remove anonymous users? [Y/n]` lựa chọn phím `Y` để xóa tài khoản vô danh được cung cấp mặc định ngay khi cài MySQL.

- Tại dòng `Disallow root login remotely? [Y/n]` lựa chọn phím `Y` để vô hiệu hóa tính năng cho phép truy cập MySQL với tài khoản `root` từ xa (Từ các máy khác thông qua công cụ hoặc mysql client).

- Tại dòng `Remove test database and access to it? [Y/n]` lựa chọn `Y` để xóa database có tên là `test` được sinh ra từ ban đâu.

- Tại dòng `Reload privilege tables now? [Y/n]` lựa chọn `Y` để khởi động lại MySQL nhằm áp các cấu hình ở các bước trên xuống. Kết quả màn hình sẽ là:
    ```
    All done!  If you've completed all of the above steps, your MySQL
    installation should now be secure.

    Thanks for using MySQL!

    Cleaning up...
    ```

- Sau khi thiết lập xong, thực hiện đăng nhập vào MySQL thông qua lệnh ` mysql -u root -p`
    ```
    [root@c7srv02 ~]# mysql -u root -p
    Enter password:
    ```
Ở màn hình trên, nhập mật khẩu vừa thiết lập lúc trước vào để sử dụng.

- Nếu nhập đúng mật khẩu, ta sẽ có kết quả thông báo như bên dưới và bắt đầu ở chế độ làm việc với MySQL.
    ```
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 15
    Server version: 5.6.46 MySQL Community Server (GPL)

    Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql>
    ```
- Thực hiện truy vấn sql cơ bản.
    ```
    +-----------+------+-------------------------------------------+
    | host      | user | password                                  |
    +-----------+------+-------------------------------------------+
    | localhost | root | *B4B1E6BC13CBA73BC4C2B05F6F1393D16F2EE840 |
    | 127.0.0.1 | root | *B4B1E6BC13CBA73BC4C2B05F6F1393D16F2EE840 |
    | ::1       | root | *B4B1E6BC13CBA73BC4C2B05F6F1393D16F2EE840 |
    | %         | root |                                           |
    +-----------+------+-------------------------------------------+
    4 rows in set (0.00 sec)
    ```

Tới đây, bạn đã có thể truy cập trực tiếp vào MySQL trên máy đó. Đối với trường hợp bạn cần dùng các công cụ như: `Navicat, MySQL Workbench, HeideSQL` hoặc kết nối tới MySQL từ một máy khác thì bạn cần phân quyền việc này. *Lưu ý*, việc phân quyền này cần làm cẩn thận và hạn chế khi làm ở các hệ thống thật vì lý do bảo mật.

- Thực hiện phân quyền cho tài khoản `root` của MySQL có thể đăng nhập từ hệ thống khác.

```
grant all privileges on *. * to 'root'@'%';

FLUSH PRIVILEGES;
```



## 2. Cài đặt MariaDB 10.x trên CentOS 7

## 3. Cài đặt MySQL 8.x trên CentOS 7

- Thực hiện cập nhật OS và cài đặt các gói phần mềm bổ trợ
    ```
    yum update -y 

    yum install -y wget byobu yum-utils git

    yum install -y epel-release
    ```

- Khai báo repos cho MySQL 8.x
    ```
    rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-3.noarch.rpm
    ```
