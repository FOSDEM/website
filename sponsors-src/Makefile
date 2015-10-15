DST := ../content/sponsors
SRCS = $(patsubst %.eps, %, $(wildcard *.eps)) $(patsubst %.svg, %, $(wildcard *.svg))

all: $(patsubst %, $(DST)/%-big.png, $(SRCS)) $(patsubst %, $(DST)/%-small.png, $(SRCS)) 

$(DST)/%-big.png: %.eps
	convert "$<" -trim -resize 12000@ "$@"

$(DST)/%-small.png: %.eps
	convert "$<" -trim -resize 2500@ "$@"
