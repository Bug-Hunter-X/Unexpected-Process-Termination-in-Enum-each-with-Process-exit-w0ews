```elixir
list = [1, 2, 3, 4, 5]

try do
  Enum.each(list, fn x ->
    if x == 3 do
      throw(:shutdown)
    end
    IO.puts(x)
  end)
  IO.puts("Program finished")
rescue
  :shutdown ->
    IO.puts("Program terminated gracefully")
end
```