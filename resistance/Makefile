#
# Create RASE metadata table from user-provided MICs and breakpoints.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

.PHONY: step1 step2 step3 step4 step5

include ../conf.mk

all: .res_cat.complete

.res_cat.complete:
	$(MAKE) step1
	$(MAKE) step2
	$(MAKE) step3
	$(MAKE) step4
	$(MAKE) step5
	touch $@

step1: ## Print order of leaves to a file (to keep the same order everywhere)
	rase_db_tree_print_order.py -i ../tree/tree.newick > _leaves.tsv

step2: ## Sort metadata tables
	cat ../published/isolates.example.tsv | sort_with_header.sh -k 1 > _isolates.tsv
	cut -f1 _isolates.tsv | tail -n +2 > _taxids.txt
	cut -f2 _isolates.tsv | tail -n +2 > _phylogroups.txt

step3: ## Assign resistance categories (apply breakpoints)
	rase_db_assign_re_cat.py --in-tsv _isolates.tsv --taxid-col 0 --breakpoint $(ant1) --mic-col 2 --antibiotic ant1 > _res_cat.ant1.tsv
	rase_db_assign_re_cat.py --in-tsv _isolates.tsv --taxid-col 0 --breakpoint $(ant2) --mic-col 3 --antibiotic ant1 > _res_cat.ant2.tsv

step4: ## Perform ancestral state reconstruction (infer missing resistance categories)
	rase_db_ancestral_state_reconstruction.py --antibiotic ant1 --in-tsv "_res_cat.ant1.tsv" --tree ../tree/tree.newick > __res_cat.ant1.tsv; \
	rase_db_ancestral_state_reconstruction.py --antibiotic ant2 --in-tsv "_res_cat.ant2.tsv" --tree ../tree/tree.newick > __res_cat.ant2.tsv; \

step5: ## Assemble metadata file
	paste \
		<(echo "taxid"; cat _taxids.txt) \
		<(echo "pg"; cat _phylogroups.txt) \
		<(cut -f 2   _leaves.tsv) \
		<(cut -f 2-4 __res_cat.ant1.tsv) \
		<(cut -f 2-4 __res_cat.ant2.tsv) \
	> res_cat.tsv

clean:
	rm -f _*.{tsv,txt} .*.complete *.pdf

cleanall:
	rm -f *.tsv
