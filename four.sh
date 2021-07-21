# Resize all the images in a folder

# Title block to quickly find the start of the readout
printf "\e[32m-------------------------------\e[m\n"
printf "\e[32mResize\e[m\n"
printf "\e[32m-------------------------------\e[m\n"

formats=()

# REMOVE ALL SPACES FROM NAMES AND REPLACE WITH UNDERSCORES
# I dont remeber regex so I havent documented it
for o in *; do
  filename=`echo $o | sed -e 's/ /_/g'`
  mv "$o" "$filename"

  # we need the file extension to move images not folders
  ext="${filename##*.}"
  printf "the extension is \e[32m$ext\e[m\n"

  # add all the extensions to the array
  # 🚨 I dont want duplicates tho
  formats+=("$ext")

  shrt=${filename%.*} # I dont quite understand these substitions
  printf "the extension is \e[33m$shrt\e[m\n"

  touch $shrt.html
  # then add all the base info in here
  echo "<picture>" >> $shrt.html


done

# check the formats
# 🚨 possibly prune the duplicates
for l in "${formats[@]}"; do
  echo "full array $l"
done

# set an array of the widths we want
rs=(
  '3840'
  '540'
  '10'
)

# only run the loop to create a folder with an image in it if its worth it
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

        # the p silently fails if we run the command twice shouldnt happen but does
        mkdir -p $i

        # move the images ($j) into the folder ($i)
        cp $j $i

      fi # weve moved all the images we need to get back out now

      printf "  Finishing on the image \e[34m$j\e[m for the size $i\n"
  done # finish with each image so we no longer have $j

  printf "Finishing \e[31m$i\e[m\n"
done # finish with each size

# go into each folder and deal with the images
for i in "${rs[@]}"; do
  # get into each folder only if it exists as we didnt make some
  if [[ -d $i ]]; then
    cd $i

    pwd

    # for each image (k) in each subfolder (*)
    for k in *; do # $k is the new image name

      echo "the images in this folder are $k"

      printf "\e[36mimage $k for the size $i\e[m\n"
      sips --resampleWidth $i $k # this prints a line to the terminal

      pixelHeight=$(sips -g pixelHeight "$k" | awk '/pixelHeight:/{print $2}')

      # this maybe should but doesnt have the extension twice
      mv $k ../${k}-${i}x${pixelHeight}.$ext

      printf "\e[37mDone with that image\e[m\n"

    done # Ive made the transforms

    cd ../

  fi # done with that folder
  rmdir $i
done

## add the file to the html list
# for m in *; do
  # echo $m >> $m-shortname.html
  # 🚨 except now theres all the dimensions
  # unless I specify something like its after a double dash
  # and when converting the names I have removed all other double dashes
# done

# for n in *.html; do
#   # echo "$n"
#   echo ${"</picture>" >> $n}
# done

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

