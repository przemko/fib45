with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Fib is

   function FibRek(N: Integer) return Integer is
   begin
      if N <= 1 then
         return 1;
      else
         return FibRek(N-1) + FibRek(N-2);
      end if;
   end FibRek;

begin
   Put(FibRek(45));
   New_Line;
end Fib;
