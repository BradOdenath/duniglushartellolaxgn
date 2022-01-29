### Add tmp directory

if [ -d "./tmp" ]
then
	rm -rf tmp/
fi
mkdir tmp

if [ -d "./essentialz" ]
then
	rm -rf essentialz/
fi

if [ -d "./dart" ]
then
	rm -rf dart/
fi

if [ -d "./phylson" ]
then
	rm -rf phylson/
fi

cp -r ../phylson/

cp -r ./phylson/essentialz ./
cp -r ./phylson/languages/dart ./

tree

lua references_framework.lua
