defmodule ShopServer do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, [])
  end

   # Client API

  def read(pid) do
    GenServer.call(pid, {:read})
  end

  def add(pid, item) do
    GenServer.cast(pid, {:add, item})
  end

  # Server Callbacks

  def init(:ok) do
    {:ok, []}
  end

  def handle_call({:read}, _from, list) do
    list = list
    |> Enum.frequencies
    {:reply, list, list}
  end

  def handle_cast({:add, item}, list) do
    {:noreply, list ++ [item]}
  end
end
