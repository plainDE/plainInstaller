HOMEPATH=$HOME

# Preventing from mess in current directory ;)
mkdir plainDE-tmp-src
cd plainDE-tmp-src

# Cloning all repos
git clone https://github.com/plainDE/plainPanel
git clone https://github.com/plainDE/plainAbout
#git clone https://github.com/plainDE/plainSettings

# Creating plainDE directory
sudo mkdir /usr/share/plainDE
sudo cp ../menuIcon.png /usr/share/plainDE

# Compiling plainPanel
cd plainPanel
qmake
make
sudo cp plainPanel /usr/share/plainDE/
sudo ln -s /usr/share/plainDE/plainPanel /usr/bin/plainPanel
cd ..
	
# Compiling plainAbout
cd plainAbout
qmake
make
sudo cp plainAbout /usr/share/plainDE/
sudo ln -s /usr/share/plainDE/plainAbout /usr/bin/plainAbout
cd ..

# Compiling plainSettings
# ...

# Creating config
cd ..
echo $HOMEPATH/.config/plainDE
mkdir -p $HOMEPATH/.config/plainDE
cp config.json $HOMEPATH/.config/plainDE/

# Removing temprorary files
rm -rf plainDE-tmp-src
