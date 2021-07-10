words = ~w{ant buffalo cat dingo}

group_by_and_get_first_letter = fn words ->
  words
  |> Enum.group_by(&String.length/1, &String.first/1)
  |> IO.inspect
end

group_by_and_get_first_letter.(words)