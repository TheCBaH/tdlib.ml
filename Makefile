
all: build

sys-deps.debian:
	sudo DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y\
	 ccache\
	 cmake\
	 g++\
	 git\
	 gperf\
	 libssl-dev\
	 make\
	 ninja-build\
	 php-cli\
	 zlib1g-dev\

sys-deps.Linux: sys-deps.debian

sys-deps.macOS: 
	brew install\
	 cccache\
	 cmake\
	 gperf\
	 openssl\

sys-deps.Windows: 
	vcpkg.exe install\
	 ccache\
	 gperf\
	 openssl\
	 zlib\

build:
	set -eux;\
	 rm -rf td/build; mkdir td/build;\
	 cd td/build; cmake\
	  $(if $(realpath /usr/local/opt/openssl/),-DOPENSSL_ROOT_DIR=/usr/local/opt/openssl/)\
	  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib .. -GNinja;\
	 bash -c 'time cmake --build . --target install';\
	 cd ../..; ls -l td/tdlib
