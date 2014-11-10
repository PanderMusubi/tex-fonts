# Set variables
set -e
NAME=vollkorn
ARCHIVE=vollkorn-3-005.zip
URL=http://vollkorn-typeface.com/download/$ARCHIVE

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
	wget $URL
fi
unzip $ARCHIVE
cp OpenFontLicense.txt ../$NAME
cp Fontlog.txt ../$NAME
cp PS-OTF/*.otf ../$NAME
cd ..
cp README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
