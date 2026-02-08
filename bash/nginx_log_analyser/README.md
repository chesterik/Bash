# Bash Log Analyzer

This project is a simple Bash script that analyzes an Nginx access log and prints basic statistics.

The script downloads the log file from a remote URL and displays:

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 HTTP response status codes

---

## 📄 Log source

The script uses a public Nginx access log:

https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log

---

## 🛠️ Requirements

- Bash
- curl
- awk
- sort, uniq, head

(All tools are available by default on most Linux distributions.)

---

## ▶️ How to run

1. Make the script executable:

```bash
chmod +x nginx_log_analyser.sh
```

2. **Execute:**
```bash
./nginx_log_analyser.sh

```