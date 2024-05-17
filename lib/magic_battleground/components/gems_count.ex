defmodule MagicBattleground.Components.GemsCount do
  @moduledoc """
  Belongs to players, contains the quantity of Gems the player has.
  """
  use ECSx.Component,
    value: :integer
end
