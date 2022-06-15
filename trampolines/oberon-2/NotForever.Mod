MODULE NotForever;              (* Recurse until stack space runs out. *)
  IMPORT Out;
  VAR i: LONGINT;               (* Number of times f has been called. *)

  PROCEDURE f;
  BEGIN
    INC(i);
    Out.String ("call #"); Out.Int (i, 0); Out.Ln;
    f;
  END f;

BEGIN
  i := 0;
  f;
END NotForever.
