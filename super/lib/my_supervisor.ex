defmodule MySupervisor do
  use Supervisor

  def start_link(_) do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      {MyWorker, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
