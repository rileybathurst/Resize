# PNG
# can I document this please

if [$ext = png]; then
  pngquant 256 *.png
  # and remove the extension with f
  
  $ for f in *; do
    mv "$f" ${f//-fs8/};
  done
fi