defmodule Benchmark do
  def measure(func) do
    func
    |> :timer.tc
    |> elem(0)
    |> IO.puts
  end
end

double = &(&1 * 2)
is_even = &(rem(&1, 2) == 0)

using_enum = fn range ->
    range
    |> Enum.filter(is_even) 
    |> Enum.map(double)
    |> IO.inspect
  end

using_stream = fn range ->
    range
    |> Stream.filter(is_even)
    |> Stream.map(double) 
    |> Enum.to_list()
    |> IO.inspect
  end

using_enum.(1..100)
using_stream.(1..100)