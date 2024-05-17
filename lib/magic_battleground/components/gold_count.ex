defmodule MagicBattleground.Components.GoldCount do
  @moduledoc """
  Belongs to players, contains the quantity of Gold the player has.
  """
  use ECSx.Component,
    value: :integer
end
