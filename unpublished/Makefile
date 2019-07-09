#
# Test that all unpublished input data were copied by user to this directory.
# If some of them are missing, fail.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../init.mk
.PHONY: test unpublished

# trick to ensure that path is exported
all:
	$(MAKE) -C .. unpublished

unpublished: test

test: ## Check if all files are present

	##
	## TODO: Uncomment and adjust these lines for your files.
	##

	#test -f tree.newick
	#test -f tree_metadata.tsv
	#test -f isolates.tar.gz

cleanall: clean

	##
	## TODO: Uncomment and adjust these lines for your files.
	##

	#rm -f tree.newick
	#rm -f tree_metadata.tsv
	#rm -f isolates.tar.gz
