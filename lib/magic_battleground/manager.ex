defmodule MagicBattleground.Manager do
  @moduledoc """
  ECSx manager.
  """
  use ECSx.Manager

  def setup do
    # Seed persistent components only for the first server start
    # (This will not be run on subsequent app restarts)
    :ok
  end

  def startup do
    # Load ephemeral components during first server start and again
    # on every subsequent app restart
    :ok
  end

  # Declare all valid Component types
  def components do
    [
      MagicBattleground.Components.GemsCount,
      MagicBattleground.Components.GoldCount,
      MagicBattleground.Components.IronCount,
      MagicBattleground.Components.FactoryType,
      MagicBattleground.Components.FactoryOwnership
    ]
  end

  # Declare all Systems to run
  def systems do
    [
      MagicBattleground.Systems.Destruction,
      MagicBattleground.Systems.Targeting,
      MagicBattleground.Systems.Attacking,
      MagicBattleground.Systems.ClientEventsHandler,
      MagicBattleground.Systems.ResourceGeneration
    ]
  end
end
