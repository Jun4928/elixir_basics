if true do
  IO.puts("this works!")
end

unless true do
  IO.puts("This will never be seen")
end

unless false do
  IO.puts("Always true")
end

if nil do
  IO.puts("This won't be seen")
else
  IO.puts("This will")
end

# 변수의 스코프
# if, case 또는 비슷한 구조에서 변수가 선언된다면,
# 그 안에서만 사용된다. 

x = 1
if true do
  x = x + 1
  IO.puts(x) # 2
end

IO.puts(x) # 1

x = if true do x + 1 else x end

IO.puts(x) # 2

# if, unless 는 매크로로 구현되어 있다. 다른 언어에서처럼
# 언어의 구조체가 아닌 형태다.

# do/end 블락에 대해서
x = if true, do: 1 + 2
IO.puts(x) # 3

res = if false, do: :do, else: :else
IO.puts(res) # else

# if 는 매크로, 즉 함수라고 했다.
# Elixir 에서는 인자는 comma 로 구분된다. 
# 이 문법을 keyword lists 라고 한다. 
# do/end 블락은 keywords lists 의 문법을 간편화 한 것이다.
# 이것이 do/end 블락이 comma 를 필요로 하지 않는 이유다. 

a = if true do
      a = 1 + 2
      a + 10
    end

IO.puts(a) # 13

b = if true, do: (
  a = 1 + 2
  a + 10
)

IO.puts(b) # 13