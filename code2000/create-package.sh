# Set variables
set -e
NAME=code2000
ARCHIVE=CODE2000.ZIP
DOC=UNICREF.ZIP
BASE=https://web.archive.org/web/20101122142710/http://code2000.net
FONTS=$BASE/$ARCHIVE
SAMPLE=$BASE/$DOC

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
cp CODE2000.TTF ../$NAME/CODE2000.ttf
wget $SAMPLE
unzip $DOC
convert SSEE.GIF -page a4 ../$NAME/$NAME.pdf
cd ..
cp README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
