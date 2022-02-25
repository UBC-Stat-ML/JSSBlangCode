#!/bin/bash

# Requires a UNIX-compatible environment running bash, and git software.

echo "Unpacking reproduction material (models and data used within the paper)"
read -n 1 -s -r -p "Press any key to continue."
echo
tar -xzvf replication.tar.gz

echo
cd replication

echo
echo "Running script to to setup blangSDK and run models"
read -n 1 -s -r -p "Press any key to continue."
echo

echo
source run.sh

echo "Results are available in replication/example/results/all"
echo "and replication/others/results/all"
echo
