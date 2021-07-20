# folder structure

# yes we need this to test it
# REMOVE ALL SPACES FROM NAMES AND REPLACE WITH UNDERSCORES
for oldname in *
do
  # string replacement
  newname=`echo $oldname | sed -e 's/ /_/g'`
  mv "$oldname" "$newname"
  echo $newname;
done


for i in *; do
  ext="${i##*.}"
done

# echo $ext

images=()
images+=(*)

# for i in "${images[@]}"; do
#   # echo $i
# done

# set an array of the widths we want
rs=(
  '1080'
  '540'
)

for i in "${rs[@]}"; do
  # echo $i;
  mkdir -p "$i"

  for j in "${images[@]}"; do
    echo $j # this is showing the folders as well
    cp $j $i
  done

done
