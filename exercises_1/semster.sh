#!/bin/bash
curl --head --silent https://google.com
# Semster does not have execute permission only read and write hence ./semester.sh does not work.
# However bash semester.sh works as I have permission to run bash and read the file so the file is given to bash to run.