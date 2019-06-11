#!/bin/bash

###############
# Ensure in correct location
MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized
cd $MY_PATH
###############

FILTER="$1"

LINKS_OUT="CHEATSHEETS.md"

function pandoc_build() {
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

    if [ -x "$(command -v convert)" ]; then
        convert "$OUT/$name.pdf" -background "#FFFFFF" -resize 350x -flatten "$OUT/$name.thumb.jpg" 
        convert -density 300 "$OUT/$name.pdf" -resize 50% -flatten "$OUT/$name.jpg" 
    fi


    ## Handle creating the LINKS.md markdown file (only when building all)
    if ! [ -n "$FILTER" ]; then
        echo "
### $name

[![$name PDF thumbnail](./$OUT/$name.thumb.jpg)](https://github.com/kickstartcoding/cheatsheets/raw/master/$OUT/$name.pdf)
" >> "$LINKS_OUT"
    fi

}

if [ -n "$FILTER" ] && [ $FILTER = "--watch" ]; then
    echo "Entering watch mode..."
    ls $2.md | entr -p ./build.sh /_
    exit 0
fi


## Handle creating the LINKS.md markdown file (only when building all)
if ! [ -n "$FILTER" ]; then
    echo "
# Cheatsheets

Click on one of the following thumbnails to download one of our cheatsheets.

" > "$LINKS_OUT"
fi


COHORT="2019-Summer"
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
pandoc_build name="cli-bash"
pandoc_build name="react-redux"

