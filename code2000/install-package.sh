# Set variables
set -e
TEXLIVE=/usr/local/texlive/2014
FOUNDRY=public
TYPE=code2000
NAME=$FOUNDRY-$TYPE

# Check if package is available and extract package archive
if [ $FOUNDRY = public ]
then
    if [ ! -e $TYPE.tar.gz ]
    then
        echo ERROR: Please create package $TYPE.tar.gz
        exit 1
    fi
    if [ -e $TYPE ]
    then
        rm -rf $TYPE
    fi
    tar xf $TYPE.tar.gz
    cd $TYPE
else
    if [ ! -e $NAME.tar.gz ]
    then
        echo ERROR: Please create package $NAME.tar.gz
        exit 1
    fi
    if [ -e $NAME ]
    then
        rm -rf $NAME
    fi
    tar xf $NAME.tar.gz
    cd $NAME
fi

# Install files in current TeX Live installation
if [ `ls|grep 'ttf$'|wc -l` -ne 0 -a `ls|grep 'otf$'|wc -l` -eq 0 ]
then
    if [ ! -d $TEXLIVE/texmf-dist/fonts/truetype/$FOUNDRY/$TYPE ]
    then
        sudo mkdir -p $TEXLIVE/texmf-dist/fonts/truetype/$FOUNDRY/$TYPE
    else
        echo WANRING: Replacing following files
        ls -ltr $TEXLIVE/texmf-dist/fonts/truetype/$FOUNDRY/$TYPE
        sudo rm -f $TEXLIVE/texmf-dist/fonts/truetype/$FOUNDRY/$TYPE/*
    fi
    sudo /bin/cp -f *.ttf $TEXLIVE/texmf-dist/fonts/truetype/$FOUNDRY/$TYPE
else
    if [ ! -d $TEXLIVE/texmf-dist/fonts/opentype/$FOUNDRY/$TYPE ]
    then
        sudo mkdir -p $TEXLIVE/texmf-dist/fonts/opentype/$FOUNDRY/$TYPE
    else
        echo WANRING: Replacing following files
        ls -ltr $TEXLIVE/texmf-dist/fonts/opentype/$FOUNDRY/$TYPE
        sudo rm -f $TEXLIVE/texmf-dist/fonts/opentype/$FOUNDRY/$TYPE/*
    fi
    sudo /bin/cp -f *.otf $TEXLIVE/texmf-dist/fonts/opentype/$FOUNDRY/$TYPE
fi
sudo $TEXLIVE/bin/x86_64-linux/texhash

# Remove package directory
cd ..
rm -rf $NAME
