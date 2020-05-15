#!/bin/bash

#
# Ensure in correct location
MY_PATH="`dirname \"$0\"`"
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"
cd $MY_PATH


#
# Detect Pandoc version
if  [[ $(pandoc --version) == pandoc\ 1* ]] ;
then
    #echo 'Pandoc version 1 detected'
    PANDOC_PDF_OPTION='--latex-engine'
else
    #echo 'Assuming Pandoc version 2'
    PANDOC_PDF_OPTION='--pdf-engine'
fi

FILTER="$1"
if [ -z "$FILTER" ]; then
    echo "USAGE

To re-build all cheatsheets:

$0 --all

To re-build only certain ones, or ones that match a search criteria:

$0 python
$0 ./kickstart-backend/5-http.md

To use entr to watch for changes and rebuild a particular cheatsheet (supply
path, but omit extension):

$0 --watch topical/python
"
    exit 0
fi


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
        "$PANDOC_PDF_OPTION" pdflatex\
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


COHORT="Cheatsheet"
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
pandoc_build name="3.5-useeffect"
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

