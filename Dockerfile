FROM --platform=linux/arm64 amazonlinux:2

RUN yum update
RUN yum -y install tar git make zip gcc-c++ libcurl-devel 

# CMake 3.26.2 をインストール
RUN curl -L https://github.com/Kitware/CMake/releases/download/v3.26.2/cmake-3.26.2-linux-aarch64.tar.gz \
  | tar -zxC .
ENV PATH $PATH:/cmake-3.26.2-linux-aarch64/bin

# AWS Lambda 用の C++ Runtime をインストール
RUN git clone https://github.com/awslabs/aws-lambda-cpp.git
WORKDIR /aws-lambda-cpp/build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/lambda-install
RUN make && make install
