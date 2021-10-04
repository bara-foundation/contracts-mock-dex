#!/usr/bin/env bash

# cd to the root of the repo
cd "$(git rev-parse --show-toplevel)"

# avoids re-compilation during publishing of both packages
if [ ! -z "${ALREADY_COMPILED}"]; then
  echo "Compiled, skip do it again!"
else
  npm run clean
  npm run prepare
  npm run prepack
fi

# Clean up
rm -rf contracts/dist

# Move artifacts
cp README.md contracts/
mkdir contracts/build contracts/build/contracts
mkdir contracts/dist
cp -r build/contracts/*.json contracts/build/contracts
cp -r dist contracts/dist
