# Install script for directory: /home/u07khl00/src/picongpu/include/mpiInfo

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/u07khl00/work/picInputs/HiPAC_two_stream_C_parallel_quiz")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mpiInfo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mpiInfo")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mpiInfo"
         RPATH "\$ORIGIN:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/boost-1.83.0-e4yvxdj6nsl62qg2fechu3cfgspgktj3/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/openmpi-4.1.6-byplx62t4awwqwpl6nyiq6g43gxubw54/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/u07khl00/work/picInputs/HiPAC_two_stream_C_parallel_quiz/.build/build_mpiInfo/mpiInfo")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mpiInfo" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mpiInfo")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mpiInfo"
         OLD_RPATH "/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/boost-1.83.0-e4yvxdj6nsl62qg2fechu3cfgspgktj3/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/openmpi-4.1.6-byplx62t4awwqwpl6nyiq6g43gxubw54/lib::::::::"
         NEW_RPATH "\$ORIGIN:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/boost-1.83.0-e4yvxdj6nsl62qg2fechu3cfgspgktj3/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/openmpi-4.1.6-byplx62t4awwqwpl6nyiq6g43gxubw54/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/mpiInfo")
    endif()
  endif()
endif()

