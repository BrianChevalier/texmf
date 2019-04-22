#!/usr/bin/env bash

TEXMF="/usr/local/texlive/texmf-local/tex/latex/local/"

sudo cp -fr *.sty $TEXMF
sudo cp -fr *.cls $TEXMF
sudo cp -fr *.tex $TEXMF
sudo texhash
