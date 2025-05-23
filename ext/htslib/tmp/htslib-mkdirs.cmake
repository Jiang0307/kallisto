# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/user/Desktop/Test/kallisto/ext/htslib"
  "/home/user/Desktop/Test/kallisto/ext/htslib/src/htslib-build"
  "/home/user/Desktop/Test/kallisto/ext/htslib"
  "/home/user/Desktop/Test/kallisto/ext/htslib/tmp"
  "/home/user/Desktop/Test/kallisto/ext/htslib/src/htslib-stamp"
  "/home/user/Desktop/Test/kallisto/ext/htslib/src"
  "/home/user/Desktop/Test/kallisto/ext/htslib/src/htslib-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/user/Desktop/Test/kallisto/ext/htslib/src/htslib-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/user/Desktop/Test/kallisto/ext/htslib/src/htslib-stamp${cfgdir}") # cfgdir has leading slash
endif()
