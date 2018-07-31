#!/bin/bash

###############
# Ensure in correct location
MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
cd $MY_PATH
###############

FILTER="$1"

function pandoc_build() {
    local $*
    COHORT="2018-Spring"
    TEMPLATE="$MY_PATH/templates/cheatsheet.latex"

    # Provides the option of selecting only certain cheatsheets 
    if [ -n "$FILTER" ] && [[ ! $name =~ "$FILTER" ]]; then
        return
    fi

    echo "$name  ->  $OUT/$name.pdf"
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


IN="kickstart-backend"
OUT="build/kickstart-backend"
pandoc_build name="1-html-css"
pandoc_build name="2-bash-git"
pandoc_build name="3-python"
pandoc_build name="4-modules-oop"
pandoc_build name="5-http"
pandoc_build name="6-django"
pandoc_build name="7-orm"
pandoc_build name="8-postgres"


IN="kickstart-frontend"
OUT="build/kickstart-frontend"
pandoc_build name="1-css"
pandoc_build name="2-javascript"
pandoc_build name="3-react"
pandoc_build name="4-components"


IN="topical"
OUT="build/topical"
pandoc_build name="py-es6"
pandoc_build name="python"

