echo "==> Attention: this script will install plainDE"
echo "    to the / of your system."
echo "::  Press enter to proceed or Ctrl-C cancel."
read
echo "==> Make sure, that you installed all dependencies."
echo "::  Press enter to proceed or Ctrl-C cancel."

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
qmake
make
cp plainPanel /usr/bin/
mkdir /usr/share/plainDE/{tools,styles}
cp tools/genconfig.py /usr/share/plainDE/tools/
cp styles/* /usr/share/plainDE/styles/
cd ..
	
# Compiling plainAbout
cd plainAbout
qmake
make
cp plainAbout /usr/bin/
cd ..

# Compiling plainControlCenter
cd plainControlCenter
qmake
make
cp plainControlCenter /usr/bin
cd ..

cd ..

# Removing temprorary files
rm -rf plainDE-tmp-src
