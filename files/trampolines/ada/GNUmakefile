PROGRAMS=trampoline not_forever trampoline_forever
all: $(PROGRAMS)

%: %.adb
	gnatmake $(<:.adb=)

clean:
	-rm -v $(PROGRAMS) *.ali *.o
