#!/bin/sh

CURRENT_DIR="$(dirname "$(readlink -f "$0")")"
EXT="xsd"

if [ -z "$1" ]; then
  echo "Pass SAXON_JAR as the 1st parameter"
  exit 0
fi
SAXON_JAR="$1"

SCHEMAS_DIR="./gar_schemas"
if [ -z "$2" ]; then
  echo "Pass SCHEMAS_DIR as the 2nd parameter"
  exit 0
fi
SCHEMAS_DIR="$2"

if [ -z "$3" ]; then
  echo "Pass OUTPUT_DIR as the 3rd parameter"
  exit 0
fi
OUTPUT_DIR="$3"

for FILE in "$SCHEMAS_DIR"/*."$EXT"; do
  echo "handling '$FILE'"
  BASE_NAME="$(basename "$FILE" ."$EXT")"

  java -jar "$SAXON_JAR" -s:"$FILE" -xsl:"$CURRENT_DIR"/create-table.xslt -o:"$OUTPUT_DIR"/"$BASE_NAME".sql
done
