# Set variables
set -e
NAME=vollkorn
ARCHIVE=vollkorn-3-005.zip
DOC1=family.png
DOC2=figures.png
DOC3=ligatures.png
DOC4=alternates.png
DOC5=klammertrick.png
DOC6=CharacterSetVollkornRegular-120dpi.png
DOC7=CharacterSetVollkornItalic-120dpi.png
BASE=http://vollkorn-typeface.com
FONTS=$BASE/download/$ARCHIVE
SAMPLE1=$BASE/images/$DOC1
SAMPLE2=$BASE/images/$DOC2
SAMPLE3=$BASE/images/$DOC3
SAMPLE4=$BASE/images/$DOC4
SAMPLE5=$BASE/images/$DOC5
SAMPLE6=$BASE/images/$DOC6
SAMPLE7=$BASE/images/$DOC7

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
cp Fontlog.txt ../$NAME/fontlog.txt
cp PS-OTF/*.otf ../$NAME
wget $SAMPLE1 $SAMPLE2 $SAMPLE3 $SAMPLE4 $SAMPLE5 $SAMPLE6 $SAMPLE7
convert $DOC1 $DOC2 $DOC3 $DOC4 $DOC5 $DOC6 $DOC7 -page a4 ../$NAME/vollkorn.pdf
cd ..
cp README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
