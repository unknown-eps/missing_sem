#!/bin/bash
pwd
for i in {1..100}; do
    bash /home/harshitrawat/Desktop/iisc_sem3/missing_sem/exercises_2/error_func.sh
    out_code="$?"
    if [[ $out_code -eq "1" ]]; then
        echo "Error found at repetition $i";
        exit
    fi
done
