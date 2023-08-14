defmodule SimpleProcess do
  def print_message(name) do
    IO.puts("Hello from a spawned process! #{name}")
  end
end
