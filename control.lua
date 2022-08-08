script.on_event( defines.events.on_console_chat, function(event)
  -- refresh recipes, in case of settings change
  if event.message and event.message == "TungstenRecipes" and (not event.player_index or not game.players[event.player_index] or game.players[event.player_index].admin) then
    if game.players[event.player_index].force.recipes["cuw"] then
      game.players[event.player_index].force.recipes["cuw"].enabled=true      
    end
  end
end)

