Get some information about a movie and write the information down as the filename. A short summary about the movie will be the contents of the file.


https://github.com/chris12a/writemovieinfo

requires curl and a omdbapi.com api key (register for free)

THE KEY PROVIDED IS ONLY FOR TESTING PURPOSES!
PLEASE REGISTER AT OMDBAPI AND GET YOUR OWN KEY!  

After testing you might want to run this script by

ls -d --zero */ | xargs --null -I {} ./writemovieinfo.sh {}

Output and result:
![Screenshot from 2024-01-13 17-01-34](https://github.com/chris12a/writemovieinfo/assets/156455438/6f00c03e-4f0f-4af5-bd86-6c84b6fb985f)

![Screenshot from 2024-01-13 17-30-28](https://github.com/chris12a/writemovieinfo/assets/156455438/86551f14-4628-4aa4-b6be-ad548408351a)
