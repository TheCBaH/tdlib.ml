
all: build

build:
	set -eux;\
	 rm -rf td/build; mkdir td/build;\
	 cd td/build; cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib ..;\
	 cmake --build . --target install;\
	 cd ../..; ls -l td/tdlib
