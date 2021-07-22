# files

# terminal always reads the file extension but if its not showing in the finder it can double up
# so this always shows it

# this all could be wrapped in an if it needs to be done to speed it up
for i in *; do
  echo "$i"

  # create a variable of the name without spaces
  filename=`echo $i | sed -e 's/ /_/g'`
  # moving the file nowhere but renaming it
  mv "$i" "$filename"

  # we need the file extension to move images not folders
  # I have zero clue about how this works but it does
  ext="${filename##*.}"
  printf "the extension is \e[32m$ext\e[m\n"

  shrt=${filename%.*} # original extension finder after the last dot
  printf "the extension is \e[33m$shrt\e[m\n" # fails bad substitution

  # this doesnt work the file still has hide extension turned on in get info
  title=${shrt}.${ext}
  echo "$title"
  mv "$filename" "${shrt}more things.${ext}"
done
