with Ada.Text_IO; use Ada.Text_IO;
procedure trampoline is         -- Demonstrate lisp-style trampolines.
    type Thunk is access procedure;

    Next: Thunk := null;        -- Next procedure to be called.

    procedure baz is
    begin
        Put_Line ("baz");
        Next := null;
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
        Next.all;          
    end loop;
end trampoline;
