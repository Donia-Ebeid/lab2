
#!/bin/bash

DIR=$1
MALICIOUS_DIR=$2
INTERVAL=$3

scan_file() {

    file="$1"
    filename=$(basename "$file")

    malicious=false

    case "$filename" in
        *.exe|*.bat|*.vbs|*.scr|*.ps1)
            malicious=true
            ;;
    esac

    if grep -Eqi 'virus|trojan|malware|ransomware|worm' "$file"; then
        malicious=true
    fi

    if [ "$malicious" = true ]; then
        echo "$filename is malicious and it is DELETED"
        cp "$file" "$MALICIOUS_DIR/$filename"
        rm "$file"
    fi
}

if [ ! -f "directory-info.last" ]; then
    

        for file in "$DIR"/*
    do
        if [ -f "$file" ]; then
            scan_file "$file"
        fi
    done

    ls -l "$DIR" > directory-info.last
fi

while true
do
    sleep "$INTERVAL"

    ls -l "$DIR" > directory-info.new

    if ! cmp -s directory-info.last directory-info.new
then
    echo "Directory changed."

    for file in "$DIR"/*
    do
        if [ -f "$file" ]; then
            scan_file "$file"
        fi
    done

            ls -l "$DIR" > directory-info.last
    fi
done

