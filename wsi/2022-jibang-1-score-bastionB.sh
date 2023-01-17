#!/bin/bash

echo -e "\033[33mBastion_B에서 채점을 진행하는지 확인해주세요.\033[0m"
echo -e "\n"

echo -e "\033[33mService_B의 프라이빗 IP 주소를 입력해주세요.\033[0m"
read service_b_ip

echo -e "\n"

echo -e "\033[33m키 페어 이름을 입력해주세요.(~.pem)\033[0m"
read key_pair

echo -e "\n"

echo -e "\033[32m":::80 listen이 표시되는지 확인하겠습니다."\033[0m"
ssh -i "${key_pair}" ec2-user@${service_b_ip} netstat -ntl | grep ":::80"

echo -e "\n"

echo -e "\033[32m"200 OK가 표시되는지 확인하겠습니다."\033[0m"
ssh -i "${key_pair}" ec2-user@${service_b_ip} curl -i localhost | grep "200"
