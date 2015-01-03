# Set variables
set -e
FOUNDRY=sil
TYPE=doulos
NAME=$FOUNDRY-$TYPE
ARCHIVE=DoulosSIL-5.000-developer.zip
ARCHIVE_FULL=render_download.php?format=file\&media_id=$ARCHIVE\&filename=$ARCHIVE
DOC=doulossample1.pdf
DOC_FULL=render_download.php?format=file\&media_id=DoulosSILTypeSamplev2\&filename=$DOC
BASE=http://scripts.sil.org/cms/scripts
FONTS=$BASE/$ARCHIVE_FULL
SAMPLE=$BASE/$DOC_FULL

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
	mv $ARCHIVE_FULL $ARCHIVE
fi
unzip $ARCHIVE
cp --preserve=timestamps `basename $ARCHIVE .zip`/FONTLOG.txt ../$NAME/fontlog.txt
cp --preserve=timestamps `basename $ARCHIVE .zip`/*.ttf ../$NAME
wget $SAMPLE
mv $DOC_FULL $DOC
pdfjoin $DOC `basename $ARCHIVE .zip`/documentation/DoulosSIL-features.pdf -o ../$NAME/$TYPE.pdf
cd ..
cp --preserve=timestamps README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
