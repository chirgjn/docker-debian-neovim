FROM debian AS builder

RUN apt-get update
RUN apt-get -y install ninja-build gettext cmake unzip curl git clang cmake
RUN git clone https://github.com/neovim/neovim
WORKDIR /neovim
RUN git checkout stable && \
	make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/neovim-install" && \
	make install;

FROM scratch
COPY --from=builder /neovim-install /neovim
