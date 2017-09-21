### CONFIG ###
armake_path="$1"
zip_path="$1"
modname="@gruppe_adler2"
moddirectoryname="gruppe_adler_mod"
pboprefix="grad_"
excluded=("tools" ".git" ".gitattributes" ".gitignore" ".travis.yml")

### AS AS USER, DONT EDIT BELOW THIS LINE ###


# check cpbo
if [[ ! -f $armake_path ]]; then
	armake_path="./armake_w64.exe"
fi

if [[ ! -f $armake_path ]]; then
	echo "warning: armake_w64.exe not found, will not build pbo files!"
	exit 1
fi


#copy to release directory
releasedir="../../release/$modname"
mkdir -p "$releasedir"
cp -r ../ "$releasedir"


# remove excluded files/folders
if [ ${#excluded[@]} -gt 0 ]; then
	for excl in "${excluded[@]}"
	do
		rm -fr "$releasedir/$excl"
	done
fi


# pbo and remove folders in addons directory
addonsdir="$releasedir/addons"
for component in `find "$addonsdir" -maxdepth 1 ! -path "$addonsdir" -type d`
do
	echo "packing $component"

	componentname=`basename $component`
	componentpath=`dirname $component`

	pbofilename="${pboprefix}${componentname}.pbo"
	pbofilepath="${componentpath}/$pbofilename"

	$armake_path build -f -p "$component" $pbofilepath
	rm -r "$component"

	if [[ ! -f "$pbofilepath" ]]; then
		echo "failed"
		# rm -r "$releasedir"
		exit 2
	fi
done


# get version
head=`git reflog --decorate -1 --no-color`
version=`echo $head | sed -re 's/^.*tag: ([0-9a-z\.\-]+).*$/\1/'`

if [[ "$head" == "$version" ]]; then
	# ...if not, use commit hash
	version=`echo $head | sed -re 's/^([0-9a-f]+).*$/\1/g'`
fi

echo "current version: $version"
if [[ $version == "" ]]; then
	echo "cant find tag OR commit hash. are you sure we're having a .git directory here?"
	exit 2
fi


# check zipper
if [[ ! -f $zip_path ]]; then
	zip_path="./zip.exe"
fi

if [[ ! -f $zip_path ]]; then
	echo "warning: zip.exe not found, will not zip mod release!"
	exit 1
fi


# zip release
zipname="${modname}_$version"
cp -r $releasedir ./
$zip_path -r $zipname $modname
rm -fr $modname
mv ./${zipname}.zip  ../../release/${zipname}.zip
