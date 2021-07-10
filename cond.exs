# case 는 다른 값들에 대해 매칭할 때 유용하게 사용된다.
# 하지만 대부분의 상황에서는 컨디션들을 체크하길 원하고
# nil 이나 false 가 아닌 조건을 찾아내길 원한다.  

cond do
  2 + 2 == 5 -> "This will not be true"
  2 * 2 == 3 -> "Nor this"
  1 + 1 == 2 -> IO.puts("But this will")
end

# 다른 절차지향 언어의 else if 와 같다. 하지만 엘릭서에서는 드물게 사용된다. 

# 모든 조건들이 nil 또는 false 면 CondCluaseError 가 레이즈 된다. 
# 이러한 이유로 마지막에 true 조건을 넣어주는 것이 좋다. 

cond do
  2 + 2 == 5 -> "This is never true"
  2 * 2 == 3 -> "Nor this"
  true -> IO.puts("Always(equivalent to else)")
end

# cond 는 nil과 false 를 제외한 모든 값을 true 로 본다. 
cond do
  hd([0,1,2]) -> IO.puts("0 is considered as true")
end

