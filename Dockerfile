FROM haskell:latest

WORKDIR /usr/src/app

# COPY hask.cabal cabal.project ./
# RUN cabal update && cabal build --only-dependencies

COPY . .

# Build the executable file
RUN cabal build

RUN cabal run hask
