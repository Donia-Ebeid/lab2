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
