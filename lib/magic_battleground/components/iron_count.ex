defmodule MagicBattleground.Components.IronCount do
  @moduledoc """
  Belongs to players, contains the quantity of Iron the player has.
  """
  use ECSx.Component,
    value: :integer
end
