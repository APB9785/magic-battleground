defmodule MagicBattlegroundWeb.Layouts.SwiftUI do
  use MagicBattlegroundNative, [:layout, format: :swiftui]

  embed_templates "layouts_swiftui/*"
end
