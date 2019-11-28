#!/bin/sh

cd /home/wk
/opt/tesseract/bin/lstmeval --model eng.lstm \
  --traineddata /opt/tesseract/share/tessdata/eng.traineddata \
  --eval_listfile train/eng.training_files.txt

# At iteration 0, stage 0, Eval Char error rate=0.25759489, Word error rate=0.80136477