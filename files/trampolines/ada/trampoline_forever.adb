with Ada.Text_IO; use Ada.Text_IO;
procedure trampoline_forever is
  -- Recurse forever without running out of stack space.
  type Unsigned is mod 2**64;   -- wrap to 0 when maximum value is execeeded.
  i: Unsigned := 0;             -- Number of times through the trampoline. 

  type Thunk is access procedure;

  Next: Thunk := null;          -- Next procedure to be called.

  procedure foo;        -- forward declaration.

  procedure baz is
  begin
    Put_Line ("baz");
    Next := foo'access;
  end baz;

  procedure bar is
  begin
    Put_Line ("bar");
    Next := baz'Access;
  end bar; 

  procedure foo is
  begin
    Put_Line ("foo");
    Next := bar'Access;
  end foo;

begin
  next := foo'Access;
  while Next /= null loop
    i := i + 1;
    Put ("call #"); Put (i'Image); New_Line;
    Next.all;      
  end loop;
exception
  when STORAGE_ERROR => 
  Put ("STORAGE_ERROR raised with i = "); Put (i'Image); New_Line;
end trampoline_forever;
