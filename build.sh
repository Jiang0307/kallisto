rm -rf Build
mkdir Build
cd Build
cmake -DUSE_BAM=ON -DUSE_HDF5=ON ..
make
sudo make install