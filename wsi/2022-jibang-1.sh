#!/bin/bash -xe
# /var/log/user-data.log에 에러를 기록하겠다
exec > >(sudo tee /var/log/user-data.log|sudo sh -c "logger -t user-data -s 2>/dev/console") 2>&1

# 설치 전에 우선 업데이트부터 하겠다
sudo yum update -y

# Apache(httpd) 설치하겠다
sudo yum install httpd -y

# Apache(httpd) 시작하겠다
sudo service httpd start
sudo chkconfig httpd on

# /var/www/html 위치로 이동
cd /var/www/html

# 기본 페이지(index.html) 만들겠다
sudo echo "this is index.html" > index.html
