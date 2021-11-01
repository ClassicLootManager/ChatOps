#!/bin/sh

VERSION=$1
pipx install gitman
gitman install
find libs -type d -name ".git" -execdir rm -rf {} \; -prune
sed -i "s/{VERSION}/${{ steps.semantic.outputs.new_release_version }}/g" *.toc
name=$(basename $(pwd)) pushd ..; zip -r $name/release.zip $name; popd