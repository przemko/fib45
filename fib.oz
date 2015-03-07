functor
import
  Application
  System
define
   fun {Fib N}
      if N < 2 then
	 1
      else
	 {Fib N-1} + {Fib N-2}
      end
   end
   
   {System.show {Fib 45}}
   {Application.exit 0}
end
