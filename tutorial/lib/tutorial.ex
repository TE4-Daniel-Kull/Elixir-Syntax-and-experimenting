defmodule Tut do
  def rehearse_types() do
    IO.puts(47) # Integer
    IO.puts(47.5) # Float
    IO.puts(Oo57) # Octal
    IO.puts(OxF1) # Hex
    IO.puts(Ob1101) # Binary
    IO.puts(47.0e3) # Exponent
    IO.puts(:hello) # Atom
    IO.puts(true) # Boolean
    IO.puts(false) # Boolean
    IO.puts("Hello world")        # UTF-8 string
    IO.puts("""
            This is a multi-
            line comment! :D
            """)                  # Multiline comment
    IO.puts("<<255, 5, 1, 8>>")   # Binaries
    IO.puts("<<0, 289::size(15)>>") # Binaries of different sizes
    [1, "Hello", :an_atom, true]  # List (linked list)
    { 1, "Hello", :an_atom, true} # Tuple (contious memory block)
    variable = 420
    IO.puts(variable) # Variable (Avoid using this!)
  end

  def rehearse_a_operators() do
    IO.puts(2 + 4)
    IO.puts(2 - 4)
    IO.puts(2 * 4)
    IO.puts(2 / 4)
    IO.puts(div(5, 2)) # => 2     (Whole number)
    IO.puts(rem(5, 2)) # => 1   (Remainder 1/2)
  end

  def rehearse_c_and_l_operators do
    IO.puts(10 == 10) # Is equal to
    IO.puts(10 != 10) # Is not equal to
    IO.puts(10 === "Hello") # Is same type and same value? (Type comparison and value comparison)
    IO.puts(10 !== "Hello") # Is not same -|-
    IO.puts(10 < 20) # Is less than?
    IO.puts(10 > 20) # Is larger than?
    IO.puts(10 <= 20) # Less than or equal to
    IO.puts(10 >= 20) # Larger than or equal to
    IO.puts(true && true && (true || false) && !false) # And, Or, Not
    IO.puts("""
    &&&
    |||
    >>>
    <<<
    ^^^
    ~~~
    I don't understand this....
    """)
  end

  def rehearse_pattern_matching() do
    x = 12 # x will match anything
    IO.puts(x)
    x = "Blablabla" # x will match anything
    IO.puts(x)
    [var_1, _unused_var, var_2] = ["First variable", 25, "Second variable"] # Will match the first second and third value
    IO.puts(var_1)
    IO.puts(var_2)
    [_, [_, {a}]] = ["Random string", [:an_atom, {24}]] # Will match the integer inside the tuple and ignore the first two values.
    IO.puts(a)

    a = 25
    b = 25
    ^a = b # Matches the value of a with the value of b
  end

  def rehearse_conditions() do
    if true do # If, else statement
      IO.puts("If statement true")
    else
      IO.puts("If statement false")
    end

    unless false do # Unless statement (Inverted if statement)
      IO.puts("Unless statement false")
    end

    cond do # Cond statement
      true -> IO.puts("This was true first")
      true -> IO.puts("This was true second") # Will not be executed if condition before was true
    end

    a = 6
    case a do # Case statement (Pattern matching!)
      1 -> IO.puts("a is one")
      2 -> IO.puts("a is two")
      3 -> IO.puts("a is 3")
      x -> IO.puts("a is anything but 1, 2 or 3. a was " <> Kernel.inspect(x)) # matches everything! (x will be the value of a)
    end
  end

  def rehearse_strings() do
    str = "Hello world" # A normal string
    IO.puts(str)

    b = "String interpolation"
    a = "This is #{b}"        # String interpolation
    IO.puts(a)
    IO.puts("The string a is #{String.length(a)}  characters long") # Length of string
  end

  # Tut.rehearse_map(["Daniel", "Arvid"], &(&1))
  def rehearse_map(_list, _fun, acc \\ []) # Basic Map function
  def rehearse_map([], _fun, acc), do: Enum.reverse(acc)
  def rehearse_map([head | tail], fun, acc), do: rehearse_map(tail, fun, [fun.(head) | acc])


  def count(_, acc \\ 0) # Setup default values
  def count([], acc), do: acc
  def count([ _ | tail], acc), do: count(tail, acc + 1)
  #                                                       Rehearse general functions
  def english_hello(name), do: IO.puts("Hello #{name}")
  def german_hello(name), do: IO.puts("Hallo #{name}")
  # Tut.general_rollcall(["Dan", "ManMan"], &(IO.puts("Goddag #{&1}")))
  # Tut.general_rollcall(["Dan", "ManMan"], fn x -> IO.puts("Goddag #{x}") end)
  # Tut.rollcall(["Daniel", "Man"], &Tut.german_hello/1)
  def general_rollcall([], _), do: IO.puts("")
  def general_rollcall([name | names], greeter_function) do
    greeter_function.(name)
    general_rollcall(names, greeter_function)
  end
end
