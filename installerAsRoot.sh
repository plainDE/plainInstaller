RELEASEVER="0.1.3"
echo "plainInstaller $RELEASEVER as Root"
echo "==> Attention: this script will install plainDE"
echo "    to the / of your system."
echo "::  Press enter to proceed or Ctrl-C cancel."
read
echo "==> Make sure, that you installed all dependencies."
echo "::  Press enter to proceed or Ctrl-C cancel."
read

if [ ! "$(whoami)" = "root" ]; then
	echo "==> You are not root."
	exit 1
fi

# Removing old files
rm -rf /usr/share/plainDE
rm -rf /usr/bin/plain{Panel,About,ControlCenter}

# Preventing from mess in current directory ;)
mkdir plainDE-tmp-src
cd plainDE-tmp-src

# Cloning all repos
git clone https://github.com/plainDE/plainPanel
git clone https://github.com/plainDE/plainAbout
git clone https://github.com/plainDE/plainControlCenter

# Creating plainDE directory
mkdir /usr/share/plainDE
cp plainPanel/readme-icon.png /usr/share/plainDE/menuIcon.png

# Compiling plainPanel
cd plainPanel
git checkout $RELEASEVER
qmake
make
install -m 0755 plainPanel /usr/bin/plainPanel
mkdir /usr/share/plainDE/{tools,styles}
cp tools/genconfig.py /usr/share/plainDE/tools/
cp styles/* /usr/share/plainDE/styles/
cd ..
	
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
