#!/usr/bin/env bash

# generate, render and minify every html page
hugo --minify

# generate pdf resumes in every language
LANGUAGES=(en nl)
for i in "${LANGUAGES[@]}"
do
    cp public/$i/resume/index.html public/$i/resume/cv-$i.tex
    pdflatex -output-directory=public/$i/resume/ public/$i/resume/cv-$i.tex output-format=pdf
    rm public/$i/resume/*.aux
    rm public/$i/resume/*.log
    rm public/$i/resume/*.out
done

