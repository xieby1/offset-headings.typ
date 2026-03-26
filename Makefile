.SECONDARY:

MAIN_TYPs = $(shell find . -name "*main.typ")
MAIN_PDFs = $(subst .typ,.pdf,${MAIN_TYPs})
MAIN_CHKs = $(subst .typ,.chk,${MAIN_TYPs})

all: ${MAIN_CHKs}

#                    find all typ in the same folder
%.pdf: %.typ $(shell find $(<D) -name "*.typ") lib.typ
	typst compile $< $@

%main.chk: %main.pdf %main.regex
	pdftotext $< - | check_regex_order.py $(filter-out $<,$^)

clean:
	rm -f ${MAIN_PDFs}
