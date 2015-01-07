# Set variables
set -e
FOUNDRY=canonical
TYPE=ubuntu
NAME=$FOUNDRY-$TYPE
ARCHIVE=ubuntu-font-family-0.80.zip
DOC1=gallery-openshine.png
DOC2=gallery-android.png
DOC3=gallery-museum.png
DOC4=gallery-ubuntu.png
DOC5=gallery-canonical.png
DOC6=gallery-squirrel.png
DOC7=gallery-one.png
DOC8=gallery-poster.png
DOC9=gallery-saudi.png
FONTS=http://font.ubuntu.com/download/$ARCHIVE
SAMPLE1=http://font.ubuntu.com/assets/img/$DOC1
SAMPLE2=http://font.ubuntu.com/assets/img/$DOC2
SAMPLE3=http://font.ubuntu.com/assets/img/$DOC3
SAMPLE4=http://font.ubuntu.com/assets/img/$DOC4
SAMPLE5=http://font.ubuntu.com/assets/img/$DOC5
SAMPLE6=http://font.ubuntu.com/assets/img/$DOC6
SAMPLE7=http://font.ubuntu.com/assets/img/$DOC7
SAMPLE8=http://font.ubuntu.com/assets/img/$DOC8
SAMPLE9=http://font.ubuntu.com/assets/img/$DOC9

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
cd ubuntu-font-family-0.80
cp --preserve=timestamps *ttf ../../$NAME
cp --preserve=timestamps FONTLOG.txt ../../$NAME/fontlog.txt
cd ..
wget $SAMPLE1 $SAMPLE2 $SAMPLE3 $SAMPLE4 $SAMPLE5 $SAMPLE5 $SAMPLE6 $SAMPLE7 $SAMPLE8 $SAMPLE9
convert $DOC1 $DOC2 $DOC3 $DOC4 $DOC5 $DOC6 $DOC7 $DOC8 $DOC9 -page a4 ../$NAME/$TYPE.pdf
cd ..
cp --preserve=timestamps README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
