#!/bin/bash

###############
# Ensure in correct location
MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
cd $MY_PATH
###############

FILTER="$1"

function pandoc_build() {
    COHORT="2018-Fall"
    local $*
    TEMPLATE="$MY_PATH/templates/cheatsheet.latex"
    IN_PATH="$IN/$name.md"

    #################################
    # Provides the option of selecting only certain cheatsheets
    # If we specify a path instead of a search param, lets check for that too (used by entr)
    if [ -n "$FILTER" ] && [[ ! $name =~ "$FILTER" ]] && [[ ! "$FILTER" -ef "$IN_PATH" ]]; then
        return
    fi

    echo "$name  ->  $OUT/$name.pdf"
    pandoc\
        -f markdown\
        "$IN_PATH"\
        --variable=cohort:$COHORT\
        -t latex\
        --template "$TEMPLATE"\
        --latex-engine pdflatex\
        --toc-depth 1\
        -o "$OUT/$name.pdf"
}

if [ -n "$FILTER" ] && [ $FILTER = "--watch" ]; then
    echo "Entering watch mode..."
    ls $2.md | entr -p ./build.sh /_
    exit 0
fi

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
pandoc_build name="5-mern"
pandoc_build name="6-industry"
pandoc_build name="7-algorithms"


IN="topical"
OUT="build/topical"
COHORT="Cheatsheet"
pandoc_build name="javascript-for-pythonistas"
pandoc_build name="python-for-js-developers"
pandoc_build name="python"
pandoc_build name="modern-html-css"
pandoc_build name="django"

