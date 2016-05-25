rcmd = R CMD BATCH --no-save

.PHONY: all clean

all: script1.Rout script2.Rout script3.Rout script4.Rout

%.Rout: %.R
	$(rcmd) $<

clean:
	rm -f *.Rout
