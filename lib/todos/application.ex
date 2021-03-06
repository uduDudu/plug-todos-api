defmodule Todos.Application do
  use Application
  require Logger

  def start(_type, _args) do
    children = [
      {Plug.Cowboy, scheme: :http, plug: Todos.Router, options: [port: 4001]}
    ]

    opts = [strategy: :one_for_one, name: Todos.Supervisor]

    Logger.info("Starting application...")
    Supervisor.start_link(children, opts)
  end
end
