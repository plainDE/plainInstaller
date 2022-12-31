RELEASEVER="0.4.2"
echo "plainInstaller $RELEASEVER as Root"
echo "==> Installing plainDE into your system."
echo "::  Press enter to proceed or Ctrl-C to cancel."
read
echo "==> Make sure all dependencies are installed."
echo "::  Press enter to proceed or Ctrl-C to cancel."
read

if [ ! "$(whoami)" = "root" ]; then
	echo "Run it as root."
	exit 1
fi

# Removing old files
rm -rf /usr/share/plainDE
rm -rf /usr/bin/plain{Panel,About,ControlCenter}

# Preventing from mess in current directory ;)
mkdir plainDE-tmp-src
cd plainDE-tmp-src

# Cloning all repos
git clone https://github.com/plainDE/plainBase
git clone https://github.com/plainDE/plainPanel
git clone https://github.com/plainDE/plainAbout
git clone https://github.com/plainDE/plainControlCenter
git clone https://github.com/plainDE/plainArtwork

# Creating plainDE directory & copying base
mkdir /usr/share/plainDE
cp -R plainBase/usr/* /usr/
chmod 755 /usr/share/plainDE/tools/*

# Copying artwork
cp -R plainArtwork/flags /usr/share/
mkdir /usr/share/plainDE/icons
cp -R plainArtwork/icons /usr/share/plainDE

# Compiling plainPanel
cd plainPanel
git checkout $RELEASEVER
qmake
make
install -m 0755 plainPanel /usr/bin/plainPanel
	
# Compiling plainAbout
cd plainAbout
git checkout $RELEASEVER
qmake
make
install -m 0755 plainAbout /usr/bin/plainAbout
cd ..

# Compiling plainControlCenter
cd plainControlCenter
git checkout $RELEASEVER
qmake
make
install -m 0755 plainControlCenter /usr/bin/plainControlCenter
cd ..

cd ..

# Removing temprorary files
rm -rf plainDE-tmp-src
