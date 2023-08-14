defmodule ConcurrencyTest do
  use ExUnit.Case
  doctest Concurrency

  test "greets the world" do
    assert Concurrency.hello() == :world
  end

  # test "sending and asserting messages" do
  #   # Start a process and get its PID
  #   pid = spawn(Foo, :receiver, [])
  #   # pid = spawn(fn ->
  #   #   receive do
  #   #     {:value, value} ->
  #   #       IO.puts("Received value: #{value}")
  #   #   end
  #   # end)


  #   # Send a message to the process
  #   send(pid, {:receiver, "Hello, Elixir!"})

  #   # Assert that the process received the expected message
  #   assert_receive {:receiver, "Hello, Elixir! Small"}
  # end


  test "greets with Hello" do
    pid = spawn(fn -> Greeter.start() end)
    send(pid, {:greet, "Sipho"})
    assert_receive "Hello, Sipho!\n"
  end

  test "greets with Good Morning" do
    pid = spawn(fn -> Greeter.start() end)
    send(pid, {:good_morning, "Small"})
    assert_receive "Good Morning, Small!\n"
  end

  test "greets with Good Evening" do
    pid = spawn(fn -> Greeter.start() end)
    send(pid, {:good_evening, "Small"})
    assert_receive "Good Evening, Small!\n"


  end

end
