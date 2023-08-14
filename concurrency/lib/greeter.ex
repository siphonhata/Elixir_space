defmodule Greeter do
  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    receive do
      {:greet, name} ->
        IO.puts("Hello, #{name}!")
      {:good_morning, name} ->
        IO.puts("Good Morning, #{name}!")
      {:good_evening, name} ->
        IO.puts("Good Evening, #{name}!")
      loop()
    end
  end
end

  # pid = Greet.start()
  # pid1 = Greet.start()
  # pid2 = Greet.start()
  #send pid, {:greet, "Sipho"}
  #send pid1, {:good_morning, "Sipho Small"}
  #send pid2, {:good_evening, "Abuti Small"}

  #sudo apt install libwxgtk-webview3.0-gtk3-0v5
