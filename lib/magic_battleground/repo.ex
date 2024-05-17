defmodule MagicBattleground.Repo do
  use Ecto.Repo,
    otp_app: :magic_battleground,
    adapter: Ecto.Adapters.Postgres
end
