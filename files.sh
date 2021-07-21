# files

# this all could be wrapped in an if it needs to be done to speed it up
for i in *; do
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

  # test adding variables together
  # title="$shrt.$ext"
  # echo "the title is $title" # works

  # can I know remove all . from the names and replace with - as screenshots create these
  # except between shortname and extension as I need that one
  # lines=`echo $shrt | sed -e 's/./_/g'` # this replaces all chars with -
  # lines=`echo $shrt | sed -e 's/e/f/g'` # theory is right whats the . char?
  lines=`echo $shrt | sed -e 's/./_/g'` # theory is right whats the . char?
  echo "$lines"
  # mv "$shrt" "{$lines.$ext}"

  # mv "$shrt" "${lines.ext}"
done

  # maybes?
  # * = everything
  # % before last
  # %% before first
  # # = after first
  # ## = after last
