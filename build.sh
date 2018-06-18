#!/bin/bash

###############
# Ensure in correct location
MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
cd $MY_PATH
###############

function pandoc_build() {
    local $*
    COHORT="2018-Spring"
    TEMPLATE="$MY_PATH/templates/cheatsheet.latex"
    echo "Building $name..."
    pandoc\
        -f markdown\
        "$IN/$name.md"\
        --variable=cohort:$COHORT\
        -t latex\
        --template "$TEMPLATE"\
        --latex-engine pdflatex\
        --toc-depth 1\
        -o "$OUT/$name.pdf"
}

###############
# First do backend templates
IN="kickstart-backend"
OUT="build/kickstart-backend"
#pandoc_build name="1-html-css"
#pandoc_build name="2-bash-git"
#pandoc_build name="3-python"
#pandoc_build name="4-modules-oop"
#pandoc_build name="5-http"
#pandoc_build name="6-django"
pandoc_build name="7-orm"

#IN="kickstart-frontend"
