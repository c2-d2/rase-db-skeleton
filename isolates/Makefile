include ../conf.mk

all: .complete

.complete:
	./create_example_isolates.sh
	touch $@

clean:
	rm -f *.fa .complete

