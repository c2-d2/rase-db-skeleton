#
# Create RASE metadata table from user-provided MICs and breakpoints.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../init.mk
.PHONY: resistance step1 step2 step3 step4 step5

# trick to ensure that path is exported
all:
	$(MAKE) -C .. resistance

resistance: .res_cat.complete

.res_cat.complete:
	$(MAKE) step1
	$(MAKE) step2
	$(MAKE) step3
	$(MAKE) step4
	$(MAKE) step5
	touch $@

step1: ## Print order of leaves to a file (to keep the same order everywhere)
	rase_db_tree_print_order.py -i ../tree/tree.newick > _leaves.tsv

step2: ## Assemble metadata tables
	cat ../published/isolates.example.tsv | sort_with_header.sh -k 1 > _isolates.tsv
	cut -f1 _isolates.tsv | tail -n +2 > _taxids.txt
	cut -f2 _isolates.tsv | tail -n +2 > _phylogroups.txt

step3: ## Assign resistance categories (apply breakpoints)
	rase_db_assign_re_cat.py --in-tsv _isolates.tsv --taxid-col 0 --breakpoint $(ant1) --mic-col 2 --antibiotic ant1 > _res_cat.ant1.tsv
	rase_db_assign_re_cat.py --in-tsv _isolates.tsv --taxid-col 0 --breakpoint $(ant2) --mic-col 3 --antibiotic ant2 > _res_cat.ant2.tsv

step4: ## Perform ancestral state reconstruction (infer missing resistance categories)
	for ant in $(antibiotics); do \
		echo "Ancestral state reconstruction: $$ant"; \
		rase_db_ancestral_state_reconstruction.py \
			--antibiotic "$$ant" \
			--in-tsv "_res_cat.$$ant.tsv" \
			--tree "../tree/tree.newick" \
			> __res_cat.$$ant.tsv; \
	done

step5: ## Assemble metadata file
	paste \
		<(echo "taxid"; cat _taxids.txt) \
		<(echo "lineage"; cat _phylogroups.txt) \
		<(cut -f 2   _leaves.tsv) \
		$(foreach ant, $(antibiotics),<(cut -f 2-4 __res_cat.$(ant).tsv) ) \
	> res_cat.tsv

clean:
	rm -f _*.{tsv,txt} .*.complete *.pdf

cleanall:
	rm -f *.tsv
