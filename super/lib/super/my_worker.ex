defmodule MyWorker do
      use GenServer

      def start_link(_) do
        GenServer.start_link(__MODULE__, 0, name: __MODULE__)
      end

      def increment do
        GenServer.call(__MODULE__, :increment)
      end

      def handle_call(:increment, _from, state) do
        {:reply, :ok, state + 1}
      end
    end
