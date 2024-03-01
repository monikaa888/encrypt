#!/bin/bash

# Paths
data_file=~/monika_system1/secret_data.txt
encrypted_file=~/monika_system1/encrypted_data.bin
signature_file=~/monika_system1/data_file.sig
public_key_system2=~/monika_system1/system2_public_key.pem
private_key_system1=~/monika_system1/private_key.pem

# Encrypt the data
openssl rsautl -encrypt -inkey $public_key_system2 -pubin -in $data_file -out $encrypted_file

# Sign the encrypted data
openssl dgst -sha256 -sign $private_key_system1 -out $signature_file $encrypted_file

# Transfer the encrypted data and signature to System2
scp $encrypted_file aaysha@192.168.210.9:~/monika_system2/
scp $signature_file aaysha@192.168.210.9:~/monika_system2/


