# Set variables
set -e
FOUNDRY=sil
TYPE=galatia
NAME=$FOUNDRY-$TYPE
ARCHIVE=GalSIL21.zip
ARCHIVE_FULL=render_download.php?format=file\&media_id=$ARCHIVE\&filename=$ARCHIVE
DOC=SILGreekSample.png
BASE=http://scripts.sil.org/cms/scripts
FONTS=$BASE/$ARCHIVE_FULL
SAMPLE=http://scripts.sil.org/cms/sites/nrsi/media/$DOC

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
convert $DOC -page a4 ../$NAME/$NAME.pdf
cd ..
cp README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
