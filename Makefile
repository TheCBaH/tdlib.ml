
all: build

sys-deps.debian:
	sudo apt-get -y install\
	 cmake\
	 g++\
	 git\
	 gperf\
	 libssl-dev\
	 make\
	 ninja-build\
	 php-cli\
	 zlib1g-dev\

build:
	set -eux;\
	 rm -rf td/build; mkdir td/build;\
	 cd td/build; cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..;\
	 cmake --build . --target install;\
	 cd ../..; ls -l td/tdlib
