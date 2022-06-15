PROGRAMS=not_forever trampoline trampoline_forever actually_forever

all: $(PROGRAMS)

actually_forever: not_forever.c
	gcc -foptimize-sibling-calls -o actually_forever $<

%: %.c
	gcc -o $@ $<

clean:
	-rm $(PROGRAMS) *.o 
