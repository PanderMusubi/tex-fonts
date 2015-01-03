# Set variables
set -e
FOUNDRY=cyreal
TYPE=lora
NAME=$FOUNDRY-$TYPE
ARCHIVE=master.zip
DOC=lora-promo.png
FONTS=https://github.com/cyrealtype/Lora/archive/$ARCHIVE
SAMPLE=http://cyreal.org/wp-content/uploads/2012/07/$DOC

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
cd Lora-master/src/OTF
for i in *.otf
do
    cp --preserve=timestamps $i ../../../../$NAME/`basename $i -OTF.otf`.otf
done
cd ../../..
cp --preserve=timestamps Lora-master/FONTLOG.txt ../$NAME/fontlog.txt
wget $SAMPLE
convert $DOC -page a4 ../$NAME/$TYPE.pdf
cd ..
cp --preserve=timestamps README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
