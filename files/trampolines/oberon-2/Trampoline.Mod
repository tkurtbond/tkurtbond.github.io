MODULE Trampoline;              (* Demonstrate lisp-style trampolines. *)
  IMPORT Out;

  TYPE Thunk = PROCEDURE ();

  VAR next: Thunk;              (* Next procedure to be called. *)

  PROCEDURE baz ();
  BEGIN
    Out.String ("baz"); Out.Ln;
    next := NIL;
  END baz;

  PROCEDURE bar ();
  BEGIN
    Out.String ("bar"); Out.Ln;
    next := baz;
  END bar;

  PROCEDURE foo ();
  BEGIN
    Out.String ("foo"); Out.Ln;
    next := bar;
  END foo;

BEGIN
  next := foo;
  WHILE next # NIL DO
    next ();
  END;
END Trampoline.
