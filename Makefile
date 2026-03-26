.SECONDARY:

MAIN_TYPs = $(shell find . -name "*main.typ")
PDFs = $(subst .typ,.pdf,${MAIN_TYPs})

all: ${PDFs}

#                    find all typ in the same folder
%.pdf: %.typ $(shell find $(<D) -name "*.typ") lib.typ
	typst compile $< $@

clean:
	rm -f ${PDFs}
