with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_Io;
with Ada.Text_IO.Unbounded_IO; use Ada.Text_IO.Unbounded_IO;
with Ada.Containers.Vectors;
procedure split_unbounded is
   package Unbounded_String_Vectors is new
     Ada.Containers.Vectors (Natural, Unbounded_String);
   use Unbounded_String_Vectors;

   function "+" (Source : in String)
                return Unbounded_String renames To_Unbounded_String;
   subtype UBS_Vector is Unbounded_String_Vectors.Vector;

   function Split (S: Unbounded_String; Pattern: String)
                  return UBS_Vector is
      Start: Positive := 1;
      Position: Natural;
      Num_Parts: Natural := 0;
      V : UBS_Vector;
   begin
      while Start <= Length (S) loop
         Position := Index (S, Pattern, Start);
         exit when Position = 0;
         Append (V, Unbounded_Slice (S, Start, Position - 1));
          -- The pattern can be longer than one character.
         Start := Position + Pattern'Length;
      end loop;
      Num_Parts := Num_Parts + 1;
      Append (V, Unbounded_Slice (S, Start, Length (S)));

      return V;
   end Split;
   
   procedure Print_UBS_Vector (Label: String; 
                               S: Unbounded_String; 
                               V: UBS_Vector) is 
      N : Natural := 0;
   begin
      Put_Line (Label & ": """ & to_string (s) & """");
      for I in V.First_Index .. V.Last_Index loop
         N := N + 1;
         Put ("    Part "); Put (N, 0); Put (": """); Put (V(I)); 
         Put_Line ("""");
      end loop;
   end Print_UBS_Vector;

   S1: Unbounded_String := +"Hello, World!|I am fine!|How are you?";
   V1: UBS_Vector := Split (S1, "|");
   S2: Unbounded_String := +"";         --  Empty string.
   V2: UBS_Vector := Split (S2, "|");
   S3: Unbounded_String := +"|";        --  Just one  of pattern.
   V3: UBS_Vector := Split (S3, "|");
   S4: Unbounded_String := +"||";       --  Just two of pattern.
   V4: UBS_Vector := Split (S4, "|");
   S5: Unbounded_String := +"one";      --  Just one part.
   V5: UBS_Vector := Split (S5, "|");
   -- The delimiter doesn't have to be one character.
   S6: Unbounded_String := +"foo<=>bar";
   V6: UBS_Vector := Split (S6, "<=>");
   
begin
   Print_UBS_Vector ("S1", S1, V1);
   Print_UBS_Vector ("S2", S2, V2);
   Print_UBS_Vector ("S3", S3, V3);
   Print_UBS_Vector ("S4", S4, V4);
   Print_UBS_Vector ("S5", S5, V5);
   Print_UBS_Vector ("S6", S6, V6);
end split_unbounded;
