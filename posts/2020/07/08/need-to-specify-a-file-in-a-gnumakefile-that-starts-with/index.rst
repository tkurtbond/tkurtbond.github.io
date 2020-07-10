.. title: Need to specify a file in a GNUmakefile that starts with ~?
.. slug: need-to-specify-a-file-in-a-gnumakefile-that-starts-with
.. date: 2020-07-08 06:09:38 UTC-04:00
.. tags: gnu make,macos catalina
.. category: computer
.. link: 
.. description: 
.. type: text

.. role:: app
.. role:: file
.. role:: command

*Last edited: 2020-07-10 18:47:10 EDT*

Like on macOS Catalina where you can't have directories outside your
home directory any more, so need to refer to the directory you
manually installed some software to?  You can't just include the raw
:file:`~/where/ever` in that PATH in the GNUmakefile because the
:code:`~` prefix won't be translated into the user's home directory.
That substitution is done by the shell when a command is executed, but
the shells expect that tilde to have been expanded in the command that
sets the path.  It doesn't do “Tilde Expansion” on each part of the
PATH when it goes looking things up in the path.  So, you have to get
that expansion done manually if you set it in a GNUmakefile.

Anyway, This ugly hack works:

.. code:: makefile

   export PATH := $(shell eval dir='~/sw/versions/heirloom-doctools/git/ucb';\
                    echo $$dir):$(PATH)
   export TROFFFONTS := $(shell eval dir='~/Library/Fonts';\
           echo $$dir):/Library/Fonts

   all:
           @echo PATH=${PATH}
           @echo
           @echo TROFFFONTS=${TROFFFONTS}
           @echo
           @echo -n '"type troff" returns '
           @type troff

Put this in a file somewhere and invoke :app:`GNU make` on it and it prints:

.. code::
   
    PATH=/Users/tkb/sw/versions/heirloom-doctools/git/ucb:/Users/tkb/local/rndbin:/Users/tkb/.cargo/bin:/Users/tkb/.nimble/bin:/usr/local/opt/libxslt/bin:/usr/local/opt/libxml2/bin:/Users/tkb/sw/versions/mew/git/bin:/Users/tkb/sw/versions/groff-git/bin:/Users/tkb/sw/versions/chibi-scheme/git/bin:/usr/local/opt/tcl-tk/bin:/usr/local/opt/expat/bin:/Users/tkb/.opam/default/bin:/usr/local/opt/texinfo/bin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/curl/bin:/usr/local/opt/coreutils/libexec/gnubin:/Users/tkb/.local/bin:/Users/tkb/context-osx-64/tex/texmf-osx-64/bin:/Applications/Emacs.app/Contents/MacOS/bin:/Users/tkb/local/unix/bin:/Users/tkb/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/opt/X11/bin:/Users/tkb/local/unix/rndbin:/Applications/Racket v7.5/bin:/Users/tkb/go/bin:/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_14:/Applications/Emacs.app/Contents/MacOS/libexec-x86_64-10_14

    TROFFFONTS=/Users/tkb/Library/Fonts:/Library/Fonts

    "type troff" returns troff is /Users/tkb/sw/versions/heirloom-doctools/git/ucb/troff

(Yes, my path may be a little excessive.)

Unfortunately I haven't figured out how to do this with the :app:`BSD make`\s.

..
   Local Variables:
   time-stamp-format: "%04y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   End:

