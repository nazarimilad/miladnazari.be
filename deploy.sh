#!/usr/bin/env bash

# generate and render web pages
hugo
# minify every html page
/usr/bin/minify -r public/ --url 'text/html' -o public/

# sync with git repository and hosting server
git add .
git commit -m "$1"
git push
ssh root@miladnazari.be 'cd /var/www/miladnazari.be; git pull'
