# REMOVE ALL SPACES FROM NAMES AND REPLACE WITH UNDERSCORES
for oldname in *
do
  # string replacement
  newname=`echo $oldname | sed -e 's/ /_/g'`
  mv "$oldname" "$newname"
  echo $newname;
done
