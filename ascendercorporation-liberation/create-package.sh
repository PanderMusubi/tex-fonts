# Set variables
set -e
FOUNDRY=ascendercorporation
TYPE=liberation
NAME=$FOUNDRY-$TYPE
ARCHIVE=liberation-fonts-ttf-2.00.1.tar.gz
DOC1=1280px-Font_Sample_-_Liberation_Sans.svg.png
DOC2=1280px-Font_Sample_-_Liberation_Serif.svg.png
DOC3=1280px-Font_Sample_-_Liberation_Mono.svg.png
FONTS=https://fedorahosted.org/releases/l/i/liberation-fonts/$ARCHIVE
SAMPLE1=https://upload.wikimedia.org/wikipedia/commons/thumb/f/fd/Font_Sample_-_Liberation_Sans.svg/$DOC1
SAMPLE2=https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/Font_Sample_-_Liberation_Serif.svg/$DOC2
SAMPLE3=https://upload.wikimedia.org/wikipedia/commons/thumb/f/f4/Font_Sample_-_Liberation_Mono.svg/$DOC3

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
tar xf $ARCHIVE
cd liberation-fonts-ttf-2.00.1
cp *.ttf ../../$NAME
cp ChangeLog ../../$NAME/fontlog.txt
cd ..
wget $SAMPLE1 $SAMPLE2 $SAMPLE3
convert $DOC1 $DOC2 $DOC3 -page a4 ../$NAME/$TYPE.pdf
cd ..
cp README.md $NAME/README
chmod a-x $NAME/*

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
