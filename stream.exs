defmodule Benchmark do
  def measure(func) do
    func
    |> :timer.tc
    |> elem(0)
    |> IO.puts
  end
end

double = fn (n) -> n * 2 end
is_even = fn (n) -> rem(n, 2) == 0 end
add = fn (a, b) -> a + b end

using_enum = fn range ->
    range
    |> Enum.filter(is_even) 
    |> Enum.map(double)
    |> Enum.reduce(add)
    |> IO.puts
  end

using_stream = fn range ->
    range
    |> Stream.filter(is_even)
    |> Stream.map(double) 
    |> Enum.reduce(add)
    |> IO.puts
  end

using_enum.(1..100)
using_stream.(1..100)