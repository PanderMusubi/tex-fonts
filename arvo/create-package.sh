# Set variables
set -e
NAME=arvo
ARCHIVE=master.zip
DOC1=59_arvo00fam.png
DOC2=59_arvo01reg_v2.png
DOC3=59_arvo02bld.png
DOC4=59_arvo03ita.png
DOC5=59_arvo04bdi.png
FONTS=https://github.com/antonxheight/Arvo/archive/$ARCHIVE
DOC_BASE=http://files.korkork.com/files/gimgs
SAMPLE1=$DOC_BASE/$DOC1
SAMPLE2=$DOC_BASE/$DOC2
SAMPLE3=$DOC_BASE/$DOC3
SAMPLE4=$DOC_BASE/$DOC4
SAMPLE5=$DOC_BASE/$DOC5

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
cd Arvo-master
cp --preserve=timestamps *.ttf ../../$NAME
cp --preserve=timestamps Recent_changes.txt ../../$NAME/fontlog.txt
cd ..
wget $SAMPLE1 $SAMPLE2 $SAMPLE3 $SAMPLE4 $SAMPLE5
convert $DOC1 $DOC2 $DOC3 $DOC4 $DOC5 -page a4 ../$NAME/$NAME.pdf
cd ..
cp --preserve=timestamps README.md $NAME/README

# Create archive for uploading to CTAN
rm -f $NAME.tar.gz $NAME.tar
tar cf $NAME.tar $NAME
gzip $NAME.tar

# Remove download and package directory
rm -rf download $NAME
