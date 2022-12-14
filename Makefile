
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
	 ccache\
	 ninja\
	 cmake\
	 gperf\
	 openssl\

sys-deps.Windows: CCACHE_VER=4.6.3
sys-deps.Windows:
	choco install\
	 gperf\
	 ;
	vcpkg.exe install\
	 openssl:x64-windows\
	 zlib:x64-windows\

build.Linux:
	set -eux;\
	 rm -rf td/build; mkdir td/build; cd td/build;\
	  cmake\
	  $(if $(realpath /usr/local/opt/openssl/),-DOPENSSL_ROOT_DIR=/usr/local/opt/openssl/)\
	  -DCMAKE_CXX_COMPILER_LAUNCHER=ccache -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=../tdlib .. -GNinja;\
	 bash -c 'time cmake --build . --target install'

build: build.Linux

build.macOS: build.Linux

build.Windows:
	set -eux;\
	 rm -rf td/build; mkdir td/build; cd td/build;\
	  cmake\
	   -A x64 -DCMAKE_INSTALL_PREFIX:PATH=../tdlib\
	   -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/c/vcpkg/scripts/buildsystems/vcpkg.cmake ..;\
	 bash -c 'time cmake --build . --target install'
