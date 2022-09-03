
all: build

sys-deps.debian:
	sudo DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y\
	 clang\
	 cmake\
	 g++\
	 git\
	 gperf\
	 libc++-dev\
	 libc++abi-dev\
	 libssl-dev\
	 make\
	 ninja-build\
	 php-cli\
	 zlib1g-dev\

build:
	set -eux;\
	 rm -rf td/build; mkdir td/build;\
	 cd td/build; CXXFLAGS="-stdlib=libc++" CC=/usr/bin/clang CXX=/usr/bin/clang++\
	  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib .. -GNinja;\
	 bash -c 'time cmake --build . --target install';\
	 cd ../..; ls -l td/tdlib
