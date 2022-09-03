
all: build

sys-deps.debian:
	sudo apt-get -y install\
	 clang\
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
	 cd td/build; cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib .. -GNinja;\
	 bash -c 'time cmake --build . --target install -- -d stats';\
	 cd ../..; ls -l td/tdlib
