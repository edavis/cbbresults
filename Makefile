csvs := $(foreach txt, $(wildcard kenpom/*.txt), csv/$(notdir $(basename $(txt))).csv)

all: clean $(csvs)

csv/cbbga01.csv: kenpom/cbbga01.txt
csv/cbbga02.csv: kenpom/cbbga02.txt
csv/cbbga03.csv: kenpom/cbbga03.txt
csv/cbbga04.csv: kenpom/cbbga04.txt
csv/cbbga05.csv: kenpom/cbbga05.txt
csv/cbbga06.csv: kenpom/cbbga06.txt
csv/cbbga07.csv: kenpom/cbbga07.txt
csv/cbbga08.csv: kenpom/cbbga08.txt
csv/cbbga09.csv: kenpom/cbbga09.txt
csv/cbbga10.csv: kenpom/cbbga10.txt
csv/cbbga11.csv: kenpom/cbbga11.txt
csv/cbbga12.csv: kenpom/cbbga12.txt
csv/cbbga13.csv: kenpom/cbbga13.txt
csv/cbbga14.csv: kenpom/cbbga14.txt
csv/cbbga15.csv: kenpom/cbbga15.txt
csv/cbbga16.csv: kenpom/cbbga16.txt
csv/cbbga17.csv: kenpom/cbbga17.txt

csv/%.csv:
	python build_csv.py -o $@ $<

kenpom/cbbga%.txt:
	wget -nv -O $@ kenpom.com/$(notdir $@)

clean:
	rm -fv kenpom/cbbga17.txt
