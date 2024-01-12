#!/bin/bash

#	https://github.com/chris12a
#	requires curl, omdbapi.com api key (register for free)
#	PLEASE REGISTER AT OMDBAPI AND GET YOUR OWN KEY!  
#	you might want to run this scrpit by
#	ls -d --zero */ | xargs --null -I {} ./writemovieinfo.sh {}

script_name=$(basename "$0")

help_message(){
  echo " Provide the movie title as one parameter or use
 ls -d --zero */ | xargs --null -I {} ./$script_name {}
 for the whole folder."
}

process_user_input(){
  # Movie name provided as command line argument
  movie_name=$1
  # remove everything beginning from the first ( on and the white spaces before it
  movie_name="${movie_name%%(*}"
  movie_name="${movie_name%"${movie_name##*[![:space:]]}"}"
  # spaces to plus
  movie_name2=${movie_name// /+}
  #unescape
  movie_name2=$(echo "$movie_name2")
  #echo $movie_name2
  #exit 1
}

# get movie details from omdbapi
get_movie_data(){
  response=$(curl -s "http://www.omdbapi.com/?t=$movie_name2&apikey=d1bde4bd")
  # save relevant movie infos from the response
  title=$(echo "$response" | jq -r '.Title')
  # to fix: () will be deleted later:
  year=\($(echo "$response" | jq -r '.Year')\)
  rating=imdb\ $(echo "$response" | jq -r '.imdbRating')
  # to fix: Metascore is not working!?
  #metascore=$(echo "$response" | jq -r '.Metascore')
  genre=genre\ $(echo "$response" | jq -r '.Genre')
  plot=$(echo "$response" | jq -r '.Plot')

#echo $movie_name2
#echo $title
}

write_file(){
#if [[ "${movie_name2,,}" == "${title,,}" ]]; then
	# Print the movie details
	#echo "$plot" > "$filename"


  filename=$(echo "$title $year $rating $genre" | tr -d '[:punct:]').txt
  # to do: check if file exists and write only if -f parameter provided
  echo "$plot" > "$filename"
  echo "File: $filename" written...
  #else
  # echo "Movie not found!"
  #fi
}

main(){
  # Check if one title provided
  if [[ $# -ne 1 ]]; then
    help_message
    exit 1
  fi

  process_user_input "$1"
  get_movie_data
  write_file
}

main "$@"
exit 0

