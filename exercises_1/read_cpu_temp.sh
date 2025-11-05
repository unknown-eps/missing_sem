#!/bin/bash
# This reads the cpu temprature and writes the output to cpu_temp.txt
echo "Inside temprature printer."
if [[ -d "/sys/class/hwmon/hwmon0" ]]; then
    (
    cd "/sys/class/hwmon/hwmon0" || exit
    content=$(cat temp1_input)
    cd - || exit
    echo "$content">cpu_temp.txt
    )
else
    echo "Path does not exists";
    exit;
fi
