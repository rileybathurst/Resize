# July 2021 starting to redo this script with an array in a clean way

# REMOVE ALL SPACES FROM NAMES AND REPLACE WITH UNDERSCORES
for oldname in *
do
  newname=`echo $oldname | sed -e 's/ /_/g'`
  mv "$oldname" "$newname"
done

# we need the file extension to move images not folders
filename=$(basename "$newname")
ext="${filename##*.}"
echo $ext

# I havent figured this out yet
#formats=(
#"jpg"
#"jpeg"
#"png"
#)
#
#if [ "$ext" != ]; kill the whole process we dont have an image
# or allow it on choice? thatd be cool but if its a folder name dont let it go

images=()
images+=(*)

for im in "${images[@]}"; do
  echo $im
done

# set an array of the widths we want
rs=(
  '1080'
  '540'
)


# only run the loof if its worth it
# each size in the array
echo "start the rs loop"
for i in "${rs[@]}"; do

  echo "print the interger"
  echo "$i"

  # deal with each image
  for j in *; do
  pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
  echo "whats the width"
  echo "$pixelWidth"

  # are we already smaller
  if [ "$i" -gt "$pixelWidth" ]; then # oh right I need to make this variable
    echo "skip $i"
  else
    printf "\e[32mWere going on $i.\e[m\n"

#     # make a file put the images in and go there
#     mkdir "$sizes"
    
#     for j in "${images[@]}"; do
#       cp $j $i
#     done

    # cd $sizes

    # resize the images
    # sips --resampleWidth $i *.$ext

    # RENAME ALL IMAGES with width and heigh
    # for j in *.$ext
    #   do
    #   pixelWidth=$(sips -g pixelWidth "$j" | awk '/pixelWidth:/{print $2}')
    #   echo $pixelWidth
    # done

    # move the images back to the root
    # while it moves up it also adds the width to the name
    # mv $i ../$i-$pixelWidth.$ext

    # get back out and remove the folders
    # cd ../
  fi

#   # remove the folders
#   rm -rf $i
done