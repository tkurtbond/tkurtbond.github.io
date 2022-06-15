# -*- makefile -*-
PROGRAMS=Trampoline NotForever TrampolineForever

all: $(PROGRAMS)

%: %.Mod
	obnc -o $@ $<

clean:
	-rm -v $(PROGRAMS)
	-rm -rv .obnc
