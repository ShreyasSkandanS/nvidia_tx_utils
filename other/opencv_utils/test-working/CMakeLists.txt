cmake_minimum_required (VERSION 2.8)

project(helloworld)

find_package(OpenCV REQUIRED)

include_directories(${OpenCV_INCLUDE_DIRS})

add_executable(cv_hello helloworld.cpp)

target_link_libraries(cv_hello ${OpenCV_LIBS})
