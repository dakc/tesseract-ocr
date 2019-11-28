#!/bin/sh

echo "--"
echo "Do not forget to add /opt/tesseract/bin to path"
echo "export PATH=$PATH:/opt/tesseract/bin"
echo "--"

cd /home/wk
rm -rf train

# git clone https://github.com/tesseract-ocr/langdata_lstm.git

# check the fonts available
# text2image --list_available_fonts --fonts_dir /usr/share/fonts

# tessdata_dir should contain the eng.traineddata download from tessdata_best
/opt/tesseract/bin/tesstrain.sh --fonts_dir fonts \
	     --fontlist 'Arial' \
	     --lang eng \
	     --linedata_only \
	     --langdata_dir langdata_lstm \
	     --tessdata_dir /opt/tesseract/share/tessdata \
	     --save_box_tiff \
	     --maxpages 10 \
	     --output_dir train