# Set variables
set -e
FOUNDRY=ascendercorporation
TYPE=droid
NAME=$FOUNDRY-$TYPE
ARCHIVE=master.zip
DOC1=Droid-Sans-Pro.pdf
DOC2=Droid-Serif-Pro.pdf
FONTS=https://github.com/android/platform_frameworks_base/archive/$ARCHIVE
SAMPLE1=http://www.droidfonts.com/local/pdf/$DOC11
SAMPLE2=http://www.droidfonts.com/local/pdf/$DOC12
#DOC21=Roboto_Specimen_Book_20131031.pdf
#SAMPLE21=https://developer.android.com/downloads/design/$DOC21

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
exit
cd platform_frameworks_base-master
cp data/fonts/Roboto*ttf ../../$NAME
cp NEWS ../../$NAME/fontlog.txt
cd ..
cd ..
cp README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
