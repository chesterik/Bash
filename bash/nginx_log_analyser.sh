#!/bin/bash

echo " Top 5 Ip addresses with the most request"

curl -s https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log  |
    awk '{print $1}' "$1" | sort | uniq -c | sort -nk 1 | tail -n 5 | sort -k1,1nr | awk '{print $2 " -- " $1 " requests" }'


echo "top 5 most requested paths"

curl -s https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log   | 
    awk -F'"' '{print $2}' |awk '{print $2}' | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests" }'

echo "top 5 response status codes"

curl -s https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log   | 
    awk -F'"' '{print $3}' | sort | uniq -c | sort -nr | head -5 | awk '{print $2 " - " $1 " requests"  }'