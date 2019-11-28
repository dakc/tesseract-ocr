#!/bin/sh

cd /home/wk
/opt/tesseract/bin/combine_tessdata -e /opt/tesseract/share/tessdata/eng.traineddata eng.lstm
# pass the best model downloaded from tessdata_best to -e parameter
# that data will be extracted to /home/wk/eng.lstm