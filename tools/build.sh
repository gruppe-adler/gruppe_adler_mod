#!/usr/bin/env bash
### CONFIG ###
zip_path="$1"
modname="@gruppe_adler_mod"
pboprefix="grad_"
excluded=("tools" ".git" ".gitattributes" ".gitignore" ".travis.yml")


### AS AS USER, DONT EDIT BELOW THIS LINE ###

toolsDir=$(realpath "$(pwd)/$(dirname $0)")
baseDir=`dirname "${toolsDir}"`
platform=`uname`


if [[ ${platform} == "Linux" ]]; then
	armakePath="${toolsDir}/armake"
else
	armakePath="${toolsDir}/armake_w64.exe"
fi

if [[ ! -f ${armakePath} ]]; then
	echo "warning: armake binary not found at ${armakePath}, will not build pbo files!"
	exit 1
fi

#copy to release directory
releaseDir="$baseDir/release/$modname"
mkdir -p "$releaseDir"
cp -r "${baseDir}/addons" "${releaseDir}/addons"
cp "${baseDir}"/*.paa "${baseDir}"/*.cpp "${releaseDir}"


# remove excluded files/folders
if [ ${#excluded[@]} -gt 0 ]; then
	for excl in "${excluded[@]}"
	do
		rm -fr "$releaseDir/$excl"
	done
fi

# pbo and remove folders in addons directory
addonsdir="$releaseDir"/addons

find "$addonsdir" -maxdepth 1 ! -path "$addonsdir" -type d | while read component; do
	echo "packing $component"

	componentname=`basename "$component"`
	componentpath=`dirname "$component"`

	pbofilename="${pboprefix}${componentname}.pbo"
	pbofilepath="${componentpath}/$pbofilename"

	"${armakePath}" build -f -p "$component" "$pbofilepath"
	rm -r "$component"

	if [[ ! -f "$pbofilepath" ]]; then
		echo "failed"
		# rm -r "$releaseDir"
		exit 2
	fi
done

pushd "$baseDir" # get into git directory - elsewise we will not be able to get version info
	# get version
	head=`git reflog --decorate -1 --no-color`
	version=`echo ${head} | sed -re 's/^.*tag: ([0-9a-z\.\-]+).*$/\1/'`
popd

if [[ "$head" == "$version" ]]; then
	# ...if not, use commit hash
	version=`echo ${head} | sed -re 's/^([0-9a-f]+).*$/\1/g'`
fi

echo "current version: $version"
if [[ ${version} == "" ]]; then
	echo "cant find tag OR commit hash. are you sure we're having a .git directory here?"
	exit 2
fi


zipname="${modname}_$version"
if [[ ${platform} == "Linux" ]]; then
	tar -czf "$baseDir/release/${zipname}.tar.gz" -C "${baseDir}/release" ${modname}
else
	# check zipper
	if [[ ! -f ${zip_path} ]]; then
		zip_path="${toolsDir}/zip.exe"
	fi

	if [[ ! -f ${zip_path} ]]; then
		echo "warning: zip.exe not found, will not zip mod release!"
		exit 1
	fi

	pushd "${baseDir}/release"
		"${zip_path}" -r "$baseDir/release/${zipname}" "${modname}"
	popd
fi
