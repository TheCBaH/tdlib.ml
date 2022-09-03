# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.245.0/containers/cpp/.devcontainer/base.Dockerfile
ARG VARIANT="debian-11"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN set -exu;\
export DEBIAN_FRONTEND=noninteractive;\
apt-get update;\
apt-get install --no-install-recommends -y\
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
 ;\
apt-get clean -y;rm -rf /var/lib/apt/lists/* /tmp/library-scripts;\
echo DONE
