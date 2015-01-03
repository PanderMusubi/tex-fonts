# Set variables
set -e
NAME=tuffy
ARCHIVE=tuffy-20120614.zip
DOC1=Tuffy-20120614.pdf
DOC2=Tuffy_Italic-20120614.pdf
DOC3=Tuffy_Bold-20120614.pdf
DOC4=Tuffy_Bold_Italic-20120614.pdf
BASE=http://tulrich.com/fonts
FONTS=$BASE/$ARCHIVE
SAMPLE1=$BASE/$DOC1
SAMPLE2=$BASE/$DOC2
SAMPLE3=$BASE/$DOC3
SAMPLE4=$BASE/$DOC4

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
cp --preserve=timestamps *.otf ../$NAME
wget $SAMPLE1 $SAMPLE2 $SAMPLE3 $SAMPLE4
convert $DOC1 $DOC2 $DOC3 $DOC4 -page a4 ../$NAME/$NAME.pdf
cd ..
cp --preserve=timestamps README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
