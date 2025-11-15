# Tutorial on cmake 

## Make
A make file tells dependencies and steps. If one of the dependences change the output is then redone.

Only the steps whose depdencies have changed are redone. So saves time.

Using **make** is equivalent to **make all**

*Cmake automates the creation of make files which them automates compilation of files.*

So Cmake is like a second level of automation.

## CMake
1. You must use file named **CMakeLists.txt**
2. Run CMake to create Makefile.
3. Build your project using Make.

### Out of scource builds in CMake
Make files are in the same directory as source code.
Cmake gereates makefiels in **different directories**.
Also the build files are kept seperate.

### How to use CMake
```bash
mkdir build
cmake ..
make
```