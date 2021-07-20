# echos the width of a file
# decide if I should do a size or its already smaller than that
for i in *
  do
  pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
  echo $pixelWidth
done