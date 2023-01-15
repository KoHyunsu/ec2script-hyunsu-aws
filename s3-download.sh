#!/bin/bash -xe
exec > >(sudo tee /var/log/user-data.log|sudo sh -c "logger -t user-data -s 2>/dev/console") 2>&1

aws s3 cp s3://버킷명/파일명 저장할경로 #다운로드
