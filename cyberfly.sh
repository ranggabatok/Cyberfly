#!/bin/bash

# =============================================================================
# Script Name: Batokpipe.sh
# Description: This script performs Update PipeNetwork operations.
# Author: Batok
# Date Created: 2024-12-22
# Version: 1.0
# License: MIT License
# =============================================================================

# Your script code starts here
echo "██████╗  █████╗ ████████╗ ██████╗ ██╗  ██╗
██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██║ ██╔╝
██████╔╝███████║   ██║   ██║   ██║█████╔╝ 
██╔══██╗██╔══██║   ██║   ██║   ██║██╔═██╗ 
██████╔╝██║  ██║   ██║   ╚██████╔╝██║  ██╗
╚═════╝ ╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
                                          "

# Meminta input dari pengguna
read -p "Isi Kadena Wallet Address: " kadena_wallet_address
read -p "Isi Node Private: " node_priv_key

# Verifikasi input pengguna
if [ -z "$kadena_wallet_address" ] || [ -z "$node_priv_key" ]; then
    print_error "Kadena Wallet Address dan Node Private Key tidak boleh kosong!"
fi

# Clone repository Cyberfly
git clone https://github.com/cyberfly-io/cyberfly-node-docker.git || print_error "Gagal mengunduh repository Cyberfly. Periksa koneksi internet Anda!"
cd cyberfly-node-docker || print_error "Gagal masuk ke direktori repository Cyberfly!"

# Update repository Cyberfly
git pull || print_error "Gagal memperbarui repository Cyberfly!"

# Memberikan izin eksekusi pada script
chmod +x start_node.sh || print_error "Gagal memberikan izin eksekusi pada script!"

# Menjalankan node secara langsung
./start_node.sh k:$kadena_wallet_address $node_priv_key || print_error "Gagal menjalankan Cyberfly Node!"
