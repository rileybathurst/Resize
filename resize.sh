# All together now

# REMOVE ALL SPACES FROM NAMES AND REPLACE WITH UNDERSCORES
for oldname in *
do
  # string replacement
  newname=`echo $oldname | sed -e 's/ /_/g'`
  mv "$oldname" "$newname"
  echo $newname;
done

# Drag and drop a file
# becomes more useful further on
filename=$(basename "$newname")
ext="${filename##*.}"
echo $ext

# can I bring through variables?
echo $newname;

# check if we have the extension visible
# this works even if MacOS is hiding it
# maybe not worth doing it then
if [[ $newname == *$ext* ]];
then
  echo "It's there!"
else 
  echo "It's not there!"
fi