# Preventing from mess in current directory ;)
mkdir plainDE-tmp-src
cd plainDE-tmp-src

# Cloning all repos
git clone https://github.com/plainDE/plainPanel
git clone https://github.com/plainDE/plainAbout
git clone https://github.com/plainDE/plainControlCenter

# Creating plainDE directory
sudo mkdir /usr/share/plainDE
sudo cp ../menuIcon.png /usr/share/plainDE

# Removing old version (if exists)
sudo rm -rf /usr/share/plainDE
sudo rm -rf /usr/bin/plain{Panel,About,ControlCenter}

# Compiling plainPanel
cd plainPanel
qmake
make
sudo cp plainPanel /usr/share/plainDE/
sudo ln -s /usr/share/plainDE/plainPanel /usr/bin/plainPanel
sudo mkdir /usr/share/plainDE/{tools,styles}
sudo cp tools/genconfig.py /usr/share/plainDE/tools/
sudo cp styles/* /usr/share/plainDE/styles/
cd ..
	
# Compiling plainAbout
cd plainAbout
qmake
make
sudo cp plainAbout /usr/share/plainDE/
sudo ln -s /usr/share/plainDE/plainAbout /usr/bin/plainAbout
cd ..

# Compiling plainControlCenter
cd plainControlCenter
qmake
make
sudo cp plainControlCenter /usr/share/plainDE/
sudo ln -s /usr/share/plainDE/plainControlCenter /usr/bin/plainControlCenter
cd ..

cd ..

# Removing temprorary files
rm -rf plainDE-tmp-src
