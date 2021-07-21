# Resize all the images in a folder

# REMOVE ALL SPACES FROM NAMES AND REPLACE WITH UNDERSCORES
for oldname in *
do
  newname=`echo $oldname | sed -e 's/ /_/g'`
  mv "$oldname" "$newname"
done

# we need the file extension to move images not folders
filename=$(basename "$newname")
ext="${filename##*.}"
printf "the extension is \e[32m$ext\e[m\n"

# set an array of the widths we want
rs=(
  '3840'
  '540'
  '10'
)

# only run the loof if its worth it
# each size in the array is $i
echo "start the rs loop"
for i in "${rs[@]}"; do
  printf "Starting on the size \e[32m$i\e[m\n"

  # deal with each image as $j
  for j in *; do
      printf "  Starting on the image \e[33m$j\e[m\n"
      
      pixelWidth=$(sips -g pixelWidth "$j" | awk '/pixelWidth:/{print $2}')
      printf "    This image is \e[35m$pixelWidth\e[m wide\n"

      if [ "$i" -gt "$pixelWidth" ]; then # oh right I need to make this variable
        printf "      \e[31mWere skipping $i.\e[m\n"
      else
        printf "      \e[32mWere going on $i.\e[m\n"

        mkdir $i

        # move the images ($j) into the folder ($i)
        cp $j $i
      fi

      printf "  Finishing on the image \e[34m$j\e[m\n"
  done # finish with each image

  printf "Finishing on the size \e[31m$i\e[m\n"
done # finish with each size