if [[ `whoami` == 'root' ]]; then
	# Preventing from mess in current directory ;)
	mkdir plainDE-tmp-src
	cd plainDE-tmp-src


	# Cloning all repos
	git clone https://github.com/plainDE/plainPanel
	git clone https://github.com/plainDE/plainAbout
	#git clone https://github.com/plainDE/plainSettings


	# Creating plainDE directory
	mkdir /usr/share/plainDE


	# Compiling plainPanel
	cd plainPanel
	qmake
	make
	cp plainPanel /usr/share/plainDE/
	ln -s /usr/share/plainDE/plainPanel /usr/bin/plainPanel
	cd ..

	
	# Compiling plainAbout
	cd plainAbout
	qmake
	make
	cp plainAbout /usr/share/plainDE/
	ln -s /usr/share/plainDE/plainAbout /usr/bin/plainAbout
	cd ..


	# Compiling plainSettings
	# ...


	# Creating config
	mkdir -p ~/.config/plainDE
	cp config.json ~/.config/plainDE/


	# Removing temprorary files
	cd ..
	rm -rf plainDE-tmp-src

else
	echo 'Run it as root.'
fi
