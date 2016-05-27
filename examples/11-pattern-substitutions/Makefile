# command to run R files in batch mode
rcmd = R CMD BATCH --no-save

# list of R script files
rfiles = $(wildcard *.R)

# list of Rout (output) files
rout = $(patsubst %.R,%.Rout,$(rfiles))


.PHONY: all clean

all: $(rout)

%.Rout: %.R
	$(rcmd) $<

clean:
	rm -f *.Rout
