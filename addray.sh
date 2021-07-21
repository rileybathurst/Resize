# Addray

# add to an array using this for the file formats we have to deal with.

addray=()

for i in "${addray[@]}"; do
  echo "$i"
done

for j in *; do
  addray+=("$j")
done

for k in "${addray[@]}"; do
  echo "full array $k"
done