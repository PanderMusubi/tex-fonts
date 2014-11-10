# Set variables
set -e
TL_VERSION=2014
NAME=vollkorn
ARCHIVE=vollkorn-3-005.zip

# Create new tmp and destination directories
if [ -e tmp ]
then
    rm -rf tmp
fi
mkdir tmp
if [ -e $NAME ]
then
    rm -rf $NAME
fi
mkdir $NAME

# Download archive in tmp and copy essential files to destination
cd tmp
if [ ! -e $ARCHIVE ]
then
	wget http://vollkorn-typeface.com/download/$ARCHIVE
fi
unzip $ARCHIVE
cp OpenFontLicense.txt ../$NAME
cp Fontlog.txt ../$NAME
cp PS-OTF/*.otf ../$NAME
cd ..
rm -rf tmp
cp README.md $NAME/README

# Install files in current TeX Live installation
if [ ! -d /usr/local/texlive/$TL_VERSION/texmf-dist/fonts/opentype/public/$NAME ]
then
    sudo mkdir /usr/local/texlive/$TL_VERSION/texmf-dist/fonts/opentype/public/$NAME
fi
sudo /bin/cp -f $NAME/*.otf /usr/local/texlive/$TL_VERSION/texmf-dist/fonts/opentype/public/$NAME
sudo /usr/local/texlive/$TL_VERSION/bin/x86_64-linux/texhash

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar
