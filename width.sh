# echos the width of a file
# decide if I should do a size or its already smaller than that
# we need awk as sips prints out extra info

for i in *; do
  pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
  echo $pixelWidth
done