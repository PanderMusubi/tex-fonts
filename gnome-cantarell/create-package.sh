# Set variables
set -e
FOUNDRY=gnome
TYPE=cantarell
NAME=$FOUNDRY-$TYPE
ARCHIVE=master.zip
FONTS=https://github.com/GNOME/cantarell-fonts/archive/$ARCHIVE

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
cd cantarell-fonts-master
cp otf/*.otf ../../$NAME
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
