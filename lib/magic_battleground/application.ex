defmodule MagicBattleground.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MagicBattlegroundWeb.Telemetry,
      MagicBattleground.Repo,
      {DNSCluster, query: Application.get_env(:magic_battleground, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MagicBattleground.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MagicBattleground.Finch},
      # Start a worker by calling: MagicBattleground.Worker.start_link(arg)
      # {MagicBattleground.Worker, arg},
      # Start to serve requests, typically the last entry
      MagicBattlegroundWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MagicBattleground.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MagicBattlegroundWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
