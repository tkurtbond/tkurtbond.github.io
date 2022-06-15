MODULE TrampolineForever;
  (* Recurse forever without running out of stack space.  *)
  IMPORT Out;

  TYPE Thunk = PROCEDURE ();

  VAR
    next: Thunk;         (* Next procedure to be called. *)
    i: INTEGER;          (* Number of times through the trampoline. *)

  PROCEDURE ^foo;        (* Forward declaration. *)

  PROCEDURE baz ();
  BEGIN
    Out.String ("baz"); Out.Ln;
    next := foo;
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
  i := 0;
  next := foo;
  WHILE next # NIL DO
    INC (i);
    Out.String ("call #"); Out.Int (i, 0); Out.Ln;
    next ();
  END;
END TrampolineForever.
