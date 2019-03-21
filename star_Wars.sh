#!/bin/bash

which jq pv gawk base64 zcat gzip 1>/dev/null
if [ $? -eq 1 ];
    then
      echo "$? Missing LIBS"
      exit
fi
# TODO ADD CHECKS for required Apps
# TODO ADD Error checks for curl and jq
# TODO ADD Lookup for ship ART

NOW=$(date +%s) #START TIME
URL="https://swapi.co/api/starships/" #ENTRY URL
NEXT=$(curl -s $URL |jq -r -c .next) #NEXT URL
. data.sh

echo -e "\n\n\n\n\e[1;34m\t[ $(echo $cont | base64 -d | zcat) ] \a\n\n\t[ STARWARS STATIC API ] \n\n\t[ The playback has been slowed down for your viewing enjoyment! ]\e[0m" | pv -L10 2>/dev/null
## LOGO for added cinematic output
echo -e "\e[2m" #SET TEXT COLOR
echo $logo | base64 -d | zcat |pv -L800 2>/dev/null #READ LOGO at bytes/s
echo -e "\e[0m" #RESET TERM COLOR
printf "\n\t\e[1;31m [ Initializing; Subspace transceiver.. ]\n\n\t [ Transceiver: [\e[1;5;32mREADY\e[0m\e[1;31m] ]\n\n\t [ Receiving long range transmission.. ]\n\n\n\e[0m" | pv -L12 2>/dev/null

processing() #processing function; slow character for added cinematic effect 15/20 bytes/s
{
    curl -s $1 |jq -r -c '.results[] | select((.name) and .pilots!=[]) | {name, pilots}'\
    |while read line; 
        do 
            echo -e "\e[33mStarship: $(echo $line | jq -c '.name')\e[0m"\
            |pv -L15 2>/dev/null
            echo -e "\e[178mPilots: \t\t\n$(echo $line | jq -c '.pilots' \
            |while read url; do curl -s $(echo $url |tr -d '["]' | tr ',' '\n')\
            |jq '.name' ;done) \e[0m"\
            |pv -L20 2>/dev/null
    done
}

while true
    do
    
if [[ "$NEXT" =~ ^https://*/ ]] && [[ "$NEXT" != null ]]; #if next has https and is not null then run processing function and set NEXT to NEXT url
    then
            #echo "NEXT-> $NEXT"
            processing $NEXT
            NEXT=$(curl -s $NEXT |jq '.next | @text' | tr -d '"')
            
    else
            #echo DONE
            processing $URL # Process first URL ENTRY Page
            break
            
fi
done

DONE=$(date +%s)
echo -e "\a\n\t[ TRANSMISSION TIME: $(expr $DONE - $NOW)/seconds]\n" #Time ship/pilots api with out effect 22 seconds with effects 90 seconds
read -p "Press Return/Enter for extra content" #If interactive docker run -it NAME

#added cinematic effect 300 bytes/s and just for fun because I want you to remember me =) Rex
echo -e "\e[178m"
echo $intro |base64 -d |zcat |pv -L 300 2>/dev/null 
echo -e "\e[0m"
