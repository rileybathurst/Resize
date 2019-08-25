Images
https://css-tricks.com/tips-for-rolling-your-own-lazy-loading/
https://css-tricks.com/the-complete-guide-to-lazy-loading-images/

for now there’s a bash command in the sites/interesting directory

make sure jpg is lowercase

# REMOVE ALL SPACES FROM NAMES AND REPLACE WITH UNDERSCORES
for oldname in *
do
  newname=`echo $oldname | sed -e 's/ /_/g'`
  mv "$oldname" "$newname"
done

# CREATE THE VARIABLE MOVE THE IMAGES
folder=“1080”
mkdir -p "$folder"
cp *.jpg "$folder"
cd "$folder"

# RESIZE ALL IMAGES TO MAXIMUM WIDTH/HEIGHT OF 360
sips --resampleWidth 1080 *.jpg
# RENAME ALL IMAGES
for i in *.jpg
  do
    pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
    pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
    # REMOVE EXTENSION
    filename=${i%.jpg}
    # NOW RENAME
    mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.jpg
  done

# MOVE UP AND START ALL OVER AGAIN WITH A NEW SIZE
cd ../
folder=“960”
mkdir -p "$folder"
cp *.jpg "$folder"
cd "$folder"
sips --resampleWidth 960 *.jpg
for i in *.jpg
  do
    pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
    pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
    filename=${i%.jpg}
    mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.jpg
  done

# MOVE UP AND START ALL OVER AGAIN WITH A NEW SIZE
cd ../
folder=“720”
mkdir -p "$folder"
cp *.jpg "$folder"
cd "$folder"
sips --resampleWidth 720 *.jpg
for i in *.jpg
  do
    pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
    pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
    filename=${i%.jpg}
    mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.jpg
  done

# MOVE UP AND START ALL OVER AGAIN WITH A NEW SIZE
cd ../
folder=“640”
mkdir -p "$folder"
cp *.jpg "$folder"
cd "$folder"
sips --resampleWidth 640 *.jpg
for i in *.jpg
  do
    pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
    pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
    filename=${i%.jpg}
    mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.jpg
  done
cd ../

# MOVE UP AND START ALL OVER AGAIN WITH A NEW SIZE
folder=“360”
mkdir -p "$folder"
cp *.jpg "$folder"
cd "$folder"
sips --resampleWidth 360 *.jpg
for i in *.jpg
  do
    pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
    pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
    filename=${i%.jpg}
    mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.jpg
  done
cd ../

#RENAME THE ORIGINAL FILES WITH THE WIDTH HEIGHT
for i in *.jpg
  do
    pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
    pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')
    # REMOVE EXTENSION
    filename=${i%.jpg}
    # NOW RENAME
    mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.jpg
  done

# TAKE THE IMAGES OUT OF THE INDIVIDUAL FOLDERS AND THEN REMOVE THE EMPTY DIRECTORY
cd “1080”
mv *.jpg ../
cd ../
rmdir “1080”

cd “960”
mv *.jpg ../
cd ../
rmdir “960”

cd “720”
mv *.jpg ../
cd ../
rmdir “720”

cd “640”
mv *.jpg ../
cd ../
rmdir “640”

cd “360”
mv *.jpg ../
cd ../
rmdir “360”

# CONVERT EVERYTHING TO WEBP
# https://www.smashingmagazine.com/2018/07/converting-images-to-webp/
find ./ -type f -name '*.jpg' | xargs -P 8 -I {} sh -c 'cwebp -af $1 -o "${1%.png}.webp"' _ {} \;

PNG
if a png compress with
pngquant 256 *.png
and remove the extension with f
$ for f in *; do mv "$f" ${f//-fs8/}; done

https://css-tricks.com/tips-for-rolling-your-own-lazy-loading/

WebP
https://developers.google.com/speed/webp/docs/cwebp

WebM
https://thethemefoundry.com/blog/convert-mp4-to-webm/
uses ffmpeg
not tested
$ ffmpeg -i input-file.mp4 -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis output-file.webm
