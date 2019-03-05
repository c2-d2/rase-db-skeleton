#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

.PHONY: all clean cleanall

include ../conf.mk

all: $(foreach onek,$(k),.$(onek).complete)

.%.complete:
	cp ../resistance/res_cat.tsv $(name).k$*.tsv
	cp ../index/$(name).k$*.tar.gz $(name).k$*.tar.gz
	touch $@

clean: ## Clean
	rm -f .*.complete *.tar.gz *.tsv

cleanall: clean
