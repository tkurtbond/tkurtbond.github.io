.. title: Lisp-style trampolines in Common Lisp, C, Ada, Oberon-2, and Revised Oberon
.. slug: lisp-style-trampolines-in-common-lisp-c-ada-oberon-2-and-revised-oberon
.. date: 2022-06-14 15:49:55 UTC-04:00
.. tags: ada,c,common lisp,oberon-07,oberon-2,trampolines,tail call optimization,lisp-style trampolines,cheney on the m.t.a.,cps,continuation-passing style,no assembly required,scheme,rabbit,uuo handler,tail call,clisp,sbcl,ecl,gcc,revised oberon,pascal,modula,modula-2,type extensions,record types,oberon system,niklaus wirth,hanspeter mössenböck,vishap oberon,obnc,gnat,github,ocaml
.. category: computer/languages
.. link:
.. description:
.. type: text

.. role:: app
.. role:: file

*Last edited: 2024-05-29 15:13:15 EDT*

Are you familiar with `lisp-style trampolines`__?  A trampoline is a
loop that iteratively invokes functions that return functions.  The
previous link will lead you through `CONS Should Not CONS Its
Arguments, Part II: Cheney on the M.T.A.`__ (`PDF version`_; see p. 17
in the original publication, but that is the first page of the PDF
that link eventually leads to), which, while saying you should just go
ahead and convert to `Continuation-passing style`_ form (CPS),
mentions in passing `No assembly required: compiling standard ML to C`__,
(see p. 168 in the original publication, which is the page 8 of the
PDF that link eventually leads to) which leads you to `RABBIT: A
Compiler for SCHEME`__, where the concept is discussed under the name
the "SCHEME UUO handler" (see p. 23–24).

__ https://en.wikipedia.org/wiki/Trampoline_(computing)#High-level_programming
__ https://en.wikipedia.org/wiki/Trampoline_(computing)#cite_note-Baker_1995-1
.. _PDF Version: https://dl.acm.org/doi/10.1145/214448.214454
__ https://dl.acm.org/doi/10.1145/151333.151343
__ https://dspace.mit.edu/handle/1721.1/6913
.. _Continuation-passing style: https://en.wikipedia.org/wiki/Continuation-passing_style

Why is this useful?  It allows you to compile a language that requires
proper `tail call`_ optimization to one that does not provide that.
For instance, if you wanted to compile Scheme, which requires proper
tail call optimization, to Common Lisp, which does not require proper
tail call optimization, you can't just translate Scheme functions
directly into Common Lisp functions, because tail calls allocate stack
space, and eventually the stack will run out of space.

.. _tail call: https://en.wikipedia.org/wiki/Tail_call

Here's an example that will run forever in any standard confirming
Scheme, `forever.scm`_:

.. _forever.scm: /trampolines/forever.scm

.. include:: files/trampolines/forever.scm
   :code: scheme

Here's `not_forever.lisp`_, the same thing in Common Lisp:

.. _not_forever.lisp: /trampolines/common-lisp/not_forever.lisp

.. include:: files/trampolines/common-lisp/not_forever.lisp
   :code: common-lisp

Now, some Common Lisp implementations don't do tail call
optimization, and some **do**.  Some don't do tail call optimization
unless you compile the functions in question.

So, for instance, if I load that file into GNU CLISP 2.49.92, the
function executes about 4668 times and then :app:`CLISP` dies with the
error message::

   *** - Lisp stack overflow. RESET

However if I compile that file in :app:`CLISP` with the Common Lisp function
``compile-file`` and then load the resulting :file:`.fas` file into
:app:`CLISP`, it will run forever, because :app:`CLISP` does tail call
optimization when it compiles code.

Furthermore, if I load that file into :app:`SBCL` it will run forever,
because :app:`SBCL` does tail call optimization by default.

:app:`ECL` is another Common Lisp system where if you load that file
into  an interactive session it will die with stack overflow, but if
you compile that file into an executable it will run forever.

So, suppose you wanted to translate the Scheme code into Common Lisp,
for an implementation that does not do tail call optimization.  You'd
use a trampoline to make sure the stack doesn't overflow.

Here's `trampoline.lisp`_, a trampoline in Common Lisp that runs
through three functions and then stops, for simplicity:

.. _trampoline.lisp: /trampolines/common-lisp/trampoline.lisp

.. include:: files/trampolines/common-lisp/trampoline.lisp
   :code: common-lisp

Here's `trampoline_forever.lisp`_, a trampoline in Common Lisp that
runs forever:

.. _trampoline_forever.lisp: /trampolines/common-lisp/trampoline_forever.lisp

.. include:: files/trampolines/common-lisp/trampoline_forever.lisp
   :code: common-lisp

Of course, you can do the same things in C.  First, here's
`not_forever.c`_, a program in C that will (usually) die with a stack
overflow:

.. _not_forever.c: /trampolines/c/not_forever.c

.. include:: files/trampolines/c/not_forever.c
   :code: c

I say usually, because tail call optimization is not required by the
standard, and many C compilers do not do it.  For instance, :app:`gcc`
doesn't do tail call optimization **unless** you specify
``-foptimize-sibling-calls`` or ``-O2``, ``-O3``, or ``-Os``.  If I
don't specify any of those options, on my system that program dies
with the error ``Segmentation fault: 11`` after call #523932.

Here's `trampoline.c`_, the limited trampoline in C:

.. _trampoline.c: /trampolines/c/trampoline.c

.. include:: files/trampolines/c/trampoline.c
   :code: c

Notice this works by converting pointers to functions to pointers to void
— it doesn't even require any explicit casting!

And here's `trampoline_forever.c`_, the trampoline that runs forever:

.. _trampoline_forever.c: /trampolines/c/trampoline_forever.c

.. include:: files/trampolines/c/trampoline_forever.c
   :code: c

So, here's where C's weak typing lets it get away with things that
more strongly typed languages don't.  Notice the declaration of the
trampoline type:

.. code:: c

   type def void* (*trampoline)(void);

.. _mentioning recursive types:

Notice how it returns a ``void *``, instead of something more
specific?  That's because if it tried to return something more
specific, it would have to have a `recursive type`_: that is to say, while
defining the type ``trampoline``, you would use a reference to the
type while defining the type.  It would look something like this:

.. code:: c

   typedef trampoline* (*trampoline)(void);

and that results in :app:`gcc` issuing the following error::

   error: unknown type name 'trampoline'

Very few traditional programming languages allow this.  It isn't a
problem in Scheme or Common Lisp because those languages use strong
dynamic typing, where the types are checked at runtime.

So how do you do this in languages with strong static typing, where
the types are checked at compile time?

Well, let's try this in some of the Oberon_ programming language
dialects.  Oberon_ was designed and implemented by Niklaus Wirth
(NW1_, NW2_) as a simplification and generalization of his earlier
languages Pascal_, Modula_, and Modula-2_.  (Here's `The Programming
Language Oberon (1990)`__, the original Oberon language report, in PDF
for reference.)  I find the original Oberon admirable for its
simplicity, strong typing, understandable syntax, and its introduction
of `Type Extensions`_ (which organizes `record types`_ in a
inheritance hierarchy, which with the use of procedure variables
enables object oriented programming in a particularly straightforward
and flexible way) but struggle with its minimalism and how its
standard libraries differ in paradigm from the standard Unix
libraries, since Oberon was used to implement a new operating system,
the `Oberon System`_ with its own completely unique API_.

.. _Oberon: https://en.wikipedia.org/wiki/Oberon_(programming_language)
.. _NW1: https://people.inf.ethz.ch/wirth/
.. _NW2: https://en.wikipedia.org/wiki/Niklaus_Wirth
.. _Pascal: https://en.wikipedia.org/wiki/Pascal_(programming_language)
.. _Modula: https://en.wikipedia.org/wiki/Modula
.. _Modula-2: https://en.wikipedia.org/wiki/Modula-2
__ https://people.inf.ethz.ch/wirth/Oberon/Oberon.Report.pdf
.. _Type Extensions: https://dl.acm.org/doi/abs/10.1145/42190.46167
.. _Oberon System: https://en.wikipedia.org/wiki/Oberon_(operating_system)
.. _API: https://en.wikipedia.org/wiki/API
.. _record types: https://en.wikipedia.org/wiki/Record_(computer_science)

Oberon_ has a number of dialects. I'm most fond of Oberon-2_, which
was the second language in the Oberon_ family, developed by `Hanspeter
Mössenböck`_ and Niklaus Wirth.  It is a little less minimalist than
Oberon_, and among a few other things adds type-bound procedures to
the record hierarchy provided by `Type Extensions`_, providing a
appealingly simple and direct design for object-oriented programming
that was later adopted by the Ada_ programming language in a more
complicated and subtle version, as might be expected by Ada_'s
plethora of design goals and constraints.  (Here's a couple of papers
that mention it: `Object-oriented programming through type
extension in Ada 9X`__ (ADAOO1PDF_) and `Integrating Object-Oriented
Programming and Protected Objects in Ada 95`__ (ADAOO2PDF_).  I wish I
knew of a reference that discussed explicitly the process of choosing
`Type Extensions`_ for Ada_ and how they were adopted and adapted in
Ada_.)

Here's a copy of the Oberon-2 language report in PDF (O2PDF_) and HTML
(O2HTML_), for reference.

.. _Oberon-2: https://en.wikipedia.org/wiki/Oberon-2
.. _Hanspeter Mössenböck: https://en.wikipedia.org/wiki/Hanspeter_M%C3%B6ssenb%C3%B6ck
.. _Ada: https://en.wikipedia.org/wiki/Ada_(programming_language)
__ https://dl.acm.org/doi/10.1145/122028.122033
.. _ADAOO1PDF: https://dl.acm.org/doi/pdf/10.1145/122028.122033
__ http://citeseer.ist.psu.edu/viewdoc/summary?doi=10.1.1.167.7445&rank=1
.. _ADAOO2PDF: http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.167.7445&rep=rep1&type=pdf
.. _O2PDF: /Oberon-2/Oberon2.pdf
.. _O2HTML: https://web.archive.org/web/20151104101932/https://cseweb.ucsd.edu/~wgg/CSE131B/oberon2.htm

Anyway, Oberon-2_ has procedure types and procedure variables, so one
would think it would be simple to implement trampolines in Oberon-2_,
without messing about with pointers.  It turns out to be more
complicated than one would think.

I'm using `Vishap Oberon`_, a free and open source Oberon-2 compiler,
by the way.

.. _Vishap Oberon: https://github.com/vishaps/voc

First, here's `NotForever.Mod`_, the standard program with a recursive
function procedure that will overflow the stack.

.. _NotForever.Mod: /trampolines/oberon-2/NotForever.Mod

.. include:: files/trampolines/oberon-2/NotForever.Mod
   :code: modula2

On my system, this program dies with with the error ``Segmentation
fault: 11`` after call #524008.

Now on to trampolines.  In theory we should be able to declare a type
that is a function procedure that returns other function procedures.
Here's the first attempt at the limited trampoline,
`TrampolineBroken.Mod`_.

.. _TrampolineBroken.Mod: /trampolines/oberon-2/TrampolineBroken.Mod

.. include:: files/trampolines/oberon-2/TrampolineBroken.Mod
   :code: modula2

Unfortunately, trying to compile this dies with the following error
message::

   TrampolineBroken.Mod  Compiling TrampolineBroken.

      4:   TYPE Thunk = PROCEDURE (): Thunk;
                                ^
       pos   126  err 244  cyclic type definition not allowed

   Module compilation failed.

As mentioned above_, this is a case of a `recursive type`_.  Well, drat.

.. _above: #mentioning-recursive-types
.. _recursive type: https://en.wikipedia.org/wiki/Recursive_data_type

At this point the immediate reaction is to look at the C version and
try to hack up something analogous using functionality from
Oberon-2_'s ``SYSTEM`` module, but that way lies difficulty,
type errors, and madness.  Instead, you have to step back and think about
things from another viewpoint.  The problem is that we can't declare a
type for a function procedure that returns another function procedure
of its type, because that is recursive.  Instead of trying for a
`recursive type`_, what if we switched to storing the next procedure
to be run in a global variable, ``next``, and having each procedure in
the chain set that to the procedure that should run next?  That should
work!

Here's `Trampoline.Mod`_, a version that works!

.. _Trampoline.Mod: /trampolines/oberon-2/Trampoline.Mod

.. include:: files/trampolines/oberon-2/Trampoline.Mod
   :code: modula2

And here's `TrampolineForever.Mod`_, which also works!

.. _TrampolineForever.Mod: /trampolines/oberon-2/TrampolineForever.Mod

.. include:: files/trampolines/oberon-2/TrampolineForever.Mod
   :code: modula2

Wirth has continued to work on Oberon, producing an even more
minimalist revision, often know as Oberon-07, or `Revised Oberon`_.
(Here's the `The Programming Language Oberon-07 (Revised Oberon)`__ in
PDF, for reference.)  Unfortunately, he removed forward declarations
and the ``LONGINT`` type, which means we have to make some minor
changes.

.. _Revised Oberon: https://people.inf.ethz.ch/wirth/Oberon/index.html
__ https://people.inf.ethz.ch/wirth/Oberon/Oberon07.Report.pdf

I'm using OBNC (OBNC1_, OBNC2_) for `Revised Oberon`_.

.. _OBNC1: https://miasap.se/obnc/
.. _OBNC2: https://github.com/GunterMueller/OBNC

Here's the `Revised Oberon NotForever.Mod`_, with ``LONGINT`` replaced
by ``INTEGER``:

.. _Revised Oberon NotForever.Mod: /trampolines/revised-oberon/NotForever.Mod

.. include:: files/trampolines/revised-oberon/NotForever.Mod
   :code: modula2

Here's the `Revised Oberon Trampoline.Mod`_:

.. _Revised Oberon Trampoline.Mod: /trampolines/revised-oberon/Trampoline.Mod

.. include:: files/trampolines/revised-oberon/Trampoline.Mod
   :code: modula2

Here's the `Revised Oberon TrampolineForever.Mod`_, with a workaround
for the removal of forward declarations of procedures:

.. _Revised Oberon TrampolineForever.Mod: /trampolines/revised-oberon/TrampolineForever.Mod

.. include:: files/trampolines/revised-oberon/TrampolineForever.Mod
   :code: modula2

Note that with forward declarations removed, we just declare a
procedure variable, ``forward``, initialize it before starting the
trampoline, and refer to it instead of ``foo`` in procedure ``baz``.



And of course, since we mentioned Ada_ above, we should do a version
in that.  I'm using GNAT_.

.. _GNAT: https://en.wikipedia.org/wiki/GNAT

Here's `not_forever.adb`_:

.. _not_forever.adb: /trampolines/ada/not_forever.adb

.. include:: files/trampolines/ada/not_forever.adb
   :code: ada

Since Ada_ has exceptions, we actually catch the exception that
happens when the stack runs out of space::

  STORAGE_ERROR raised with i =  262002

Again, Ada_ would have the same problem with `recursive type`_\s as
the Oberon dialects.  Don't look at the C version and wander off into
forest of ``Ada.Unchecked_Conversion`` because that's unsafe, or the
thicket of ``System.Address_To_Access_Conversions``, because that
one's also unsafe and more complicated (and the simple approach didn't
work, when I tried it).  Instead, do the same thing as we did in the
Oberon dialects, and move to a global variable instead of returning
the values from the functions.

Here's `trampoline.adb`_:

.. _trampoline.adb: /trampolines/ada/trampoline.adb

.. include:: files/trampolines/ada/trampoline.adb
   :code: ada

And here's `trampoline_forever.adb`_:

.. _trampoline_forever.adb: /trampolines/ada/trampoline_forever.adb

.. include:: files/trampolines/ada/trampoline_forever.adb
   :code: ada

********

Of course, languages with more sophisticated type systems have other
ways of dealing with things, but I haven't investigated them.  I did
stumble across an example_ in OCaml (OCAML1_, OCAML2_).

.. _example: https://gist.github.com/rapha/119788
.. _OCAML1: https://en.wikipedia.org/wiki/OCaml
.. _OCAML2: https://ocaml.org/

********

If you want to play around with this, the code is in a 
repository_ at Github_.

.. _GitHub: https://github.com/
.. _repository: https://github.com/tkurtbond/trampolines

..
   Local Variables:
   time-stamp-format: "%Y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   End:

