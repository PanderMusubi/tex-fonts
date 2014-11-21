# Set variables
set -e
NAME=crimsontext
ARCHIVE=master.zip
FONTS=https://github.com/skosch/Crimson/archive/$ARCHIVE

# Create new download and package directories
if [ -e download ]
then
    rm -rf download
fi
mkdir download
if [ -e $NAME ]
then
    rm -rf $NAME
fi
mkdir $NAME

# Download archive in download and copy essential files to package directory
cd download
if [ ! -e $ARCHIVE ]
then
	wget $FONTS
fi
unzip $ARCHIVE
cd Crimson-master
cp Desktop\ Fonts/OTF/*.otf ../../$NAME
cp Desktop\ Fonts/TTF/*.ttf ../../$NAME
cp README.md ../../$NAME/fontlog.txt
cp Specimen/crimson-L-with-caron-specimen.pdf ../../$NAME/$TYPE.pdf
cd ..
cd ..
cp README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
