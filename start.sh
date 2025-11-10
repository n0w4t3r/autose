#!/bin/bash

IMAGE_PATH=$1 #입력을 path 지정
IMAGE_NAME="input.jpg" #다운로드 받은 이미지 이름 지정

if [[ "$IMAGE_PATH" == "http"* ]]; then
    wget -O $IMAGE_NAME "$IMAGE_PATH"
    RUN_PATH=$IMAGE_NAME
else
    RUN_PATH=$IMAGE_PATH
fi

./darknet detector test cfg/coco.data cfg/yolov3.cfg yolov3.weights $RUN_PATH