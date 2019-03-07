#! /usr/bin/env bash

set -e
set -o pipefail
set -u

sha=$(curl -L https://api.github.com/repos/c2-d2/rase-db-skeleton/contents/rase | python -c "import sys, json; print json.load(sys.stdin)['sha']")

curl -L https://github.com/c2-d2/rase-db-skeleton/archive/master.tar.gz | tar xvf - --strip-components 1
rmdir rase

git init
git submodule add ssh://git@github.com/karel-brinda/rase
(cd rase && git checkout $sha)

