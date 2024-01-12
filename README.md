Get some information about a movie and write the information down as the filename. A short summary about the movie will be the contents of the file.


https://github.com/chris12a/writemovieinfo

requires curl and a omdbapi.com api key (register for free)

THE KEY PROVIDED IS ONLY FOR TESTING PURPOSES!
PLEASE REGISTER AT OMDBAPI AND GET YOUR OWN KEY!  

After testing you might want to run this script by

ls -d --zero */ | xargs --null -I {} ./writemovieinfo.sh {}
