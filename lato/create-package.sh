# Set variables
set -e
NAME=lato
ARCHIVE=Lato2OFL.zip
DOC=563x647xScreen-Shot-2014-02-27-at-11.42.52.png.pagespeed.ic.bcReRM9EGv.png
FONTS=http://www.latofonts.com/download/$ARCHIVE
SAMPLE=http://www.latofonts.com/wp-content/uploads/2014/02/$DOC

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
rm -rf __MACOSX
cd Lato2OFL
cp --preserve=timestamps *.ttf ../../$NAME
cp --preserve=timestamps README.txt ../../$NAME/fontlog.txt
cd ..
wget $SAMPLE
convert $DOC -page a4 ../$NAME/$NAME.pdf
cd ..
cp --preserve=timestamps README.md $NAME/README
chmod a-x $NAME/*

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
