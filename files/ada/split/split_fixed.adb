with Ada.Strings; use Ada.Strings;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure split_fixed is
   -- Ada.Text_IO contains a type, Count, that would conflict with 
   -- the function Ada.Strings.Fixed.Count, so don't "use Ada.Text_IO;"
   -- instead, make a package the gives it a shorter name, and use all its
   -- procedures with that as the prefix.
   package ATIO renames Ada.Text_IO;
   type String_Ptr is access String;
   type Vector is array (Natural range <>) of String_Ptr;
   
   -- Allocate a new String in a storage pool, initializing it to S, and 
   -- returning an access to it (a pointer).
   function "+" (Source : in String) return String_Ptr  is
      SP : String_Ptr := new String'(Source);
   begin
      return SP;
   end "+";
   
   function Split (S: String; Pattern: String) return Vector is
      Start: Positive := 1;
      Position: Natural;
      Num_Parts: Natural := Count (S, Pattern) + 1;
      V : Vector (1.. Num_Parts);
      I : Natural := 0;
   begin
      while Start <= S'Length loop
         Position := Index (S, Pattern, Start);
         exit when Position = 0;
         I := I + 1;
         V (I) := +S(Start..Position-1);
          -- The pattern can be longer than one character.
         Start := Position + Pattern'Length;
      end loop;
      I := I + 1;
      V (I) := +S(Start..S'Last);

      return V;
   end Split;
   
   procedure Print_Vector (Label: String; S: String; V: Vector) is 
      N: Natural := 0;
   begin
      ATIO.Put_Line (Label & ": """ & S & """");
      for I in V'First .. V'Last loop
         N := N + 1;
         ATIO.Put ("    Part "); Put (N, 0); ATIO.Put (": """); 
         ATIO.Put (V(I).all); 
         ATIO.Put_Line ("""");
      end loop;
   end Print_Vector;

   S1: String := "Hello, World!|I am fine!|How are you?";
   V1: Vector := Split (S1, "|");
   S2: String := "";                    --  Empty string.
   V2: Vector := Split (S2, "|");
   S3: String := "|";                   --  Just one  of pattern.
   V3: Vector := Split (S3, "|");
   S4: String := "||";                  --  Just two of pattern.
   V4: Vector := Split (S4, "|");
   S5: String := "one";                 --  Just one part.
   V5: Vector := Split (S5, "|");
   -- The delimiter doesn't have to be one character.
   S6: String := "foo<=>bar";
   V6: Vector := Split (S6, "<=>");
   
begin
   Print_Vector ("S1", S1, V1);
   Print_Vector ("S2", S2, V2);
   Print_Vector ("S3", S3, V3);
   Print_Vector ("S4", S4, V4);
   Print_Vector ("S5", S5, V5);
   Print_Vector ("S6", S6, V6);
end split_fixed;
