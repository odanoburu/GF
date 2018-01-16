FROM haskell:8

RUN apt-get update \
     && apt-get install -y --no-install-recommends \
     autoconf \
     automake \
     libtool \
     make \
     && rm -rf /var/lib/apt/lists/*

WORKDIR /home

COPY . /home

# c runtime install
RUN cd ./src/runtime/c \
    && ./setup.sh configure \
    && ./setup.sh build \
    && ./setup.sh install


# gf with c runtime install
RUN cd /home \
    && cabal update \
    && cabal install -fserver -fc-runtime --extra-include-dirs=/usr/local/include --extra-lib-dirs=/usr/local/lib
