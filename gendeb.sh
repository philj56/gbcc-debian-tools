#!/bin/bash -e

rev=$(git -C gbcc rev-list --count HEAD)

version=0.1.$rev

pushd .

mkdir -p debbuild && cd debbuild

cp -r ../gbcc gbcc-$version

files=(
	gbcc-$version/completions/
	gbcc-$version/doc/
	gbcc-$version/shaders/
	gbcc-$version/src/
	gbcc-$version/meson.build
	gbcc-$version/meson_options.txt
	gbcc-$version/tileset.png
	gbcc-$version/print.wav
	gbcc-$version/LICENSE
)

tar cJf gbcc_$version.orig.tar.xz "${files[@]}"
rm -rf gbcc-$version

tar xf gbcc_$version.orig.tar.xz
cd gbcc-$version

cp -r ../../debian .
cp LICENSE debian/copyright

grep -rlI GBCC_GIT_REVISION debian | xargs sed -i "s/GBCC_GIT_REVISION/$rev/g"

debuild -us -uc

popd

mkdir -p gbcc-debian
cp debbuild/*.deb gbcc-debian
