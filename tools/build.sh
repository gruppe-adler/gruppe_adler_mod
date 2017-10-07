#!/usr/bin/env bash
### CONFIG ###
zip_path="$1"
modname="@gruppe_adler_mod"
pboprefix="grad_"

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

bash "${toolsDir}/update-versionfile.sh"

#copy to release directory
releaseDir="$baseDir/release/$modname"
mkdir -p "$releaseDir"
cp -r "${baseDir}/addons" "${releaseDir}/"
cp -r "${baseDir}/optionals" "${releaseDir}/"
cp "${baseDir}"/*.paa "${baseDir}"/*.cpp "${baseDir}/README.md" "${releaseDir}/"


build_pbo() {
	componentname=`basename "${1}"`
	componentpath=`dirname "${1}"`
	echo "packing $componentname"

	pbofilename="${pboprefix}${componentname}.pbo"
	pbofilepath="${componentpath}/$pbofilename"

	"${armakePath}" build -f -p "${1}" "$pbofilepath"

	if [[ ! -f "$pbofilepath" ]]; then
		echo "failed"
		exit 2
	fi
}

merge_readme() {
	componentname=`basename "${1}"`
	componentpath=`dirname "${1}"`
	echo "merging $componentname readme"

	sed -i '$a ***' "${releaseDir}/README.md"
	cat "$componentpath/$componentname/README.md" >> "$releaseDir/README.md"
}

pack_directory() {
	find "$1" -maxdepth 1 ! -path "$1" -type d | while read component; do
		merge_readme "${component}"
		build_pbo "${component}"
		rm -r "${component}"
	done
}

#format readme
readmeFile="${releaseDir}/README.md"

sed -i '4d' "${readmeFile}"
sed -i '7,$d' "${readmeFile}"
sed -i '$a ***\n***' "${readmeFile}"
sed -i '$a ## Components' "${readmeFile}"
sed -i '$a These components are part of Gruppe Adler Mod.' "${readmeFile}"
pack_directory "$releaseDir/addons"

sed -i '$a ***\n***' "${readmeFile}"
sed -i '$a ## Optional Components' "${readmeFile}"
sed -i '$a These components are are whitelisted on our servers. You can activate a component by moving its *.pbo file from *the optionals* to the addons *directory*.' "${readmeFile}"
pack_directory "$releaseDir/optionals"

npm install -g markdown-pdf
markdown-pdf "${readmeFile}"
rm "${readmeFile}"


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

### version removed from zip filename until we figure out how to tell travis ###

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
