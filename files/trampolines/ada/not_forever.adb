with Ada.Text_IO; use Ada.Text_IO;
procedure not_forever is        -- recurse until stack space runs out.
  type Unsigned is mod 2**64;   -- wrap to 0 when maximum value is execeeded.
  i: Unsigned := 0;             -- Number of times f has been called.

  procedure f is
  begin
    i := i + 1;
    f;
  end f;

begin
  f;
exception
  when STORAGE_ERROR => 
  Put ("STORAGE_ERROR raised with i = "); Put (i'Image); New_Line;
end not_forever;
