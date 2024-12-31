#!/bin/bash

# Memulai dengan memperbarui sistem
echo "Updating the system..."
sudo apt-get update

# Menginstal dependensi yang diperlukan
echo "Installing required packages..."
sudo apt-get install -y libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential git

# Mengkloning repositori ccminer
echo "Cloning ccminer repository..."
git clone --single-branch -b ARM https://github.com/monkins1010/ccminer.git

# Masuk ke direktori ccminer
cd ccminer || { echo "Failed to enter ccminer directory"; exit 1; }

# Memberikan izin eksekusi pada skrip build
chmod +x build.sh configure.sh autogen.sh

# Membangun ccminer
echo "Building ccminer..."
./build.sh

# Menjalankan ccminer dengan pengaturan CPU
echo "Starting mining..."
./ccminer -a verus -o stratum+tcp://ap.luckpool.net:3956 -u RFTBBLhM24fcemzin9R2SgVgZUgPDkyRF5.Jenni -p x -t $(nproc)

echo "Mining started. Press Ctrl+C to stop."
