IO.puts("Hello world from Elixir")


case {1, 2, 3} do
  {4, 5, 6} -> "This cluase won't match"
  {1, x, 3} -> IO.puts("x:: #{x}")
  _ -> "This cluase would match any value"
end

x = 1
case 1 do
  ^x -> IO.puts("Won't match") # 변수에 패턴매칭 사용하기 위해서는 pin operator 필요
  _ -> IO.puts("Will match")
end


case {1, -1, 3} do
  {1, x, 3} when x > 0 -> IO.puts("Will match")
  _ -> IO.puts("Would match, if guard condition were not satisfied")
end

# hd(1) argument error 를 내지만 
# 아래에서 guard 절에서 에러가 나면 그냥 guard 만 fail 하게 된다. 

case 1 do
  x when hd(x) -> "Won't match" 
  x -> IO.puts("Got #{x}")
end 

# case 에서 아무것도 매칭이 되지 않으면 error 가 raised됨
# case :ok do
#   :error -> "Won't match"
# end

# 아래와 같이 익명함수도 multiple cluase 와 guard 를 가질 수 있다.
f = fn
  x, y when x > 0 -> x + y
  x, y -> x * y
end

IO.puts(f.(1, 3))
IO.puts(f.(-1, 3))

# 익명함수를 만들 때, 모든 caluse 절에 인자개수 같아야 한다. 
# f2 = fn
#   x, y when x > 0 -> x + y
#   x, y, z -> x * y + z
# end

