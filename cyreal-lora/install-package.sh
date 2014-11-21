# Set variables
set -e
TEXLIVE=/usr/local/texlive/2014
NAME=cyreal-lora

# Check if package is available
if [ ! -e $NAME.tar.gz ]
then
    echo ERROR: Please create package $NAME.tar.gz
    exit 1
fi

# Extract package archive
if [ -e $NAME ]
then
    rm -rf $NAME
fi
tar xf $NAME.tar.gz

# Install files in current TeX Live installation
cd $NAME
if [ ! -d $TEXLIVE/texmf-dist/fonts/opentype/public/$NAME ]
then
    sudo mkdir $TEXLIVE/texmf-dist/fonts/opentype/public/$NAME
fi
sudo /bin/cp -f *.otf $TEXLIVE/texmf-dist/fonts/opentype/public/$NAME
sudo $TEXLIVE/bin/x86_64-linux/texhash
cd ..

# Remove package directory
rm -rf $NAME
