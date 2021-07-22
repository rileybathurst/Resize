# bash organize

# https://stackoverflow.com/questions/7442417/how-to-sort-an-array-in-bash

array=(a c b f 3 5)

IFS=$'\n' sorted=($(sort <<<"${array[*]}"))
unset IFS

echo "Sorted array: ${sorted[*]}"
