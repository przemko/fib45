functor
import
  Application
  System
define

	fun {Fib N}
  		case N
    		of 0 then 1
    		[] 1 then 1
    		else {Fib N-1} + {Fib N-2}
  		end
	end

	{System.show {Fib 45}}
	{Application.exit 0}

end
