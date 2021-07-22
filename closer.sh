# Closer

# Add a closing tag to all .html files

# if needed make a couple files
touch foo.html bar.html

for i in *.html; do
  # echo "$i"
  echo "hello world" >> $i # fails bad substition
done