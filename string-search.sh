string='My🦄long string'
if [[ $string == *"My long"* ]];
then
  echo "It's there!"
else 
  echo "It's not there!"
fi