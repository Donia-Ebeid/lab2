# Simple Antivirus Daemon
## Operating Systems – Lab Assignment 2

## 1. Project Description
This project is a simple antivirus daemon written in Bash. It monitors a specified directory, detects potentially malicious files, and moves them to a quarantine directory.

## 2. Project Objectives
- Practice Bash scripting.
- Monitor directory changes.
- Detect potentially malicious files.
- Quarantine suspicious files.
- Use a Makefile to manage project commands.

## 3. Project Files
- `antivirus.sh` – Scans and monitors files.
- `restore.sh` – Restores or deletes quarantined files.
- `Makefile` – Provides commands to prepare, run, restore, and clean the project.
- `malicious_dir/` – Stores quarantined files.
- `test_dir/` – Directory used for testing.

## 4. How to Run
Run the following command from the project directory:

```bash
./antivirus.sh dir malicious_dir interval-secs
```

## 5. Malicious File Detection

A file is considered potentially malicious if it has one of these extensions: `.exe`, `.bat`, `.vbs`, `.scr`, or `.ps1`.

A file is also considered malicious if its contents contain `virus`, `trojan`, `malware`, or `ransomware`, regardless of letter case.

Detected files are copied to `malicious_dir/` and removed from the monitored directory.

## 6. Restore and Quarantine

Run the restore script:

```bash
./restore.sh
```

The user can choose to restore a quarantined file, permanently delete it, or leave it unchanged.

## 7. Makefile Commands

- `make prepare` – Creates the quarantine directory.
- `make run` – Runs the antivirus script using the test directory.
- `make restore` – Starts the restore script.
- `make clean` – Removes temporary directory information files.

## 8. Testing

Place sample files inside `test_dir/` to test the program. Files matching the detection rules should be moved to quarantine, while normal files should remain in the monitored directory.

## 9. Conclusion

This project demonstrates how Bash scripting can monitor a directory, detect potentially malicious files, quarantine them, and provide basic file restoration options.
