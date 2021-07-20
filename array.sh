# This isnt in the resize its just rresting I'll remove it later
# for i in $lw; do
for i in 1 2 3; do # this works itd be nice to move the array out
  echo $i;
done


my_array=(
"¯\_(ツ)_/¯"
"This"
"is"
"a"
"string"
"array"
"ᕙ(⇀‸↼‶)ᕗ"
)

# single line
echo "array: ${my_array[@]}"

# one line each
echo "iterate over array"
for i in "${my_array[@]}"; do
  echo "$i"
done