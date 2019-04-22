#!/usr/bin/env bash

TEXMF="/usr/local/texlive/texmf-local/tex/latex/local/"

sudo cp -fr *.sty $TEXMF
sudo cp -fr *.cls $TEXMF
sudo cp -fr *.tex $TEXMF
sudo texhash

mkdir -p ~/.jupyter/templates       # make templates folder if not existing
cp -fr *.tplx ~/.jupyter/templates  # copy template files to path
