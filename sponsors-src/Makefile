DST := ../content/sponsors

EXTS = eps svg png

IN = $(foreach EXT, $(EXTS), $(wildcard *.$(EXT)))
SRCS = $(shell echo $(IN) | perl -pe 's/(-big|-small)?\.[^.]+(?=\s)//g' )

all: $(patsubst %, $(DST)/%-big.png, $(SRCS)) $(patsubst %, $(DST)/%-small.png, $(SRCS)) 

define template
%.info: %.$(1)
	( \
		convert "$$<" -background '#ffffff' -flatten -bordercolor white -border 1 -trim info:- | \
		perl -ne 'm/^\S+ \S+ (\d+)x(\d+) (\d+)x(\d+)\+(\d+)\+(\d+)/; print "WIDTH_O=", $$$$3-2, "\nHEIGHT_O=", $$$$4-2, "\nWIDTH_U=", $$$$1, "\nHEIGHT_U=", $$$$2, "\nOFFSET_X=", $$$$5-1, "\nOFFSET_Y=", $$$$6-1, "\n";'; \
	) > "$$@"
	( \
		. "./$$@"; \
		BIG_AREA=12000; \
		SMALL_AREA=2500; \
		WHITESPACE_AREA=0.5; \
		echo "BIG_SCALE=$$$$( echo "oa = $$$$WIDTH_O * $$$$HEIGHT_O; ua = $$$$WIDTH_U * $$$$HEIGHT_U; scale=2; 100 * sqrt($$$$BIG_AREA / (ua + $$$$WHITESPACE_AREA * (oa-ua)))" | bc )"; \
		echo "SMALL_SCALE=$$$$( echo "oa = $$$$WIDTH_O * $$$$HEIGHT_O; ua = $$$$WIDTH_U * $$$$HEIGHT_U; scale=2; 100 * sqrt($$$$SMALL_AREA / (ua + $$$$WHITESPACE_AREA * (oa-ua)))" | bc )"; \
	) >> "$$@"

%-big.$(1): %.$(1)
	ln "$$<" "$$@"

%-small.$(1): %.$(1)
	ln "$$<" "$$@"

$(DST)/%-big.png: %-big.$(1) %-big.info
	. "./$$*-big.info"; convert "$$<" -resize "$$$${BIG_SCALE}%" "$$@"

$(DST)/%-small.png: %-small.$(1) %-small.info
	. "./$$*-small.info"; convert "$$<" -resize "$$$${SMALL_SCALE}%" "$$@"
endef

$(foreach EXT,$(EXTS),$(eval $(call template,$(EXT))))
