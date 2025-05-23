# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/user/Desktop/Test/kallisto/ext/bifrost"
  "/home/user/Desktop/Test/kallisto/ext/bifrost/src/bifrost-build"
  "/home/user/Desktop/Test/kallisto/ext/bifrost"
  "/home/user/Desktop/Test/kallisto/ext/bifrost/tmp"
  "/home/user/Desktop/Test/kallisto/ext/bifrost/src/bifrost-stamp"
  "/home/user/Desktop/Test/kallisto/ext/bifrost/src"
  "/home/user/Desktop/Test/kallisto/ext/bifrost/src/bifrost-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/user/Desktop/Test/kallisto/ext/bifrost/src/bifrost-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/user/Desktop/Test/kallisto/ext/bifrost/src/bifrost-stamp${cfgdir}") # cfgdir has leading slash
endif()
