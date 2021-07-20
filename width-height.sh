# Rename width height




for i in *.$ext do
  # width
  pixelWidth=$(sips -g pixelWidth "$i" | awk '/pixelWidth:/{print $2}')
  
  # height
  pixelHeight=$(sips -g pixelHeight "$i" | awk '/pixelHeight:/{print $2}')

  # add extension
  filename=${i%.$ext}

  # push the file up a level
  mv $i ${filename##*/}-${pixelWidth}x${pixelHeight}.$ext
done