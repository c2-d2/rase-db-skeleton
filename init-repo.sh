#! /usr/bin/env bash

set -e
set -o pipefail
set -u


>&2 echo
>&2 echo "Checking dependencies"
>&2 echo "---------------------"
>&2 echo
for x in git curl /usr/bin/env python; do
	hash $x 2>/dev/null || { echo >&2 "$x is required but it's not installed. Aborting."; exit 1; }
done

>&2 echo
>&2 echo "Downloading and extracting RASE DB skeleton"
>&2 echo "-------------------------------------------"
>&2 echo
curl -L https://github.com/c2-d2/rase-db-skeleton/archive/master.tar.gz | tar xvf - --strip-components 1
rmdir rase

>&2 echo
>&2 echo "Initializing git repository"
>&2 echo "---------------------------"
>&2 echo
git init

>&2 echo
>&2 echo "Reading SHA of RASE submodule"
>&2 echo "-----------------------------"
>&2 echo
sha=$(curl -L https://api.github.com/repos/c2-d2/rase-db-skeleton/contents/rase | python -c "import sys, json; print json.load(sys.stdin)['sha']")

>&2 echo
>&2 echo "Adding RASE submodule"
>&2 echo "---------------------"
>&2 echo
git submodule add ssh://git@github.com/karel-brinda/rase
(cd rase && git checkout $sha)

>&2 echo
>&2 echo "Creating initial RASE DB commit"
>&2 echo "-------------------------------"
>&2 echo
git add .
git commit -m "Initial RASE DB commit"

>&2 echo
>&2 echo "-----------------------------------------------------"
>&2 echo "RASE DB skeleton creation successfully finished. Bye."
>&2 echo "-----------------------------------------------------"

