# Resize all the images in a folder

printf "\e[32m-------------------------------\e[m\n"
printf "\e[32mResize\e[m\n"
printf "\e[32m-------------------------------\e[m\n"

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
  for j in *.$ext; do
      printf "  Starting on the image \e[33m$j\e[m\n"
      
      pixelWidth=$(sips -g pixelWidth "$j" | awk '/pixelWidth:/{print $2}')
      printf "    This image is \e[35m$pixelWidth\e[m wide\n"

      if [ "$i" -gt "$pixelWidth" ]; then # oh right I need to make this variable
        printf "      \e[31mWere skipping $i.\e[m\n"
      else
        printf "      \e[32mWere going on $i.\e[m\n"

        # the p silently fails if we run the command twice, we shouldnt do this
        mkdir -p $i

        # move the images ($j) into the folder ($i)
        cp $j $i

      fi # weve moved all the images we need to get back out now

      printf "  Finishing on the image \e[34m$j\e[m for the size $i\n"
  done # finish with each image so we no longer have $j

  # get into each folder only if it exists as we didnt make some
  if [[ -d $i ]]; then
    cd $i # this gets into the problem sometimes there isnt a folder of that size

    printf "  were in each size only once this is\n"

    for k in *; do # $k is the new image name
      
      printf "\e[36mimage $k for the size $i\e[m\n"
      sips --resampleWidth $i $k

      pixelHeight=$(sips -g pixelHeight "$k" | awk '/pixelHeight:/{print $2}')

      # this is going to have the extension twice
      mv $k ../${k}-${i}x${pixelHeight}.$ext

      printf "\e[37mDone with that image\e[m\n"

    done # Ive made the transforms

    cd ../
  fi # done with that folder
  rmdir $i

  printf "Finishing on the size \e[31m$i\e[m\n"
done # finish with each size

# I might need to download some stuff for this

# CONVERT EVERYTHING TO WEBP
# https://developers.google.com/speed/webp/docs/cwebp
# https://www.smashingmagazine.com/2018/07/converting-images-to-webp/
# find ./ -type f -name '*.$ext' | xargs -P 8 -I {} sh -c 'cwebp -af $1 -o "${1%.png}.webp"' _ {} \;

# PNG
# if [$ext = png]
# then
#   pngquant 256 *.png
#   and remove the extension with f
#   $ for f in *; do
#     mv "$f" ${f//-fs8/};
#   done
# fi