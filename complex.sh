# complex variables

# sips -g pixelWidth test.png | awk '{print $2}' # this does what I want but I want it as a variable
message=$(sips -g pixelWidth test.png | awk '{print $2}')
echo $message # ok now this works
