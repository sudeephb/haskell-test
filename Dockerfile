FROM haskell:latest

WORKDIR /usr/src/hask

COPY hask.cabal ./
RUN cabal update && cabal build --only-dependencies

COPY . .

# Build the executable file
# RUN cabal update

RUN cabal build hask

RUN cabal run hask
