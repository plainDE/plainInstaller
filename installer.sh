RELEASEVER="0.6.3"
echo "plainInstaller $RELEASEVER"
echo "==> Installing plainDE into your system."
echo "    Please ensure you are allowed to use sudo"
echo "    or run root installer."
echo "::  Press enter to proceed or Ctrl-C to cancel."
read
echo "==> Make sure all dependencies are installed."
echo "::  Press enter to proceed or Ctrl-C to cancel."
read
# Removing old files
sudo rm -rf /usr/share/plainDE
sudo rm -rf /usr/bin/plain{Panel,About,ControlCenter}

# Preventing from mess in current directory :)
mkdir plainDE-tmp-src
cd plainDE-tmp-src

# Cloning all repos
git clone https://github.com/plainDE/plainBase
git clone https://github.com/plainDE/plainPanel
git clone https://github.com/plainDE/plainAbout
git clone https://github.com/plainDE/plainControlCenter
git clone https://github.com/plainDE/plainArtwork

# Creating plainDE directory and copying base files
sudo mkdir /usr/share/plainDE
sudo cp -R plainBase/usr/* /usr/
sudo chmod 755 /usr/share/plainDE/tools/*

# Copying artwork
sudo cp -R plainArtwork/flags /usr/share/
sudo mkdir /usr/share/plainDE/icons
sudo cp -R plainArtwork/icons /usr/share/plainDE/

# Compiling plainPanel
cd plainPanel
git checkout $RELEASEVER
qmake
make
sudo install -m 0755 plainPanel /usr/bin/plainPanel
cd ..
	
# Compiling plainAbout
cd plainAbout
git checkout $RELEASEVER
qmake
make
sudo install -m 0755 plainAbout /usr/bin/plainAbout
cd ..

# Compiling plainControlCenter
cd plainControlCenter
git checkout $RELEASEVER
qmake
make
sudo install -m 0755 plainControlCenter /usr/bin/plainControlCenter
cd ..

cd ..

# Removing temprorary files
rm -rf plainDE-tmp-src

echo "Installation successful! Now add 'plainPanel' in autostart of your window manager and start exploring new DE!"
