# Installation

* In Ubuntu
```shell
rm -rf build
mkdir build
cd build
cmake -DUSE_BAM=ON -DUSE_HDF5=ON ..
make
sudo make install
```
