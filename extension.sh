# extension
# this only gets the last one as it keeps rewriting the vars
# means we can only have one type of image per folder which is bad

# the name of a folder is the name of its extension

for i in *; do
  ext="${i##*.}"
  echo $ext

  echo *.$ext
done