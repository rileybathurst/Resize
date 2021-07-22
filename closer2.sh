# Closer

# Add a closing tag with variables

# if needed make a couple files
touch foo.html bar.html

for i in *.html; do
  echo "<img src='$i'/>" >> $i # this is fine but not quite what I want to be doing
done