#!/bin/bash

DIRECTORY=`dirname $0`/..

while getopts 'd:' OPTION; do
  case "$OPTION" in
    d)
      DIRECTORY="$OPTARG"
      ;;

    ?)
      echo "script usage: $(basename $0) [-d project_directory]" >&2
      exit 1
      ;;
  esac
done


pushd "$DIRECTORY"

acedir="z/ace"
cbadir="x/cba"

if [[ -d ${cbadir} ]]; then
    echo "INFO it seems we already got the cba macros in $cbadir…"
else
    echo "INFO getting CBA headers and extracting to $cbadir…"
    mkdir -p ${cbadir} && wget "http://gruppe-adler.de/api/travis/cba.tar.gz" && tar -xf cba.tar.gz -C ${cbadir}
fi

if [[ -d ${acedir} ]]; then
    echo "INFO it seems we already got the ace macros in $acedir…"
else
    echo "INFO getting ACE headers and extracting to $acedir…"
    mkdir -p ${acedir} && wget "http://gruppe-adler.de/api/travis/ace.tar.gz" && tar -xf ace.tar.gz -C ${acedir}
fi

INCLUDINGFILES=`grep -lire '^\s*#include'`

echo "INFO editing #include clauses: forward-slashes, relative cba/ace paths…"

for INCLUDEFILE in ${INCLUDINGFILES}; do
    sed -i '/#include/s/\\/\//g' "$INCLUDEFILE"
    sed -i '/#include/s/\/x\/cba/x\/cba/' "$INCLUDEFILE"
    sed -i '/#include/s/\/z\/ace/z\/ace/' "$INCLUDEFILE"
    sed -i '/#include/s/\/x\/grad\///' "$INCLUDEFILE"
done
echo "INFO removing illegal double-hash from macro files…"
for MACROFILE in `find . -iname '*.cpp' -or -iname '*.hpp' -or -iname '*.h'`; do sed -i -e 's/##//g' "$MACROFILE"; done

echo "INFO starting preprocessing of SQF files…"
for SQFFILE in `find . -iname '*.sqf'`; do cpp -iquote ./ "$SQFFILE" "${SQFFILE}.1" && mv  "${SQFFILE}.1" "$SQFFILE"; done

popd
