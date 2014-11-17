# Set variables
set -e
FOUNDRY=sil
TYPE=charis
NAME=$FOUNDRY-$TYPE
ARCHIVE=CharisSIL-5.000-developer.zip
ARCHIVE_FULL=render_download.php?format=file\&media_id=$ARCHIVE\&filename=$ARCHIVE
DOC=CharisSILTypeSample.pdf
DOC_FULL=render_download.php?format=file\&media_id=CharisSILTypeSample\&filename=$DOC
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
cp `basename $ARCHIVE .zip`/FONTLOG.txt ../$NAME/fontlog.txt
cp `basename $ARCHIVE .zip`/*.ttf ../$NAME
wget $SAMPLE
mv $DOC_FULL $DOC
pdfjoin $DOC `basename $ARCHIVE .zip`/documentation/CharisSIL-features.pdf -o ../$NAME/$NAME.pdf
cd ..
cp README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
