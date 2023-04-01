# https://github.com/awslabs/aws-lambda-cpp を使うためには
# CMake のバージョン 3.9 以降が必要
cmake_minimum_required(VERSION 3.9)

project(aws-sam-cpp-sample LANGUAGES CXX)

find_package(aws-lambda-runtime)

add_executable(${PROJECT_NAME}
  main.cpp
)
target_link_libraries(${PROJECT_NAME}
  PRIVATE AWS::aws-lambda-runtime
)

# コンパイラのオプションを指定
target_compile_options(${PROJECT_NAME} PRIVATE -O2 -Wall -Wextra)

# C++11 の機能を有効化
target_compile_features(${PROJECT_NAME} PRIVATE cxx_std_11)

# コンパイラによる拡張を無効化
set_target_properties(${PROJECT_NAME} PROPERTIES CXX_EXTENSIONS OFF)

# AWS Lambda デプロイパッケージを作成
aws_lambda_package_target(${PROJECT_NAME})
