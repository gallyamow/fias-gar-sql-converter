#!/bin/sh

CURRENT_DIR="$(dirname "$(readlink -f "$0")")"
SAXON_JAR="/opt/saxon/saxon-he-10.5.jar"
EXT="XML"

if [ -z "$1" ]; then
  echo "PASS XML_DIR as the first parameter"
  exit 0
fi
XML_DIR="$1"

if [ -z "$2" ]; then
  echo "PASS OUTPUT_DIR as the second parameter"
  exit 0
fi
OUTPUT_DIR="$2"

if [ -z "$3" ]; then
  echo "PASS (yes/no) IS_DELTA as the third parameter"
  exit 0
fi
IS_DELTA="$3"

for FILE in "$XML_DIR"/*."$EXT"; do
  echo "handling '$FILE'"
  BASE_NAME="$(basename "$FILE" ."$EXT")"

  java -jar "$SAXON_JAR" -s:"$FILE" -xsl:"$CURRENT_DIR"/import.xslt -o:"$OUTPUT_DIR"/"$BASE_NAME".sql upsert="$IS_DELTA"
done
