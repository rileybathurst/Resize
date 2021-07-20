# Width Rename

# Awk is abbreviated from the names of the developers – Aho, Weinberger, and Kernighan
# used to grab parts of an array

for i in * do
  # width
  # imgwidth=`sips --getProperty pixelWidth "$i" | awk '/pixelWidth/ {print $2}'`
  echo sips -g pixelWidth
done