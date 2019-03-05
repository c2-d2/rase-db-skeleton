#
# Configuration file for a RASE database. Defines k-mer size resistance
# breakpoints for individual antibiotics and the order of antibiotics for
# plotting.
#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

##
## TODO: Adjust all configuration.
##

#########
# INDEX #
#########

#db name
name=my-example-db

# k-mer size, can contain multiple values
k=18

###############
# ANTIBIOTICS #
###############

antibiotics:=ant1 ant2

###############
# BREAKPOINTS #
###############

ant1:=0.06  # Antibiotics 1
ant2:=0.50  # Antibiotics 2


#############
# INIT MAKE #
#############

SHELL=/usr/bin/env bash -eo pipefail
export PATH := ../../scripts:../rase/src/rase:$(PATH)

.SECONDARY:
.SUFFIXES:
.PHONY: all clean cleanall help

all:

help: ## Print help message
	@echo "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s : | sort)"

clean: ## Clean

cleanall: clean ## Clean all
