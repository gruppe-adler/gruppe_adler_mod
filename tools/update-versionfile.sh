#!/usr/bin/env bash

toolsDir=$(realpath "$(pwd)/$(dirname $0)")
baseDir=`dirname "${toolsDir}"`

echo "versionfile updater. looking for tag…"

version=$(git describe --always --tag)

versionfile="$baseDir/addons/main/script_mod.hpp"

IFS='.-' read -ra versionbits <<< ${version}
major=${versionbits[0]}
minor=${versionbits[1]}
patch=${versionbits[2]}
build=${versionbits[3]}
commit=$(echo ${versionbits[4]} | tr -d g)

re='^[0-9]+$'
if ! [[ ${major} =~ $re && ${minor} =~ $re && ${patch} =~ $re ]] ; then
   echo "not a release tag: '$version', not writing versionfile."
   exit
fi

echo "we're on version $major.$minor.$patch, build $build (commit $commit ). updating versionfile…"

sed -ie "s/define MAJOR.*/define MAJOR $major/" ${versionfile}
sed -ie "s/define MINOR.*/define MINOR $minor/" ${versionfile}
sed -ie "s/define PATCHLVL.*/define PATCHLVL $patch/" ${versionfile}
sed -ie "s/define BUILD.*/define BUILD $build/" ${versionfile}
sed -ie "s/define COMMIT.*/define COMMIT $commit/" ${versionfile}

echo "…done :)"
