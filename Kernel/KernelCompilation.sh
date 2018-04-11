#!/bin/bash

# Download the kernel file (.tar file) from kernel.org
wget https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.16.1.tar.xz

# Extract the .tar kernel file
tar -xvf linux-4.16.1.tar.xz

cd linux-4.16.1.tar.xz

sudo make nconfig
# Save the config file as .config

make -j4

make modules_install

make install
