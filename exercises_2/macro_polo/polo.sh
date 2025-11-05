#!/bin/bash
polo_call()
{
    look_path='/home/harshitrawat/Desktop/iisc_sem3/missing_sem/exercises_2/macro_polo/path.txt'
    if [[ -f $look_path ]]; then
        go_path="$(cat $look_path)"
        cd "$go_path" || { echo "Some error">"/home/harshitrawat/Desktop/iisc_sem3/missing_sem/exercises_2/macro_polo/error.txt" && exit 1; }
    else
        echo "Path does not exists"
    fi
}