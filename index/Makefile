#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

.PHONY: all clean cleanall

include ../conf.mk

all: $(foreach onek,$(k),.compress.$(onek).complete)

.compress.%.complete: .index.%.complete
	prophyle compress $(name).k$* $(name).k$*.tar.gz
	touch $@

.index.%.complete:
	prophyle index -k $* -A -g ../isolates ../tree/tree.newick $(name).k$*
	touch $@

clean: ## Clean
	rm -fr $$(ls -d */) *.tar.gz .*.complete

cleanall: clean ## Cleanall
