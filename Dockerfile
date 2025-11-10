FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 필요 패키지 설치
RUN apt-get update && apt-get install -y \
    tzdata \
    git \
    make \
    g++ \
    gcc \
    wget \
    libopencv-dev \
    && rm -rf /var/lib/apt/lists/*
    
# Darknet 클론
RUN git clone https://github.com/pjreddie/darknet

# Darknet 이동
WORKDIR darknet

RUN make

# weights 다운
RUN wget https://data.pjreddie.com/files/yolov3.weights

# 시작 스크립트 복사
COPY start.sh .

# 시작 스크립트 x 권한 부여
RUN chmod +x start.sh

# entrypoint를 시작 스크립트로 설정
ENTRYPOINT ["./start.sh"]