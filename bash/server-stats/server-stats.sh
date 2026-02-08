#!/usr/bin/env bash
OS=$(uname)

echo "##########"
echo " Total CPU usage "
echo "##########"
if [ "$OS" = "Linux" ]; then
  top -bn1 | awk -F'[, ]+' '/%Cpu/{
    for(i=1;i<=NF;i++) if($i~/id/) idle=$(i-1);
    printf "CPU usage: %.2f%%\n", 100-idle
  }'
else
  top -l 1 | awk -F'[:, ]+' '/CPU usage/{
    for(i=1;i<=NF;i++) if($i~/idle/) idle=$(i-1);
    printf "CPU usage: %.2f%%\n", 100-idle
  }'
fi

echo
echo "##########"
echo " Total memory usage (Free vs Used including percentage) "
echo "##########"
if [ "$OS" = "Linux" ]; then
  free -m | awk 'NR==2{
    used=$3; free=$4; total=$2;
    printf "Used: %d MB (%.2f%%) | Free: %d MB (%.2f%%)\n", used, used/total*100, free, free/total*100
  }'
else
  ps=$(vm_stat | awk 'NR==1{gsub(/[^0-9]/,""); print $0}'); ps=${ps:-4096}
  vm_stat | awk -v ps="$ps" '
    /Pages free/ {f=$3}
    /Pages active/ {a=$3}
    /Pages inactive/ {i=$3}
    /Pages wired/ {w=$4}
    /Pages wired down/ {w=$4}
    END{
      gsub(/\./,"",f); gsub(/\./,"",a); gsub(/\./,"",i); gsub(/\./,"",w);
      usedp=a+i+w; totalp=usedp+f;
      used=usedp*ps/1024/1024; free=f*ps/1024/1024; total=totalp*ps/1024/1024;
      printf "Used: %.0f MB (%.2f%%) | Free: %.0f MB (%.2f%%)\n", used, used/total*100, free, free/total*100
    }'
fi

echo
echo "##########"
echo " Total disk usage (Free vs Used including percentage) "
echo "##########"
df -k / | awk 'NR==2{
  total=$2; used=$3; free=$4;
  printf "Used: %.2f%% | Free: %.2f%%\n", used/total*100, free/total*100
}'

echo
echo "##########"
echo " Top 5 processes by CPU usage "
echo "##########"
if [ "$OS" = "Linux" ]; then
  ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
else
  ps -Ao pid,comm,%cpu | sort -nrk3 | head -n 6
fi

echo
echo "##########"
echo " Top 5 processes by memory usage "
echo "##########"
if [ "$OS" = "Linux" ]; then
  ps -eo pid,comm,%mem --sort=-%mem | head -n 6
else
  ps -Ao pid,comm,%mem | sort -nrk3 | head -n 6
fi
