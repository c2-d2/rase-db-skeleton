#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../conf.mk

all: .complete

.complete:
	rase_db_prepare_tree.py \
		--in-newick ../published/tree.example.nw \
		--out-newick tree.newick \
		--metadata ../published/isolates.example.tsv \
		--node-col 0 \
		--taxid-col 0 \
		--phylogroup-col 1

	touch $@

clean:
	rm -f _*.newick .complete

cleanall: clean
	rm -f *.newick
