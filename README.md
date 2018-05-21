# Pediatri disponibili

Questo programma accede alla pagina dei pediatri disponibili presso la
Azienda USL Toscana Centro ed effettua uno screenshot della tabella
che contiene i nomi e lo stato.
Lo screenshot viene poi inviato via email.

## Setup

Editare il file `run.sh` personalizzando le configurazioni.

Buildare l'immagine docker: `docker build -t pediatri .`

## Run

`docker run -it --rm pediatri`

Se non si vuole utilizzare docker:

`npm install && ./run.sh`
