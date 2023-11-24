#!/usr/bin/env bash

# This script generate a folder with a markdown document that is processed
# from a logseq export. The folder contains all necessary elements to reproduce
# the output document, including bibtex file with all used references, a
# citation style file and images that were used in the document.

FILE="$1"
FORMAT="$2"  # e.g. scientific_abstract
OUT_FORMAT="$3"  # e.g. docx, pdf

WD_FILE=$(dirname "$FILE")
FILENAME=$(basename "$FILE")
CLEANED_FILENAME="${FILENAME//\\/}"
echo "INFO: Working in $WD_FILE on $CLEANED_FILENAME ..."

# automatically change file extension
mkdir -p "$WD_FILE/$FORMAT"
mkdir -p "$WD_FILE/$FORMAT/assets"

PROCESSED_MARKDOWN=${CLEANED_FILENAME%.*}.md
PROCESSED_MARKDOWN=${PROCESSED_MARKDOWN// /_}
OUTPUT_FILE=${PROCESSED_MARKDOWN%.*}.$OUT_FORMAT

# logseq pages path is important to fetch assets
LOGSEQ_PAGES_PATH=~/notes/flo/pages/
echo "INFO: Located logseq pages location: $LOGSEQ_PAGES_PATH (relevant for asset import)"

# get directory of script
SDIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# replace double braces with sed and combine multiple braces with sed
cat "$WD_FILE/$CLEANED_FILENAME" | \
    sed "s/\[\[/\[/g" | \
    sed "s/\]\]/\]/g" | \
    sed "s/\], \[/, /g" > \
    "$WD_FILE/$FORMAT/tmp_$PROCESSED_MARKDOWN"

echo "INFO: Replaced double square parentheses and combined citation keys."

# find preamble to be combined with the body
PREAMBLE=$SDIR/formats/$FORMAT/preamble.md
echo "INFO: Using preamble: $PREAMBLE" 

# get citation style from 
CITSTY=$(grep "^csl" "$PREAMBLE" | sed "s/csl: //" | sed -r 's/(.*csl).*/\1/')
cp "$SDIR/../resources/citation_styles/$CITSTY" "$WD_FILE/$FORMAT/$CITSTY"
echo "INFO: Using citation style $CITSTY"

# copying resources
ASSETS=$(grep /assets/ "$WD_FILE/$FORMAT/tmp_$PROCESSED_MARKDOWN" | \
    grep -o '(.*)' | sed 's/[()]//g')   # gets value within parentheses

for i in $ASSETS; do
    # echo "$i"
    NEW_LOC_ASSET=$(echo $i | sed 's/..\/assets\//assets\//g')
    OLD_LOC_ASSET=${LOGSEQ_PAGES_PATH}$i
    cp "$OLD_LOC_ASSET" "$WD_FILE/$FORMAT/$NEW_LOC_ASSET"
done

# NEW_LOC_ASSETS=$(echo $ASSETS | sed 's/..\/assets\//assets\//g')
# echo $ASSETS | sed -e "s/^/${LOGSEQ_PAGES_PATH}/"
# echo $NEW_LOC_ASSETS
# cp $ASSETS 

# replace asset paths in markdown document
sed 's/..\/assets\//assets\//g' "$WD_FILE/$FORMAT/tmp_$PROCESSED_MARKDOWN" > \
    "$WD_FILE/$FORMAT/tmp2_$PROCESSED_MARKDOWN"

# create a bib file only for the cited references
pandoc "$WD_FILE/$FORMAT/tmp2_$PROCESSED_MARKDOWN" \
    --bibliography ~/zotero-library.bib \
    --lua-filter "$SDIR/extract_bib.lua" \
    -o "$WD_FILE/$FORMAT/references.bib"

# store combined markdown format and remove temp file
cat "$PREAMBLE" "$WD_FILE/$FORMAT/tmp2_$PROCESSED_MARKDOWN" > "$WD_FILE/$FORMAT/${PROCESSED_MARKDOWN}"
rm "$WD_FILE/$FORMAT/tmp_$PROCESSED_MARKDOWN" "$WD_FILE/$FORMAT/tmp2_$PROCESSED_MARKDOWN"

OLD_DIR=$(pwd)
cd $WD_FILE/$FORMAT

# combine preamble and markdown file and process with pandoc
pandoc "$PROCESSED_MARKDOWN" \
    -o "$OUTPUT_FILE" \
    --citeproc \

cd $OLD_DIR

echo "INFO: Coverted document."

unset WD_FILE
unset OUT_FORMAT
unset CLEANED_FILENAME
unset OUTPUT_FILE
unset PROCESSED_MARKDOWN
unset FILE
unset OUTPUT
unset FORMAT
unset LOGSEQ_PAGES_PATH
unset SDIR
unset PREAMBLE
