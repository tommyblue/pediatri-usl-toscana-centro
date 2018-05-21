#!/bin/bash

# CONFS
RECIPIENT="send-email-to@example.com"
FROM="send-email-from@example.com"
SMTP="127.0.0.1:25"

echo -e "Scraping..."
node ./main.js

echo -e "Sending email..."
title="Pediatri il $(date +%Y-%m-%d)"
body="Ecco i pediatri disponibili oggi"

sendemail -f "${FROM}" -t "${RECIPIENT}" -u "${title}" -m "${body}" -a result.png -s "${SMTP}"

echo -e "Cleanup..."
rm result.png
