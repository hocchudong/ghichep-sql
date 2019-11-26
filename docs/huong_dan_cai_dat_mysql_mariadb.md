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
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

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

- Disable các phiên bản khác của MySQL để cài MySQL 8.0
    ```
    sed -i 's/enabled=1/enabled=0/' /etc/yum.repos.d/mysql-community.repo
    ```

- Thực hiện cài đặt MySQL 8.0
    ```
    yum --enablerepo=mysql80-community install -y mysql-community-server
    ```

- Khởi động MySQL
    ```
    systemctl start mysqld 
    ```

- Trong phiên bản MySQL 8.0, mật khẩu mặc định của tài khoản `root` của MySQL nằm trong file log của MySQL. Thực hiện lệnh sau để kiểm tra mật khẩu.
    ```
    grep "A temporary password" /var/log/mysqld.log
    ```

Ta sẽ thấy thông tin mật khẩu giống như kết quả dưới (Lưu ý, đối với mỗi máy cài đặt khác nhau thì chuỗi này sẽ khác nhau)

```
[root@c7srv02 yum.repos.d]# grep "A temporary password" /var/log/mysqld.log
2019-11-25T16:09:58.389738Z 5 [Note] [MY-010454] [Server] A temporary password is generated for root@localhost: vgZ0cwDfQp=/
```

Sử dụng mật khẩu ở trên để đăng nhập vào MySQL ở bước theo.

- Thực hiện các thiết lập lần đầu sử dụng cho MySQL, thực hiện lệnh
    ```
    mysql_secure_installation
    ```

Khi được hỏi mật khẩu của tài khoản `root`, hãy nhập vào mật khẩu và làm theo các hướng dẫn tiếp theo.

```
[root@c7srv02 yum.repos.d]# mysql_secure_installation

Securing the MySQL server deployment.

Enter password for user root:
```

- Sau khi nhập mật khẩu lần đầu cài đặt, thực hiện thay đổi mật khẩu mới do người dùng chỉ định tại dòng.
    ```
    New password:

    Re-enter new password:
    ```

Lưu ý: Mật khẩu phải chứa đủ ký tự hoa, ký tự thường, số và ký tự đặc biệt.


- Thực hiện tùy chọn `Y` cho một số câu hỏi để đảm bảo các thiết lập được an toàn nhất với MySQL. Cụ thể là:
    ```
    Remove anonymous users? (Press y|Y for Yes, any other key for No) : Y

    Disallow root login remotely? (Press y|Y for Yes, any other key for No) : Y

    Remove test database and access to it? (Press y|Y for Yes, any other key for No) : Y

    Reload privilege tables now? (Press y|Y for Yes, any other key for No) : Y
    ```

- Thực hiện restart MySQL
    ```
    systemctl restart mysqld
    ```

- Khởi động MySQL cùng OS.
    ```
    systemctl enable mysqld
    ```

- Kiểm tra lại dịch vụ MySQL xem đã hoạt động hay chưa bằng lệnh `systemctl status mysqld`. Kết quả ta sẽ có như bên dưới.
    ```
    [root@c7srv02 yum.repos.d]# systemctl status mysqld
    ● mysqld.service - MySQL Server
    Loaded: loaded (/usr/lib/systemd/system/mysqld.service; enabled; vendor preset: disabled)
    Active: active (running) since Mon 2019-11-25 23:30:16 +07; 8s ago
        Docs: man:mysqld(8)
            http://dev.mysql.com/doc/refman/en/using-systemd.html
    Main PID: 59734 (mysqld)
    Status: "Server is operational"
    CGroup: /system.slice/mysqld.service
            └─59734 /usr/sbin/mysqld

    Nov 25 23:30:15 c7srv02 systemd[1]: Starting MySQL Server...
    Nov 25 23:30:16 c7srv02 systemd[1]: Started MySQL Server.
    ```

- Đăng nhập thử vào MySQL
    ```
    mysql -u root -p
    ```

Nhập mật khẩu vừa thiết lập ở trên, ta sẽ có màn hình CLI của MySQL như sau:

    ```
    [root@c7srv02 yum.repos.d]# mysql -u root -p
    Enter password:
    Welcome to the MySQL monitor.  Commands end with ; or \g.
    Your MySQL connection id is 8
    Server version: 8.0.18 MySQL Community Server - GPL

    Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

    Oracle is a registered trademark of Oracle Corporation and/or its
    affiliates. Other names may be trademarks of their respective
    owners.

    Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

    mysql>
    ```

- Thực hiện lệnh để kiểm tra các database
    ```
    show databases;
    ```

Kết quả là

    ```
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | performance_schema |
    | sys                |
    +--------------------+
    4 rows in set (0.00 sec)
    ```

Khi cần đứng từ máy khác kết nối với MySQL trên server, ta thực hiện thêm bước cấp quyền cho tài khoản root bằng lệnh sau.

- Đăng nhập vào MySQL
    ```
    mysql -u root -p
    ```

- Phân quyền cho tài khoản `root` của MySQL để có thể truy cập từ xa
    ```
    CREATE USER 'root'@'%' IDENTIFIED BY 'Welcome123+';
    GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
    ```

- Mở firewall để cho phép các máy ở xa kết nối tới MySQL
    ```
    firewall-cmd --add-service=mysql --permanent
    firewall-cmd --reload
    ```

Kết nối tới MySQL bằng các công cụ như: HeidiSQL, Navicat, MySQL Workbench.

![HeidiSQL](https://image.prntscr.com/image/Z8GyVYg4T4G-MK06h5yCLQ.png)

![HeidiSQL](https://image.prntscr.com/image/8TRoRkD5RCur08Sa46UofQ.png)

