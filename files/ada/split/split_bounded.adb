with Ada.Strings; use Ada.Strings;
with Ada.Strings.Bounded; use Ada.Strings.Bounded;
with Ada.Text_IO.Bounded_IO;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Containers.Vectors;
procedure split_bounded is
   package B_String is new 
     Ada.Strings.Bounded.Generic_Bounded_Length (Max => 128);
   use B_String;
   package B_String_IO is new Bounded_IO (B_String); use B_String_IO;
   package Bounded_String_Vectors is new
     Ada.Containers.Vectors (Natural, Bounded_String);
   use Bounded_String_Vectors;

   subtype BS_Vector is Bounded_String_Vectors.Vector;

   function Split (S: Bounded_String; Pattern: String)
                  return BS_Vector is
      Start: Positive := 1;
      Position: Natural;
      Num_Parts: Natural := 0;
      V : BS_Vector;
   begin
      while Start <= Length (S) loop
         Position := Index (S, Pattern, Start);
         exit when Position = 0;
         Append (V, Bounded_Slice (S, Start, Position - 1));
          -- The pattern can be longer than one character.
         Start := Position + Pattern'Length;
      end loop;
      Num_Parts := Num_Parts + 1;
      Append (V, Bounded_Slice (S, Start, Length (S)));

      return V;
   end Split;
   
   procedure Print_BS_Vector (Label: String; 
                              S: Bounded_String; 
                              V: BS_Vector) is 
      N : Natural := 0;
   begin
      Put_Line (label & ": """ & S & """");
      for I in V.First_Index .. V.Last_Index loop
         N := N + 1;
         Put ("    Part "); Put (N, 0); Put (": """); Put (V(I)); 
         Put_Line ("""");
      end loop;
   end Print_BS_Vector;

   S1: Bounded_String := To_Bounded_String ("Hello, World!|I am fine!|How are you?");
   V1: BS_Vector := Split (S1, "|");
   S2: Bounded_String := To_Bounded_String ("");      --  Empty string.
   V2: BS_Vector := Split (S2, "|");
   S3: Bounded_String := To_Bounded_String ("|");     --  Just one  of pattern.
   V3: BS_Vector := Split (S3, "|");
   S4: Bounded_String := To_Bounded_String ("||");    --  Just two of pattern.
   V4: BS_Vector := Split (S4, "|");
   S5: Bounded_String := To_Bounded_String ("one");   --  Just one part.
   V5: BS_Vector := Split (S5, "|");
   -- The delimiter doesn't have to be one character.
   S6: Bounded_String := To_Bounded_String ("foo<=>bar");
   V6: BS_Vector := Split (S6, "<=>");
   
begin
   Print_BS_Vector ("S1", S1, V1);
   Print_BS_Vector ("S2", S2, V2);
   Print_BS_Vector ("S3", S3, V3);
   Print_BS_Vector ("S4", S4, V4);
   Print_BS_Vector ("S5", S5, V5);
   Print_BS_Vector ("S6", S6, V6);
end split_bounded;
