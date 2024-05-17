defmodule MagicBattleground.Components.FactoryOwnership do
  @moduledoc """
  Belongs to player entities.  Value is the Entity ID of a resource-generating Factory.
  """
  use ECSx.Component,
    value: :binary
end
