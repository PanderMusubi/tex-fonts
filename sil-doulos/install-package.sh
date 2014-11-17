# Set variables
set -e
TEXLIVE=/usr/local/texlive/2014
FOUNDRY=sil
TYPE=doulos
NAME=$FOUNDRY-$TYPE

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
if [ `ls|grep 'ttf$'|wc -l` -ne 0 -a `ls|grep 'otf$'|wc -l` -eq 0 ]
then
    if [ ! -d $TEXLIVE/texmf-dist/fonts/truetype/$FOUNDRY/$TYPE ]
    then
        sudo mkdir -p $TEXLIVE/texmf-dist/fonts/truetype/$FOUNDRY/$TYPE
    fi
    sudo /bin/cp -f *.ttf $TEXLIVE/texmf-dist/fonts/truetype/$FOUNDRY/$TYPE
else
    if [ ! -d $TEXLIVE/texmf-dist/fonts/opentype/$FOUNDRY/$TYPE ]
    then
        sudo mkdir -p $TEXLIVE/texmf-dist/fonts/opentype/$FOUNDRY/$TYPE
    fi
    sudo /bin/cp -f *.otf $TEXLIVE/texmf-dist/fonts/opentype/$FOUNDRY/$TYPE
fi
sudo $TEXLIVE/bin/x86_64-linux/texhash
cd ..

# Remove package directory
rm -rf $NAME
