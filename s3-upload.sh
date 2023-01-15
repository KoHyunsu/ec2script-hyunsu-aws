#!/bin/bash -xe
exec > >(sudo tee /var/log/user-data.log|sudo sh -c "logger -t user-data -s 2>/dev/console") 2>&1

echo "파일내용" > 파일명 #파일생성
aws s3 cp 파일명 s3://버킷명/파일명 #업로드
