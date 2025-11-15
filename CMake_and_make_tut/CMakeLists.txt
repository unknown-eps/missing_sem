cmake_minimum_required(VERSION 3.10)

# Set the project name
project(MainProject)

# Set C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Set compiler to g++
set(CMAKE_CXX_COMPILER g++)

# Set optimization level to O3
set(CMAKE_CXX_FLAGS_RELEASE "-O3")
set(CMAKE_BUILD_TYPE Release)

# Add the executable with custom name
add_executable(main.out main.cpp func.cpp)

# Link math library (required for sqrt and pow functions)
target_link_libraries(main.out m)