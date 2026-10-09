# Simple Antivirus Daemon

## Description

This project is a simple antivirus daemon written in Bash.

The program monitors a directory and checks files for malicious files.

## How to Run

Use the following command:

./antivirus.sh dir malicious_dir interval-secs

Example:

./antivirus.sh test_dir malicious_dir 5

## Malicious Files

A file is considered malicious if:

- Its extension is `.exe`
- Its extension is `.bat`
- Its extension is `.vbs`
- Its extension is `.scr`
- Its extension is `.ps1`
- Its contents contain `virus`, `trojan`, `malware`, or `ransomware`

When a malicious file is found, it is copied to `malicious_dir` and deleted from the monitored directory.

## Restore

The restore program can be started using:

./restore.sh

It allows the user to:

1. Restore a file
2. Permanently delete a file
3. Leave the file as-is

## Makefile

The Makefile provides the following commands:

make prepare
make run
make restore
make clean

## Project Files

- `antivirus.sh` - Main antivirus program
- `restore.sh` - Restores or deletes quarantined files
- `Makefile` - Provides commands for the project
- `README.md` - Project documentation
- `malicious_dir` - Directory for quarantined files
- `test_dir` - Directory used for testing
