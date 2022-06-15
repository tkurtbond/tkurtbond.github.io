PROGRAMS=Trampoline NotForever TrampolineForever

all: $(PROGRAMS) TrampolineBroken.err

%: %.Mod
	voc -f $< -m

TrampolineBroken.err: TrampolineBroken.Mod
	voc -f $< -m >$@

clean:
	-rm -v $(PROGRAMS) *.o *.c TrampolineBroken.err
	-rm -rv $(PROGRAMS:=.dSYM)
