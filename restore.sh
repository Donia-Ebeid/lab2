#!/bin/bash

echo "Malicious Files:"
echo "----------------"

ls malicious_dir

echo
read -p "Enter the file name: " file

if [ ! -f "malicious_dir/$file" ]; then
    echo "File not found."
    exit 1
fi

echo
echo "1. Restore"
echo "2. Permanently Delete"
echo "3. Leave as-is"

read -p "Choose an option: " choice

if [ "$choice" = "1" ]; then

    read -p "Enter the directory to restore the file to: " dir

    cp "malicious_dir/$file" "$dir/$file"
    rm "malicious_dir/$file"

    echo "$file restored."

elif [ "$choice" = "2" ]; then

    rm "malicious_dir/$file"

    echo "$file permanently deleted."

elif [ "$choice" = "3" ]; then

    echo "$file left as-is."

else

    echo "Invalid choice."

fi
