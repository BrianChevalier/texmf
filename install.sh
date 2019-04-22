#!/usr/bin/env bash

TEXMF="/usr/local/texlive/texmf-local/tex/latex/local/"

cp -fr *.sty $TEXMF
cp -fr *.cls $TEXMF

# Finish install
#sudo texhash
