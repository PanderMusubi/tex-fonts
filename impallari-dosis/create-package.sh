# Set variables
set -e
FOUNDRY=impallari
TYPE=dosis
NAME=$FOUNDRY-$TYPE
ARCHIVE=dosis-v1.7.zip
DOC1=terminaldosis-weights-1.6.png
DOC2=terminaldosis-preview.png
FONTS=http://www.impallari.com/media/releases/$ARCHIVE
SAMPLE1=http://www.impallari.com/media/fonts/terminaldosis/$DOC1
SAMPLE2=http://www.impallari.com/media/fonts/terminaldosis/$DOC2

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
rm -rf __MACOSX
cd Dosis\ v1.7
#cp --preserve=timestamps *.ttf ../../$NAME
cp --preserve=timestamps src/OT/*.otf ../../$NAME
cp --preserve=timestamps FONTLOG.txt ../../$NAME/fontlog.txt
cd ..
wget $SAMPLE1 $SAMPLE2
convert $DOC1 $DOC2 -page a4 ../$NAME/$TYPE.pdf
cd ..
cp --preserve=timestamps README.md $NAME/README
chmod a-x $NAME/*

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
