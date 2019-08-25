#!/bin/bash
# not stable
#currently has a problem with not looping the file names

# https://css-tricks.com/tips-for-rolling-your-own-lazy-loading/

# Open terminal at folder

# REMOVE ALL SPACES FROM NAMES AND REPLACE WITH UNDERSCORES
for oldname in *
do
  newname=`echo $oldname | sed -e 's/ /_/g'`
  mv "$oldname" "$newname"
done

# Drag and drop a file
filename=$(basename "$newname")
ext="${filename##*.}"
echo $ext

for i in *.$ext
  do
  pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
  echo $pixelWidth
  done

howbig=1080
if ((pixelWidth > howbig));
  then
  echo $pixelWidth "is more than" $howbig;
  mkdir $howbig
  cp *.$ext $howbig
  cd $howbig

  # RESIZE ALL IMAGES TO MAXIMUM WIDTH/HEIGHT OF 1080
  sips --resampleWidth 1080 *.$ext
  # RENAME ALL IMAGES
  for i in *.$ext
    do
    pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
    pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
    # REMOVE EXTENSION
    filename=${i%.$ext}
    # NOW RENAME
    mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.$ext
    done
fi

# works for a single file up to here




# MOVE UP AND START ALL OVER AGAIN WITH A NEW SIZE
cd ../
folder=“960”
mkdir -p "$folder"
cp *.$ext "$folder"
cd "$folder"
sips --resampleWidth 960 *.$ext
for i in *.$ext
  do
  pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
  pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
  filename=${i%.$ext}
  mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.$ext
  done

# MOVE UP AND START ALL OVER AGAIN WITH A NEW SIZE
cd ../
folder=“720”
mkdir -p "$folder"
cp *.$ext "$folder"
cd "$folder"
sips --resampleWidth 720 *.$ext
for i in *.$ext
  do
  pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
  pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
  filename=${i%.$ext}
  mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.$ext
  done

# MOVE UP AND START ALL OVER AGAIN WITH A NEW SIZE
cd ../
folder=“640”
mkdir -p "$folder"
cp *.$ext "$folder"
cd "$folder"
sips --resampleWidth 640 *.$ext
for i in *.$ext
  do
  pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
  pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
  filename=${i%.$ext}
  mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.$ext
  done
cd ../

# MOVE UP AND START ALL OVER AGAIN WITH A NEW SIZE
folder=“360”
mkdir -p "$folder"
cp *.$ext "$folder"
cd "$folder"
sips --resampleWidth 360 *.$ext
for i in *.$ext
  do
  pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
  pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
  filename=${i%.$ext}
  mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.$ext
  done
cd ../

#RENAME THE ORIGINAL FILES WITH THE WIDTH HEIGHT
for i in *.$ext
  do
  pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
  pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
  # REMOVE EXTENSION
  filename=${i%.$ext}
  # NOW RENAME
  mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.$ext
  done

# TAKE THE IMAGES OUT OF THE INDIVIDUAL FOLDERS AND THEN REMOVE THE EMPTY DIRECTORY
cd “1080”
mv *.$ext ../
cd ../
rmdir “1080”

cd “960”
mv *.$ext ../
cd ../
rmdir “960”

cd “720”
mv *.$ext ../
cd ../
rmdir “720”

cd “640”
mv *.$ext ../
cd ../
rmdir “640”

cd “360”
mv *.$ext ../
cd ../
rmdir “360”

# CONVERT EVERYTHING TO WEBP
# https://developers.google.com/speed/webp/docs/cwebp
# https://www.smashingmagazine.com/2018/07/converting-images-to-webp/
find ./ -type f -name '*.$ext' | xargs -P 8 -I {} sh -c 'cwebp -af $1 -o "${1%.png}.webp"' _ {} \;

# PNG
if [$ext = png]
then
  pngquant 256 *.png
  and remove the extension with f
  $ for f in *; do mv "$f" ${f//-fs8/}; done
fi

