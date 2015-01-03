# Set variables
set -e
FOUNDRY=theleagueofmobeabletype
TYPE=fanwood
NAME=$FOUNDRY-$TYPE
ARCHIVE=master.zip
FONTS=https://github.com/theleagueof/fanwood/archive/$ARCHIVE

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
cd fanwood-master
cp --preserve=timestamps *.otf ../../$NAME
convert images/*.jpeg -page a4 ../../$NAME/$TYPE.pdf
cd ..
cd ..
cp --preserve=timestamps README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
