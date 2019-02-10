#!/usr/bin/env bash

# generate, render and minify every html page and pdf resume
. render.sh

# create screenshot previews
/usr/bin/google-chrome --headless --disable-gpu --screenshot=///home/dodolord/Documents/Projecten/miladnazari.be/readmeFiles/index.png --window-size=1330,1720 https://miladnazari.be/
/usr/bin/google-chrome --headless --disable-gpu --screenshot=///home/dodolord/Documents/Projecten/miladnazari.be/readmeFiles/projects.png --window-size=1330,1720 https://miladnazari.be/projects
/usr/bin/google-chrome --headless --disable-gpu --screenshot=///home/dodolord/Documents/Projecten/miladnazari.be/readmeFiles/pageNotFound.png --window-size=1330,1720 https://miladnazari.be/blabla
convert -density 150 public/en/resume/cv-en.pdf[0] -quality 90 readmeFiles/latexPDF.png

# sync with git repository and hosting server
git add .
git commit -m "$1"
git push
ssh root@miladnazari.be 'cd /var/www/miladnazari.be; git pull'

# for later: qrencode -m 1 -o qr-code10.png "https://miladnazari.be"
