#!/bin/sh

cd /home/wk
mkdir output
rm -rf output/*
/opt/tesseract/bin/lstmtraining \
	--continue_from eng.lstm \
	--traineddata /opt/tesseract/share/tessdata/eng.traineddata \
	--train_listfile train/eng.training_files.txt \
	--max_iterations 400 \
    --model_output output/finetuned_eng