#!/bin/bash

echo "Step 1: Building dataset"
cd 0_make_dataset
bash run_dataset.sh
cd ..

echo "Step 2: Running econometric analysis"
cd 1_analysis
bash run_analysis.sh
cd ..

echo "Replication complete"
