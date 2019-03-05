#
# This is the main Makefile for constructing RASE databases. It specifies the
# order in which individual subdirectories with own Makefiles will be invoked.
# This file is to be symlinked.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

DIRS=tree isolates resistance index _output published unpublished
ALLDIRS=$(DIRS) plots

.PHONY: all clean cleanall data cluster plots $(DIRS)

include ./conf.mk

all: $(DIRS)

data: ## Prepare both published and unpublished data
data: published unpublished

tree: ## Prepare phylogenetic tree
tree: data
	$(MAKE) -C tree

isolates: ## Download isolates
isolates: data
	$(MAKE) -C isolates

resistance: ## Process resistance data
resistance: tree data
	$(MAKE) -C resistance

plots: ## Generate plots
	$(MAKE) -C plots

index: ## Construct ProPhyle k-mer index
index: tree isolates
	$(MAKE) -C index

_output: ## Copy the database file to _output
_output: index resistance
	$(MAKE) -C _output

published: ## Download and/or process published data
	$(MAKE) -C published

unpublished: ## Download and/or process published data
	$(MAKE) -C unpublished

cluster: ## Submit RASE DB construction as a job to a cluster
	snakemake --cores 9999 -p \
		--cluster-config ../cluster.json \
		--cluster 'sbatch -p {cluster.queue} -n {cluster.n} -t {cluster.time} --mem={cluster.memory}'

clean: ## Clean
	for x in $(ALLDIRS); do \
		$(MAKE) -C $$x clean; \
	done

cleanall:
	for x in $(ALLDIRS); do \
		$(MAKE) -C $$x cleanall; \
	done
