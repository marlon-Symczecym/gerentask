defmodule Gerentask.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Gerentask.Repo,
      # Start the Telemetry supervisor
      GerentaskWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Gerentask.PubSub},
      # Start the Endpoint (http/https)
      GerentaskWeb.Endpoint
      # Start a worker by calling: Gerentask.Worker.start_link(arg)
      # {Gerentask.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gerentask.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    GerentaskWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
