#!/bin/bash

DIR=$1
MALICIOUS_DIR=$2

if [ -z "$DIR" ] || [ -z "$MALICIOUS_DIR" ]; then
    echo "Usage: ./restore.sh dir malicious_dir"
    exit 1
fi

if [ ! -d "$DIR" ]; then
    echo "Source directory does not exist: $DIR"
    exit 1
fi

if [ ! -d "$MALICIOUS_DIR" ]; then
    echo "Quarantine directory does not exist: $MALICIOUS_DIR"
    exit 1
fi

shopt -s nullglob

files=("$MALICIOUS_DIR"/*)

if [ ${#files[@]} -eq 0 ]; then
    echo "No malicious files to review."
    exit 0
fi

while true; do

    files=("$MALICIOUS_DIR"/*)

    if [ ${#files[@]} -eq 0 ]; then
        echo "No malicious files to review."
        break
    fi

    echo
    echo "Malicious Files:"
    echo "----------------"

    for i in "${!files[@]}"; do
        echo "$((i + 1)). $(basename "${files[$i]}")"
    done

    echo
    read -p "Choose a file number (0 to exit): " selection

    if [ "$selection" = "0" ]; then
        break
    fi

    if ! [[ "$selection" =~ ^[0-9]+$ ]] ||
       [ "$selection" -lt 1 ] ||
       [ "$selection" -gt "${#files[@]}" ]; then
        echo "Invalid selection."
        continue
    fi

    file="${files[$((selection - 1))]}"
    filename=$(basename "$file")

    echo
    echo "1. Restore"
    echo "2. Permanently Delete"
    echo "3. Leave as-is"

    read -p "Choose an option: " choice

    if [ "$choice" = "1" ]; then

        if cp "$file" "$DIR/$filename"; then
            if rm "$file"; then
                echo "Restored $filename to $DIR."
            else
                echo "File was copied, but could not be removed from quarantine."
            fi
        else
            echo "Restore failed. The file remains in quarantine."
        fi

    elif [ "$choice" = "2" ]; then

        if rm "$file"; then
            echo "$filename permanently deleted."
        else
            echo "Could not delete $filename."
        fi

    elif [ "$choice" = "3" ]; then

        echo "$filename left as-is."

    else

        echo "Invalid choice."

    fi

done
