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

export

