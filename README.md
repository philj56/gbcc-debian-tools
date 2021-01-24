# [GBCC](https://philj56.github.io/gbcc) Debian tools
This is a set of tools used to automatically generate a
[gbcc](https://philj56.github.io/gbcc) `.deb` package for debian-like systems,
specifically meant to run on Ubuntu 20.04. You really shouldn't try to run this
on your machine, or if you do, at least do it in a VM.

Nevertheless, the sequence of instructions goes something like this:

```bash
# Get the sources
git clone git@github.com:philj56/gbcc-debian-tools.git
cd gbcc-debian-tools
git submodule update --init

# Get the dependencies
sudo apt-get update
sudo apt-get install llvm clang devscripts debhelper meson scdoc \
libsdl2-dev libpng-dev libepoxy-dev libopenal-dev libgtk-3-dev

# Build the actual package
./gendeb.sh
```

If it's all gone well, the resultant `.deb` should be placed in a folder called
`gbcc-debian`.
