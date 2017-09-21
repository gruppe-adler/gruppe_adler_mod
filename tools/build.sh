### CONFIG ###
armake_path="$1"
modname="@gruppe_adler2"
moddirectoryname="grad"
excluded=()

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
releasedir="../release"
mkdir -p "$releasedir"
cp -r ../"$moddirectoryname"/ "$releasedir"
mv "$releasedir/$moddirectoryname" "$releasedir/$modname"


# remove excluded files/folders
if [ ${#excluded[@]} -gt 0 ]; then
	for excl in "$excluded"
	do
		rm -r "$releasedir/$modname/$excl"
	done
fi


# pbo and remove folders in addons directory
addonsdir="$releasedir/$modname/addons"
for component in `find "$addonsdir" -maxdepth 1 ! -path "$addonsdir" -type d`
do
	echo "packing $component"
	$armake_path build -f -p "$component" "${component}.pbo"
	rm -r "$component"

	pbofilename="${component}.pbo"
	if [[ ! -f "$pbofilename" ]]; then
		echo "failed"
		rm -r "$releasedir"
		exit 2
	fi
done
