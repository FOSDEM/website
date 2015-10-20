DST := ../content/sponsors

EXTS = eps svg png

IN = $(foreach EXT, $(EXTS), $(wildcard *.$(EXT)))
SRCS = $(shell echo $(IN) | perl -pe 's/(-big|-small)?\.[^.]+(?=\s)//g' )

all: $(patsubst %, $(DST)/%-big.png, $(SRCS)) $(patsubst %, $(DST)/%-small.png, $(SRCS)) 

define template
%-big.$(1): %.$(1)
	ln "$$<" "$$@"

%-small.$(1): %.$(1)
	ln "$$<" "$$@"

$(DST)/%-big.png: %-big.$(1)
	convert -density 1000 "$$<" -background '#ffffff' -flatten -bordercolor white -border 1 -trim -resize 12000@ "$$@"

$(DST)/%-small.png: %-small.$(1)
	convert -density 1000 "$$<" -background '#ffffff' -flatten -bordercolor white -border 1 -trim -resize 2500@ "$$@"
endef

$(foreach EXT,$(EXTS),$(eval $(call template,$(EXT))))
