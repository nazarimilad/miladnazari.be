#!/usr/bin/env bash

# generate, render and minify every html page
hugo --minify
# print the PDF-verions of the CV
hugo server -D &
sleep 3
/usr/bin/google-chrome-stable --headless --disable-gpu --print-to-pdf=///home/dodolord/Documents/Projecten/miladnazari.be/public/en/Milad-Nazari-en.pdf --no-margins http://localhost:1313/
sleep 3
/usr/bin/google-chrome-stable --headless --disable-gpu --print-to-pdf=///home/dodolord/Documents/Projecten/miladnazari.be/public/nl/Milad-Nazari-nl.pdf --no-margins http://localhost:1314/
sleep 3
PID=$!
sleep 2
kill $PID

# sync with git repository and hosting server
git add .
git commit -m "$1"
git push
ssh root@miladnazari.be 'cd /var/www/miladnazari.be; git pull'
