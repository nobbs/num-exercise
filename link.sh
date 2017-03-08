#!/usr/bin/env bash

# get the local tex tree path
TEXMF=$(kpsewhich -var-value=TEXMFHOME)
echo $TEXMF

# create directory if non existant
mkdir -p $TEXMF/tex/generic

# link everything
ln -f -s $PWD/num_exercise.cls $TEXMF/tex/latex
ln -f -s $PWD/exsheets $TEXMF/tex/latex
