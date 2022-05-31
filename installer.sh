RELEASEVER="0.1.3"
echo "plainInstaller $RELEASEVER"
echo "==> Attention: this script will install plainDE"
echo "    to the / of your system."
echo "    You will be asked to enter your password"
echo "    If you don't have access to sudo,"
echo "    run installer as root by "
echo "    curl https://plainde.org/instRoot | sh"
echo "::  Press enter to proceed or Ctrl-C cancel."
read
echo "==> Make sure, that you installed all dependencies."
echo "::  Press enter to proceed or Ctrl-C cancel."
read
# Removing old files
sudo rm -rf /usr/share/plainDE
sudo rm -rf /usr/bin/plain{Panel,About,ControlCenter}

# Preventing from mess in current directory ;)
mkdir plainDE-tmp-src
cd plainDE-tmp-src

# Cloning all repos
git clone https://github.com/plainDE/plainPanel
git clone https://github.com/plainDE/plainAbout
git clone https://github.com/plainDE/plainControlCenter

# Creating plainDE directory
sudo mkdir /usr/share/plainDE
sudo cp plainPanel/readme-icon.png /usr/share/plainDE/menuIcon.png

# Compiling plainPanel
cd plainPanel
git checkout $RELEASEVER
qmake
make
sudo install -m 0755 plainPanel /usr/bin/plainPanel
sudo mkdir /usr/share/plainDE/{tools,styles}
sudo cp tools/genconfig.py /usr/share/plainDE/tools/
sudo cp styles/* /usr/share/plainDE/styles/
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
