DST := ../content/sponsors
SRCS = $(patsubst %.eps, %, $(wildcard *.eps)) $(patsubst %.svg, %, $(wildcard *.svg))

all: $(patsubst %, $(DST)/%-big.png, $(SRCS)) $(patsubst %, $(DST)/%-small.png, $(SRCS)) 

%.info: %.eps
	( \
		convert "$<" -background '#ffffff' -flatten -bordercolor white -border 1 -trim info:- | \
		perl -ne 'm/^\S+ \S+ (\d+)x(\d+) (\d+)x(\d+)\+(\d+)\+(\d+)/; print "WIDTH_O=", $$3-2, "\nHEIGHT_O=", $$4-2, "\nWIDTH_U=", $$1, "\nHEIGHT_U=", $$2, "\nOFFSET_X=", $$5-1, "\nOFFSET_Y=", $$6-1, "\n";'; \
	) > "$@"
	( \
		. "./$@"; \
		BIG_AREA=12000; \
		SMALL_AREA=2500; \
		WHITESPACE_AREA=0.5; \
		echo "BIG_SCALE=$$( echo "oa = $$WIDTH_O * $$HEIGHT_O; ua = $$WIDTH_U * $$HEIGHT_U; scale=2; 100 * sqrt($$BIG_AREA / (ua + $$WHITESPACE_AREA * (oa-ua)))" | bc )"; \
		echo "SMALL_SCALE=$$( echo "oa = $$WIDTH_O * $$HEIGHT_O; ua = $$WIDTH_U * $$HEIGHT_U; scale=2; 100 * sqrt($$SMALL_AREA / (ua + $$WHITESPACE_AREA * (oa-ua)))" | bc )"; \
	) >> "$@"
	cat "$@"

$(DST)/%-big.png: %.eps %.info
	. "./$*.info"; convert "$<" -resize "$${BIG_SCALE}%" "$@"

$(DST)/%-small.png: %.eps %.info
	. "./$*.info"; convert "$<" -resize "$${SMALL_SCALE}%" "$@"
