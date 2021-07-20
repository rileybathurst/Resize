# July 2021 starting to redo this script with an array in a clean way

# REMOVE ALL SPACES FROM NAMES AND REPLACE WITH UNDERSCORES
for oldname in *
do
  newname=`echo $oldname | sed -e 's/ /_/g'`
  mv "$oldname" "$newname"
done

# we need the filename to only move images
filename=$(basename "$newname")
ext="${filename##*.}"
echo $ext

# set an array of the widths we want
rs=(
  '1080'
  '540'
)



# only run the loof if its worth it
for i in "${rs[@]}"; do

  # are we already smaller
  if [ "$i" -gt "$pixelWidth" ]; then
    echo "skip $i"
  else
    printf "\e[32mWere going on $i.\e[m\n"

    # make a file put the images in and go there
    mkdir "$i"
    cp *.$ext $i
    cd $i

    # resize the images
    sips --resampleWidth $i *.$ext

    # RENAME ALL IMAGES with width and heigh
    for j in *.$ext
      do
      pixelWidth=$(sips -g pixelWidth "$j" | awk '/pixelWidth:/{print $2}')
      echo $pixelWidth
    done

    # move the images back to the root
    # while it moves up it also adds the width to the name
    mv $i ../$i-$pixelWidth.$ext

    # get back out and remove the folders
    cd ../
  fi

  # remove the folders
  rm -rf $i
done