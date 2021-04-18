#!/bin/bash

aws cloudformation create-stack --stack-name s3proxy \
    --region ap-northeast-1 \
    --template-body file://template.yml
