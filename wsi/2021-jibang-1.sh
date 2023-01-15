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

# s3로부터 v1.tar 다운로드
aws s3 cp s3://skills-hyunsu99/web/v1.tar .

# tar 파일 압축해제
tar -xvf v1.tar

# tar 파일 삭제
sudo rm v1.tar

# 압축 푼 파일 위치 이동
sudo mv v1/* ./
