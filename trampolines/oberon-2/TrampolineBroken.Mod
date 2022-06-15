MODULE TrampolineBroken;              (* Fail to demonstrate lisp-style trampolines. *)
  IMPORT Out;

  TYPE Thunk = PROCEDURE (): Thunk; (* This is an error. *)

  VAR next: Thunk;

  PROCEDURE baz (): Thunk;
  BEGIN
    Out.String ("baz"); Out.Ln;
    next := NIL;
  END baz;

  PROCEDURE bar (): Thunk;
  BEGIN
    Out.String ("bar"); Out.Ln;
    next := baz;
  END bar;

  PROCEDURE foo (): Thunk;
  BEGIN
    Out.String ("foo"); Out.Ln;
    next := bar;
  END foo;

BEGIN
  next := foo;
  WHILE next # NIL DO
    next := next ();
  END;
END TrampolineBroken.
