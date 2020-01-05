class
	APPLICATION

create -- Constructor
	make

feature -- Basic operations

	x: INTEGER -- Define variable
	y: INTEGER -- Define variable
	i: INTEGER -- Define variable

	make -- Declare Function
		do
			x := 5*(6-3)+1
			y := -6/3*(-2)*5+20
			subprogram()
		end

	subprogram -- Declare Function
		do
			if x > y then
				from
					i := 1
				until
					i > x
				loop
					print("Hello, World !")
					i := i + 1
				end
			else
				print("Bye !")
			end
		end

end
