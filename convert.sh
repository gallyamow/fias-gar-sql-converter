#!/bin/sh

CURRENT_DIR="$(dirname "$(readlink -f "$0")")"
EXT="XML"

if [ -z "$1" ]; then
  echo "Pass SAXON_JAR as the 1st parameter"
  exit 0
fi
SAXON_JAR="$1"

if [ -z "$2" ]; then
  echo "Pass XML_DIR as the 2nd parameter"
  exit 0
fi
XML_DIR="$2"

if [ -z "$3" ]; then
  echo "Pass OUTPUT_DIR as the 3rd parameter"
  exit 0
fi
OUTPUT_DIR="$3"

if [ -z "$4" ]; then
  echo "Pass version of delta as the 4th parameter or 0 when you are importing a whole data"
  exit 0
fi
DELTA_VERSION="$4"

for FILE in "$XML_DIR"/*."$EXT"; do
  echo "handling '$FILE'"
  BASE_NAME="$(basename "$FILE" ."$EXT")"

  java -jar "$SAXON_JAR" -s:"$FILE" -xsl:"$CURRENT_DIR"/convert.xslt -o:"$OUTPUT_DIR"/"$BASE_NAME".sql deltaVersion="$DELTA_VERSION"
done
