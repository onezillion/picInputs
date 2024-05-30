# Install script for directory: /home/u07khl00/src/picongpu/include/picongpu

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/u07khl00/work/picInputs/HiPAC_two_stream_A_std_quiz")
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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/u07khl00/work/picInputs/HiPAC_two_stream_A_std_quiz/.build/alpaka/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/u07khl00/work/picInputs/HiPAC_two_stream_A_std_quiz/.build/build_cuda_memtest/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/u07khl00/work/picInputs/HiPAC_two_stream_A_std_quiz/.build/build_mpiInfo/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/u07khl00/work/picInputs/HiPAC_two_stream_A_std_quiz/.build/build_nlohmann_json/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/picongpu" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/picongpu")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/picongpu"
         RPATH "\$ORIGIN:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/libpng-1.6.39-qumumjbtnaszb4t7xf2qky7jdbtusn7i/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/zlib-ng-2.1.4-nlxqq2kdvg2y2lqbkguwyslryqcgu525/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/freetype-2.11.1-7t2iwelyxrgtaennpetvbb4cunc2t5yt/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/openpmd-api-0.15.2-gfpc2jgatxy2whupnxa72b7usxvysq4i/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/adios2-2.9.2-2uvreyghxwxnxiybb6nvx7dm7xpb4mcb/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/hdf5-1.14.3-rkvrrpj4c67xbieqxga55hsfcb2zlc7e/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/boost-1.83.0-e4yvxdj6nsl62qg2fechu3cfgspgktj3/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/openmpi-4.1.6-byplx62t4awwqwpl6nyiq6g43gxubw54/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/cuda-12.2.1-cz65hwkkzh5aeky4k5jyjpb6e2dpfg6r/lib64:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/fftw-3.3.10-cnkz7kuvymxcag3r5nmvlnrkvtb2liep/lib")
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE EXECUTABLE FILES "/home/u07khl00/work/picInputs/HiPAC_two_stream_A_std_quiz/.build/picongpu")
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/picongpu" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/picongpu")
    file(RPATH_CHANGE
         FILE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/picongpu"
         OLD_RPATH "/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/libpng-1.6.39-qumumjbtnaszb4t7xf2qky7jdbtusn7i/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/zlib-ng-2.1.4-nlxqq2kdvg2y2lqbkguwyslryqcgu525/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/freetype-2.11.1-7t2iwelyxrgtaennpetvbb4cunc2t5yt/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/openpmd-api-0.15.2-gfpc2jgatxy2whupnxa72b7usxvysq4i/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/adios2-2.9.2-2uvreyghxwxnxiybb6nvx7dm7xpb4mcb/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/hdf5-1.14.3-rkvrrpj4c67xbieqxga55hsfcb2zlc7e/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/boost-1.83.0-e4yvxdj6nsl62qg2fechu3cfgspgktj3/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/openmpi-4.1.6-byplx62t4awwqwpl6nyiq6g43gxubw54/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/cuda-12.2.1-cz65hwkkzh5aeky4k5jyjpb6e2dpfg6r/lib64:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/fftw-3.3.10-cnkz7kuvymxcag3r5nmvlnrkvtb2liep/lib::::::::"
         NEW_RPATH "\$ORIGIN:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/libpng-1.6.39-qumumjbtnaszb4t7xf2qky7jdbtusn7i/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/zlib-ng-2.1.4-nlxqq2kdvg2y2lqbkguwyslryqcgu525/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/freetype-2.11.1-7t2iwelyxrgtaennpetvbb4cunc2t5yt/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/openpmd-api-0.15.2-gfpc2jgatxy2whupnxa72b7usxvysq4i/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/adios2-2.9.2-2uvreyghxwxnxiybb6nvx7dm7xpb4mcb/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/hdf5-1.14.3-rkvrrpj4c67xbieqxga55hsfcb2zlc7e/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/boost-1.83.0-e4yvxdj6nsl62qg2fechu3cfgspgktj3/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/openmpi-4.1.6-byplx62t4awwqwpl6nyiq6g43gxubw54/lib:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/cuda-12.2.1-cz65hwkkzh5aeky4k5jyjpb6e2dpfg6r/lib64:/home/u07khl00/spack/opt/spack/linux-ubuntu22.04-skylake_avx512/gcc-12.3.0/fftw-3.3.10-cnkz7kuvymxcag3r5nmvlnrkvtb2liep/lib")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/bin/picongpu")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE DIRECTORY FILES "/home/u07khl00/src/picongpu/include/picongpu/../../bin/" FILES_MATCHING REGEX "/[^/]*$" PERMISSIONS OWNER_EXECUTE OWNER_READ OWNER_WRITE GROUP_READ GROUP_EXECUTE REGEX "/\\.svn$" EXCLUDE)
endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/u07khl00/work/picInputs/HiPAC_two_stream_A_std_quiz/.build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
