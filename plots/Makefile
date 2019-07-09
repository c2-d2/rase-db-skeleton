#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../init.mk
.PHONY: plots

# trick to ensure that path is exported
all:
	$(MAKE) -C .. plots

plots: .stats.complete .mic.complete .res_tree.complete

####

.stats.complete:
	rase_db_compute_stats.py ../resistance/res_cat.tsv > $(name).lineages.tsv
	touch $@

####

.mic.complete: $(foreach ant,$(antibiotics),.mic.$(ant).complete)
	/usr/bin/env gs \
		-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default \
		-dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 \
		-dAutoRotatePages=/None \
		-sOutputFile=$(name).mic.pdf \
		$(foreach ant,$(antibiotics),_mic.$(ant).zoomed.pdf)
	touch $@

.mic.%.complete:
	rase_db_plot_mic.R ../resistance/res_cat.tsv -b $($*) $* _mic.$*.basic.pdf
	rase_db_plot_mic.R -z ../resistance/res_cat.tsv -b $($*) $* _mic.$*.zoomed.pdf
	touch $@


####

.res_tree.complete: $(foreach ant,$(antibiotics),.res_tree.$(ant).complete)
	/usr/bin/env gs \
		-sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/default \
		-dNOPAUSE -dQUIET -dBATCH -dDetectDuplicateImages -dCompressFonts=true -r150 \
		-dAutoRotatePages=/None \
		-sOutputFile=$(name).res_tree.pdf \
		$(foreach ant,$(antibiotics),_res_tree.$(ant).pdf)
	touch $@

.res_tree.%.complete:
	rase_db_ancestral_state_reconstruction.py \
		--antibiotic "$*" \
		--in-tsv "../resistance/_res_cat.$*.tsv"  \
		--tree "../tree/tree.newick" \
		--plot-pdf "_res_tree.$*.pdf" \
		> /dev/null
	touch $@


####

clean:
	rm -f res_cat.*.pdf .*.complete
	rm -f res_tree.*.pdf

cleanall: clean
	rm -f *.pdf *.tsv
