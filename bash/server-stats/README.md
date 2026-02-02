# 📊 System Monitor Script

### Description

A monitoring tool that extracts and displays real-time system performance metrics. It provides snapshots of CPU load, memory distribution, disk space on specific partitions, and identifies resource-heavy processes.

### Usage

1. **Enable Execution:**
```bash
chmod +x server-stats.sh

```


2. **Execute:**
```bash
./server-stats.sh

```



### Quick Reference

* **CPU:** Displays total percentage of CPU in use.
* **Memory:** Shows used vs. total RAM in MB with percentage.
* **Disk:** Monitors space on the `/dev/sda2` partition.
* **Top Lists:** Filters the top 5 processes draining CPU and Memory.
