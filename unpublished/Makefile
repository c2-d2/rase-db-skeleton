#
# Test that all unpublished input data were copied by user to this directory.
# If some of them are missing, fail.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

.PHONY: all test help clean cleanall

.SECONDARY:
.SUFFIXES:

SHELL=/usr/bin/env bash -eo pipefail

all: test

test: ## Check if all files are present

	##
	## TODO: Uncomment and adjust these lines for your files.
	##

	#test -f tree.newick
	#test -f tree_metadata.tsv
	#test -f isolates.tar.gz

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean

cleanall: ## Remove all copied data.
cleanall: clean

	##
	## TODO: Uncomment and adjust these lines for your files.
	##

	#rm -f tree.newick
	#rm -f tree_metadata.tsv
	#rm -f isolates.tar.gz
