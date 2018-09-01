#!/bin/bash

THISDIR=`dirname $0`
PROJECTDIR=${THISDIR}/..

while getopts 'd:C:' OPTION; do
  case "$OPTION" in
    d)
      PROJECTDIR="$OPTARG"
      ;;
    C)
      WD="$OPTARG"
      ;;
    ?)
      echo "script usage: $(basename $0) -d project_directory [-C temp_dir]" >&2
      exit 1
      ;;
  esac
done

if [[ ${WD} != "" ]]
then
    BUILDDIR=${WD}/`date +%s`
    mkdir -p ${BUILDDIR}
    cp -r ${PROJECTDIR} ${BUILDDIR}
    pushd ${BUILDDIR}
else
    pushd ${PROJECTDIR}
fi

${THISDIR}/preprocess.sh
EXITCODE=$?
if [[ ${EXITCODE} != 0 ]]; then popd; exit ${EXITCODE}; fi

# remove hash comments, they confuse the hell out of sqflint
for SQFFILE in `find . -iname '*.sqf'`
do
    sed -i -E 's/^\s*#.*//g' "$SQFFILE"
done

sqflint -d . -ee
EXITCODE=$?
if [[ ${EXITCODE} != 0 ]]; then popd; exit ${EXITCODE}; fi

popd
