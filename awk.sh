# awk
# sips pixelWidth gives a return like pixelWidth: 1296
# I only want the number

# https://unix.stackexchange.com/questions/338000/bash-assign-output-of-pipe-to-a-variable

# for i in *; do
#   pixels=$(sips -g pixelWidth "$i")
#   echo $pixels
#   awk='/pixelWidth:/{print $2}
# done

# the | pipe just joins the two together

test="🦄 🦖"
echo $test
echo $test | awk '{print $2}'
more=$(sips -g pixelWidth test.png | awk '{print $2}') # fails
echo $more

for i in *; do
  pixelWidth=$(sips -g pixelWidth $i | awk '{print $2}') # fails
  echo $pixelWidth
done