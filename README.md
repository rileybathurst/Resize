# Resize

## Really make sure you are in the right directory before running these scripts or it can change a lot of file

This is kinda a ridiculous thing I wanted to do thats overkill but I wanted to learn command line scripts and do a few specific things with image resizing.

### Careful to make sure this is in the right spot

```sh ~/Developer/resize/resize.sh```

### things to do 

- check how big something in an array is

[The Linux Documentation Project](https://tldp.org/guides.html)

- fi the end of an if statement is backwards if.
- sips this is the main tool we are using
  - -g = --getProperty
  - https://ss64.com/osx/sips.html

Theres some nice things like do ends in done. if ends in fi.

-p fails silently?
https://superuser.com/questions/165157/what-does-the-p-flag-do-in-mkdir-p
The -p flag will create nested directories, but only if they don't exist already.

we can only do one type of image per folder

## maybe I need to remove all folders before I start work?

## Im not currently renaming the orignal image but whatever

- loop through each format at a time, if known do it, if common list of known to not work .txt etc dont and ask about unknown files
- create the html document to accompany at then end
- drag and drop, but thats less of a proprity
  - if one file then create a folder to hold the images after
- have a quiet and verbouse readout
- check if I have the webp and png compression algerithms on the system before running them or do they fail silently?
- take pieces out into seperate files if I can. outside the loops things like name change
- document the png compression
- can I push the jpegs to jpeg mini? that was manual
- maybe replace all . in short filenames before the extension and replace them with - this happens automatically in screenshots, doesnt seem to cause issues but it could
- there was something about putting it in the dock but I cant remeber what it did and how
- for png and webp does  it become a node thing?
- if a file doesnt show an extension it gets it twice in the end, macs love not showing the extensions that are there
- I need the always show the extension
- reset the variables to logical order I go up and down in the letters
- if i dont like double dashes that much and I know how to make them and delete them I can just do that at the end? 🚨 except for when they are already in files?
- should i also rename the original file to get a width x height? I can do a check with double dashes if i can figure out the pull them from files
- auto generate the array of sizes by division or how much less each time, its doing all the work the more the better?
