# Webp
# this needs a download can I check if I have it?
# https://developers.google.com/speed/webp/docs/cwebp
# https://www.smashingmagazine.com/2018/07/converting-images-to-webp/
# I dont even start to understand this

find ./ -type f -name '*.$ext' | xargs -P 8 -I {} sh -c 'cwebp -af $1 -o "${1%.png}.webp"' _ {} \;
