# Greater than each

ext=721;
ext=719;

my_array=(
1080
540
)

for i in "${my_array[@]}"; do
  echo "$i"
  if [ "$i" -gt "$ext" ]; then
    echo "yup"
  else
    echo "nope"
  fi
done
