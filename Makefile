not_bum_w_1000.txt: not_bum_w.txt
	cat not_bum_w.txt | head -n1001 | tail -n1000 > not_bum_w_1000.txt

not_bum_w.txt: not_bum.py bum_w.txt all_w.txt
	./not_bum.py > not_bum_w.txt

bum.txt: src/bnc_all.num
	grep -Pi "^\d+ [A-Z'-]+ (AJ0|NN0|NN1|NN2|NP0|VVB|VVI) \d+$$" \
	src/bnc_all.num > bum.txt

bum_10000.txt: bum.txt
	head -n10000 bum.txt > bum_10000.txt

bum_w.txt: bum_10000.txt
	cut -d' ' -f2 bum_10000.txt > bum_w.txt

all_w.txt: src/bnc_all.num
	cut -d' ' -f2 src/bnc_all.num | grep -Pi "^[a-z'-]+$$" | ./uniq.py > all_w.txt

.PHONY: clean
clean:
	rm -f *.txt
