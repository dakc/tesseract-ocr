FROM ubuntu:19.10

# install required tools
RUN apt-get update && \
    apt-get install vim git wget curl -y
# install required packages for tesseract-ocr    
RUN apt-get update && \
    apt-get install automake ca-certificates g++ git libtool make pkg-config -y
# The optional manpages are built with asciidoc
RUN apt-get update && \
    apt-get install --no-install-recommends asciidoc docbook-xsl xsltproc -y
# to build the Tesseract training tools
RUN apt-get update && \
    apt-get install libpango1.0-dev -y
# install required packages to build leptonica
RUN apt-get update && \
    apt-get install libgif-dev libjpeg-dev libpng-dev libtiff-dev zlib1g-dev -y

# Build Leptonica
RUN wget http://www.leptonica.org/source/leptonica-1.78.0.tar.gz --directory-prefix=/opt && \
    tar -zxvf /opt/leptonica-1.78.0.tar.gz -C /opt && \
    cd /opt/leptonica-1.78.0 && \
    ./configure --prefix=/opt/leptonica && \
    make && \
    make install

# Download tesseract source
RUN git -C /opt clone https://github.com/tesseract-ocr/tesseract.git tesseract_src && \
    cd /opt/tesseract_src && \
    git checkout -b 5.0.0-alpha  refs/tags/5.0.0-alpha

# set environvental variables to build tesseract
ENV LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/leptonica/lib"
ENV LIBLEPT_HEADERSDIR="/opt/leptonica-1.78.0/src"
ENV PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/opt/leptonica/lib/pkgconfig"

# Build tesseract
RUN cd /opt/tesseract_src && \
    ./autogen.sh && \
    ./configure --prefix=/opt/tesseract --with-extra-libraries=/opt/leptonica/lib && \
    make && \
    make install && \
    make training && \
    make training-install

# download best models
RUN wget https://github.com/tesseract-ocr/tessdata_best/raw/master/osd.traineddata --directory-prefix=/opt/tesseract/share/tessdata && \
    wget https://github.com/tesseract-ocr/tessdata_best/raw/master/eng.traineddata --directory-prefix=/opt/tesseract/share/tessdata

# Environmental variables
ENV PATH="$PATH:/opt/tesseract/bin"
ENV TESSDATA_PREFIX /opt/tesseract/share/tessdata