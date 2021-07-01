### Add tmp directory

if [ -d "./tmp" ]
then
	rm -rf tmp/
	ls
fi
mkdir tmp

cp -r ./phylson/essentialz ./tmp
cp -r ./phylson/languages/dart ./tmp

ls

lua references_framework.lua

###rm -rf tmp/