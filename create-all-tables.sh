#!/bin/sh

CURRENT_DIR="$(dirname "$(readlink -f "$0")")"
SAXON_JAR="/opt/saxon/saxon-he-10.5.jar"
EXT="xsd"

SCHEMAS_DIR="./gar_schemas"
if [ -z "$1" ]; then
  echo "PASS SCHEMAS_DIR as the first parameter"
  exit 0
fi
SCHEMAS_DIR="$1"

if [ -z "$2" ]; then
  echo "PASS OUTPUT_DIR as the second parameter"
  exit 0
fi
OUTPUT_DIR="$2"

for FILE in "$SCHEMAS_DIR"/*."$EXT"; do
  echo "handling '$FILE'"
  BASE_NAME="$(basename "$FILE" ."$EXT")"

  java -jar "$SAXON_JAR" -s:"$FILE" -xsl:"$CURRENT_DIR"/create-table.xslt -o:"$OUTPUT_DIR"/"$BASE_NAME".sql
done
