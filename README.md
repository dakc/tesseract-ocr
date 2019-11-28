# tesseract-ocr

## Download linux fonts

1. Install cabextract, a tool needed to unpack self-extracting .exe archives:
sudo apt install cabextract


2. Download the font package provided via this page (also note the EULA there):
wget https://www.freedesktop.org/software/fontconfig/webfonts/webfonts.tar.gz


3. Unpack, twice:
tar -xzf webfonts.tar.gz
cd msfonts/
cabextract *.exe


4.Move the fonts to your user's directory for installing additional fonts:
cp *.ttf *.TTF ~/.local/share/fonts/

## Train
Run the shell scripts by number.