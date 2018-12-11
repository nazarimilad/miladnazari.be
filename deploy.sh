#!/usr/bin/env bash

hugo
/usr/bin/minify -r public/ --url 'text/html' -o public/

git add .
git commit -m "$1"
git push

ssh root@miladnazari.be 'cd /var/www/miladnazari.be; git pull'
