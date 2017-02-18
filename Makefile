csvs := $(foreach txt, $(wildcard kenpom/*.txt), csv/$(notdir $(basename $(txt))).csv)

all: $(csvs)

kenpom/cbbga%.txt:
	wget -nv -O $@ kenpom.com/$(notdir $@)

csv/%.csv:
	python build_csv.py -o $@ kenpom/$(notdir $(basename $@).txt)
