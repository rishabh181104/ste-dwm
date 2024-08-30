#!/bin/bash

# Define variables for the key names
KEY_DIR="$HOME/secureboot-keys"
KEY_NAME="my_secureboot_key"
CERT_NAME="my_secureboot_cert"

# Create a directory for storing keys
mkdir -p $KEY_DIR
cd $KEY_DIR

# Generate private key and certificate for signing
openssl req -new -x509 -newkey rsa:2048 -keyout $KEY_NAME.priv -outform DER -out $CERT_NAME.der -nodes -days 3650 -subj "/CN=Custom Secure Boot/"
openssl x509 -inform der -in $CERT_NAME.der -out $CERT_NAME.pem

# Import the key and certificate into the kernel keyring
sudo mokutil --import $CERT_NAME.der

# Function to sign files
sign_file() {
    local filepath=$1
    sbsign --key $KEY_NAME.priv --cert $CERT_NAME.pem --output "$filepath.signed" "$filepath"
}

# Find the kernel, bootloader, and modules
KERNEL_FILES=$(find /boot -name "vmlinuz-*")
INITRD_FILES=$(find /boot -name "initramfs-*")
GRUB_FILE="/boot/efi/EFI/fedora/grubx64.efi" # Adjust this path if necessary

# Sign each component
for file in $KERNEL_FILES $GRUB_FILE; do
    echo "Signing $file..."
    sign_file "$file"
done

echo "All files signed. Remember to enroll the MOK using 'mokutil --import'."

