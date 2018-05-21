#!/bin/bash

# CONFS

## Email address (or addresses, split using comma) to send the email to
RECIPIENT="send-email-to@example.com"

## Sender of the email
FROM="send-email-from@example.com"

## Relay host. When using Docker it will probably be the IP address of the host (for the interface
## available from the containers, something like 172.X.0.1). You can also modify the `sendemail`
## command below to use an external relay. In that case you will probably want to use -xu and -xp
## to provide username and password. Check Sendemail help page for details:
## http://caspian.dotconf.net/menu/Software/SendEmail/
SMTP="127.0.0.1:25"

#-- end confs


## Don't edit below this line if you don't know what you're doing!

echo -e "Scraping..."
node ./main.js

echo -e "Sending email..."
title="Pediatri il $(date +%Y-%m-%d)"
body="Ecco i pediatri disponibili oggi"

sendemail -f "${FROM}" -t "${RECIPIENT}" -u "${title}" -m "${body}" -a result.png -s "${SMTP}"

echo -e "Cleanup..."
rm result.png
