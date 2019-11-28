#!/bin/sh

cd /home/wk

/opt/tesseract/bin/lstmtraining --stop_training \
	--continue_from output/finetuned_eng_checkpoint \
	--traineddata /opt/tesseract/share/tessdata/eng.traineddata \
	--model_output output/eng.traineddata