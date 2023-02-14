.. title: The criticisms of Pascal in “Why Pascal is Not My Favorite Programming Language” applied to Oberon
.. slug: the-criticisms-of-pascal-in-why-pascal-is-not-my-favorite-programming-language-applied-to-oberon
.. date: 2022-06-05 12:29:05 UTC-04:00
.. tags: oberon,oberon-2,revised oberon,pascal,c,unix,oberon system
.. category: computer/languages/oberon
.. link: 
.. description: 
.. type: text

*Last edited: 2023-02-14 06:27:01 EST*

I reread Brian W. Kernighan’s famous paper “Why Pascal is Not My
Favorite Programming Language”
(`HTML <https://www.cs.virginia.edu/~evans/cs655/readings/bwk-on-pascal.html>`__,
`PDF <http://doc.cat-v.org/bell_labs/why_pascal/>`__) to see if those or
similar criticisms can still be applied to the Oberon family of
languages,
`Oberon <https://en.wikipedia.org/wiki/Oberon_(programming_language)>`__,
`Oberon-2 <https://en.wikipedia.org/wiki/Oberon-2>`__, and `Revised
Oberon <https://people.inf.ethz.ch/wirth/Oberon/index.html>`__. I found
Oberon-2 to be particularly inspiring, but feel that both Oberon and
Oberon-2 lack some of the practical aspects that made C such a
revelation to me back in the 1980s when I first encountered it, after
having programmed mostly in various BASICs, 6502 machine code, VAX
MACRO, and Pascal.

So, here are Kernighan’s summary, nine criticisms, along with my
comments.

1. Since the size of an array is part of its type, it is not possible to
   write general-purpose routines, that is, to deal with arrays of
   different sizes. In particular, string handling is very difficult.

   This is still a problem in the original Oberon, but Oberon-2
   introduced open arrays, which allows any size of array to be passed
   to a procedure. While you can’t return arrays of arbitrary sizes from
   a procedure, you can dynamically allocate any size array using
   ``POINTER TO ARRAY`` and ``NEW``, and return the pointer. Revised
   Oberon adopted open arrays.

2. The lack of static variables, initialization and a way to communicate
   non-hierarchically combine to destroy the “locality” of a program -
   variables require much more scope than they ought to.

   This criticism still applies. None of the Oberon languages include
   static variables or initialization.

   The lack of static variables is somewhat mitigated by the ability to
   divide things up using modules, since the tendency is to create a
   module for the shared variable and the procedures that depend on it,
   but is still clumsy if the only thing you need is a static variable
   in one procedure.

3. The one-pass nature of the language forces procedures and functions
   to be presented in an unnatural order; the enforced separation of
   various declarations scatters program components that logically
   belong together.

   Oberon and Oberon-2 allow mixing ``CONST``, ``TYPE`` and ``VAR``
   declarations in any order and to appear multiple times, but still
   requires procedure and forward procedure declarations to come after
   all other declarations. In Revised Oberon ``CONST``, ``TYPE``, and
   ``VAR`` declarations must occur and in that order, followed by
   procedure declarations, so the original criticism applies entirely
   again.

4. The lack of separate compilation impedes the development of large
   programs and makes the use of libraries impossible.

   Not a problem any more. All the Oberon languages use modules,
   introduced in Modula. Arguably, this is much superior to C’s model
   of separate compilation and using header files to ensure function
   and external variable declarations are consistent across files.

5. The order of logical expression evaluation cannot be controlled,
   which leads to convoluted code and extraneous variables.

   This appears to not apply to the Oberon languages.

6. The ‘case’ statement is emasculated because there is no default
   clause.

   Original Oberon and Oberon-2 both have ``ELSE`` clauses for ``CASE``
   statements. Revised Oberon does not.

7. The standard I/O is defective. There is no sensible provision for
   dealing with files or program arguments as part of the standard
   language, and no extension mechanism.

   IO in the Oberon family of languages is mostly defined by the
   procedures provided in the `Oberon
   System <https://en.wikipedia.org/wiki/Oberon_(operating_system)>`__,
   the operating system written in Oberon (and later in Oberon-2). It
   has good facilities for dealing with files, considered by some to be
   a better API than the familiar Unix/C API, for the functionality it
   provides.

   None of the Oberon languages provide a standard method for access
   to program arguments in the Unix/C style, as the Oberon System used
   entirely different mechanisms.  Those Oberon[-2] implementations
   I've used outside of the Oberon System all provided some access to
   the program arguments, usually as a procedure that returns the
   number of program arguments and another that returns a specific
   argument, but none of them used the same API.

8. The language lacks most of the tools needed for assembling large
   programs, most notably file inclusion.

   The addition of separately compiled modules that provide a defined
   interface mostly obviates this criticism and is superior to the
   kludge of separate complication and include files provided by C.

9. There is no escape.

   All the Oberon languages include the module ``SYSTEM``, which
   provides low level access to addresses of variables and to individual
   bits of memory, along with bit manipulation of integers. Revised
   Oberon adds access to sizes of types. Oberon and Oberon-2 provide a
   ``VAL`` function that allows interpreting a variable of one type as a
   variable of another type. Revised Oberon does not.

All the Oberon languages still have semicolon as separator instead of
semicolon as terminator.   I much prefer semicolon as terminator.

All-in-all, I'm disappointed in Revised Oberon.  While I approve of a
few of its changes, most of them seem to be a definite step backward.
I think Wirth's minimalism does him a disservice here.

..
   Local Variables:
   time-stamp-format: "%Y-%02m-%02d %02H:%02M:%02S %Z"
   time-stamp-start: "\\*Last edited:[ \t]+\\\\?"
   time-stamp-end: "\\*\\\\?\n"
   End:

