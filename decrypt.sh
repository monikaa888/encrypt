#!/bin/bash

# Paths
encrypted_file=~/monika_system2/encrypted_data.bin
signature_file=~/monika_system2/data_file.sig
decrypted_file=~/monika_system2/decrypted_data.txt
public_key_system1=~/monika_system2/system1_public_key.pem
private_key_system2=~/monika_system2/private_key.pem

# Verify the signature
openssl dgst -sha256 -verify $public_key_system1 -signature $signature_file $encrypted_file

# Check the verification result
if [ $? -eq 0 ]; then
    echo "Verification Successful"
else
    echo "Verification Failed"
    exit 1
fi

# Decrypt the data
openssl rsautl -decrypt -inkey $private_key_system2 -in $encrypted_file -out $decrypted_file

echo "Decryption Complete. Data stored in $decrypted_file"

