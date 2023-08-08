defmodule ShoppingTest do
  use ExUnit.Case
  doctest Shopping

  test "greets the world" do
    assert Shopping.hello() == :world
  end
end
