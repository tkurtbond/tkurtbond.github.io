with Ada.Strings; use Ada.Strings;
with Ada.Strings.Bounded; use Ada.Strings.Bounded;
with Ada.Text_IO.Bounded_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure split_bounded is
   package B_String is new 
     Ada.Strings.Bounded.Generic_Bounded_Length (Max => 128);
   use B_String;
   package B_String_IO is new Bounded_IO (B_String); use B_String_IO;

   type Vector is array (Natural range <>) of Bounded_String;

   function Split (S: Bounded_String; Pattern: String)
                  return Vector is
      Start: Positive := 1;
      Position: Natural;
      Num_Parts: Natural := B_String.Count (S, Pattern) + 1;
      V : Vector (1 .. Num_Parts);
      I : Natural := 0;
   begin
      while Start <= Length (S) loop
         Position := Index (S, Pattern, Start);
         exit when Position = 0;
         I := I + 1;
         V (I) := Bounded_Slice (S, Start, Position - 1);
          -- The pattern can be longer than one character.
         Start := Position + Pattern'Length;
      end loop;
      I := I + 1;
      V (I) := Bounded_Slice (S, Start, Length (S));

      return V;
   end Split;
   
   procedure Print_Vector (Label: String; S: Bounded_String; V: Vector) is 
      N : Natural := 0;
   begin
      Put_Line (label & ": """ & S & """");
      for I in V'First .. V'Last loop
         N := N + 1;
         Put ("    Part "); Put (N, 0); Put (": """); Put (V(I)); 
         Put_Line ("""");
      end loop;
   end Print_Vector;

   S1: Bounded_String := To_Bounded_String ("Hello, World!|I am fine!|How are you?");
   V1: Vector := Split (S1, "|");
   S2: Bounded_String := To_Bounded_String ("");      --  Empty string.
   V2: Vector := Split (S2, "|");
   S3: Bounded_String := To_Bounded_String ("|");     --  Just one  of pattern.
   V3: Vector := Split (S3, "|");
   S4: Bounded_String := To_Bounded_String ("||");    --  Just two of pattern.
   V4: Vector := Split (S4, "|");
   S5: Bounded_String := To_Bounded_String ("one");   --  Just one part.
   V5: Vector := Split (S5, "|");
   -- The delimiter doesn't have to be one character.
   S6: Bounded_String := To_Bounded_String ("foo<=>bar");
   V6: Vector := Split (S6, "<=>");
   
begin
   Print_Vector ("S1", S1, V1);
   Print_Vector ("S2", S2, V2);
   Print_Vector ("S3", S3, V3);
   Print_Vector ("S4", S4, V4);
   Print_Vector ("S5", S5, V5);
   Print_Vector ("S6", S6, V6);
end split_bounded;
