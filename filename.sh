# Drag and drop a file
# becomes more useful further on
filename=$(basename "$newname")
ext="${filename##*.}"
echo $ext

# can I bring through variables?
echo $newname;

# check if we have the extension visible
if [[ $newname == *$ext* ]];
then
  echo "It's there!"
else 
  echo "It's not there!"
fi