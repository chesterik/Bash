# 📦 Simple Backup Script

### Description

A Bash script that automates directory archiving. It validates the input path, creates a timestamped `.tar.gz` archive, and organizes the output into a `backup/` folder.

### Usage

1. **Enable Execution:**
```bash
chmod +x log-archive-tool.sh

```


2. **Execute:**
```bash
./log-archive-tool.sh /target/path

```



### Quick Reference

* **Validation:** Checks if path exists and is not empty.
* **Format:** `tar.gz` (Gzip compression).
* **Storage:** Files are stored in `./backup/back_log`.
* **Naming:** Includes date and time to prevent overwriting.
