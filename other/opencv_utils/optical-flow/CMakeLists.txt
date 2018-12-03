cmake_minimum_required(VERSION 2.8)

project(optical_flow)

find_package(OpenCV REQUIRED)

include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(optical_flow opflow.cpp)

target_link_libraries(optical_flow ${OpenCV_LIBS})
