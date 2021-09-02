#!/bin/bash
printf 'Waiting for ExMan to start'
until $(curl -X GET --output /dev/null --silent --head --fail http://localhost/exman); do
    printf '.'
    sleep 5
done

echo "Exman started, posting some expeditions"


curl --location --request POST 'http://localhost/exman/expedition' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name":"Mars",
    "items":[
        {"name":"Roboter", "weight": 184, "profit": 12400},
        {"name":"Messstation", "weight": 144, "profit": 8900},
        {"name":"Kommunikation", "weight": 85, "profit": 14500},
        {"name":"Fahrzeug", "weight": 207, "profit": 11600},
        {"name":"Labor", "weight": 278, "profit": 19000}
     ]
}'

curl --location --request POST 'http://localhost/exman/expedition' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name":"Atlantik",
    "items":[
        {"name":"Taucherblei", "weight": 9, "profit": 50},
        {"name":"Anzug", "weight": 3, "profit": 60},
        {"name":"Sauerstoff", "weight": 12, "profit": 80},
        {"name":"Proviant", "weight": 14, "profit": 20},
        {"name":"Kamera", "weight": 5, "profit": 95},
        {"name":"Beleuchtung", "weight": 8, "profit": 75}
     ]
}'

curl --location --request POST 'http://localhost/exman/expedition' \
--header 'Content-Type: application/json' \
--data-raw '{
    "name":"Sibirien",
    "items":[
        {"name":"Bohrstock", "weight": 4, "profit": 180},
        {"name":"Messsonde", "weight": 2, "profit": 350},
        {"name":"Bohrmaschine", "weight": 8, "profit": 240},
        {"name":"Schaufel", "weight": 2, "profit": 110},
        {"name":"Pickel", "weight": 4, "profit": 120},
        {"name":"Spektrometer", "weight": 14, "profit": 180}
     ]
}'

echo "All expedition posted, done."