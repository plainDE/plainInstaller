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
qmake
make
sudo cp plainPanel /usr/bin/
sudo mkdir /usr/share/plainDE/{tools,styles}
sudo cp tools/genconfig.py /usr/share/plainDE/tools/
sudo cp styles/* /usr/share/plainDE/styles/
cd ..
	
# Compiling plainAbout
cd plainAbout
qmake
make
sudo cp plainAbout /usr/bin/
cd ..

# Compiling plainControlCenter
cd plainControlCenter
qmake
make
sudo cp plainControlCenter /usr/bin
cd ..

cd ..

# Removing temprorary files
rm -rf plainDE-tmp-src
