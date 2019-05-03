#!/usr/bin/env bash

# Initialize file structure for user added packages and files
# Not the admin level texmf tree
tlmgr init-usertree

# The user texmf tree is different on different platforms
# The path is defined based on platform
if [[ "$OSTYPE" == "linux-gnu" ]]; then
        # Debian/Ubuntu
        TEXMF="$HOME/texmf/tex/latex/local"
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        TEXMF="$HOME/Library/texmf/tex/latex/local/"
fi

mkdir -p $TEXMF       # make local texmf directory structure if not existing

# Copy files to the texmf tree.
cp *.sty $TEXMF
cp *.cls $TEXMF
cp *.tex $TEXMF
texhash              # Update tex tree

# Copy jupyter nbconvert templates
mkdir -p ~/.jupyter/templates       # make templates folder if not existing
cp -fr *.tplx ~/.jupyter/templates  # copy template files to path
