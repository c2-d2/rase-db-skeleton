#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../init.mk
.PHONY: index

# trick to ensure that path is exported
all:
	$(MAKE) -C .. index

index: $(foreach onek,$(k),.compress.$(onek).complete)

.compress.%.complete: .index.%.complete
	prophyle compress $(name).k$* $(name).k$*.tar.gz
	touch $@

.index.%.complete:
	prophyle index -k $* -A -g ../isolates ../tree/tree.newick $(name).k$*
	touch $@

clean:
	rm -f *.tar.gz .*.complete
	rm -fr $$(ls -d */)
