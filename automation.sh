#!/bin/bash

printed=1

while true; do
    # Get the current timestamp
    timestamp=$(date +"%Y-%m-%d %H:%M:%S")

    # Your cURL command here, with the timestamp
    html_content=$(curl -s "https://academic.utm.my/UGStudent/asp/GradeList.asp?kp={insert your encrypted kp}&ss=202320241&oo=pel")  # Replace with your actual URL

    # Extract the specified table using awk and grep
    table_content=$(echo "$html_content" | awk '/COURSE CODE/{flag=1; next} /<\/table>/{flag=0} flag')

    # Display the hour, timestamp, and the extracted table
    echo "Print $printed - $timestamp"
    echo "$table_content"

    # Increment the printed counter
    ((printed++))

    # Sleep for one hour (1200 seconds)
    sleep 1200
done
