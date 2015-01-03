# Set variables
set -e
NAME=fell
ARCHIVE=IMFellTypesClass.zip
DOC1=fell_enW.jpg
DOC2=fell_tlW.jpg
DOC3=fell_fcW.jpg
DOC4=fell_dpW.jpg
DOC5=fell_gpW.jpg
DOC6=fell_dwW.jpg
DOC7=fell_flW.jpg
BASE=http://iginomarini.com/fell/wp-content/uploads
FONTS=$BASE/$ARCHIVE
SAMPLE1=$BASE/$DOC1
SAMPLE2=$BASE/$DOC2
SAMPLE3=$BASE/$DOC3
SAMPLE4=$BASE/$DOC4
SAMPLE5=$BASE/$DOC5
SAMPLE6=$BASE/$DOC6
SAMPLE7=$BASE/$DOC7

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
cp *.otf ../$NAME
wget $SAMPLE1 $SAMPLE2 $SAMPLE3 $SAMPLE4 $SAMPLE5 $SAMPLE6 $SAMPLE7
convert $DOC1 $DOC2 $DOC3 $DOC4 $DOC5 $DOC6 $DOC7 -page a4 ../$NAME/$NAME.pdf
cd ..
cp README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
