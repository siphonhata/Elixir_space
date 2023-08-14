defmodule Foo do
  def receiver() do
    receive do #built in function
      v -> IO.inspect(v <> " Small")
          receiver()
    end
  end
end

#pid = spawn(Foo, :receiver, [])
