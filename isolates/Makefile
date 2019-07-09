#
# Author:  Karel Brinda <kbrinda@hsph.harvard.edu>
#
# License: MIT
#

include ../init.mk
.PHONY: isolates

# trick to ensure that path is exported
all:
	$(MAKE) -C .. isolates

isolates: .complete

.complete:
	./create_example_isolates.sh
	touch $@

clean:
	rm -f *.fa .complete

