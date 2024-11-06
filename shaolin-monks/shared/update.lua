function get_combat_winner()
  local rounds_won = current_combat.rounds_won

  if rounds_won[p1_id] == 2 then
    return p1
  elseif rounds_won[p2_id] == 2 then
    return p2
  end
end

function get_vs(p)
  return p.id == p1_id and p2 or p1
end

function has_combat_ended()
  return get_combat_winner() and true or false
end

function init_player(p)
  p.has_joined = true
  define_player(p.id, p)
end

function is_action_eq(p, s)
  return p.current_action == actions[s]
end

function is_action_state_eq(p, s)
  return p.current_action_state == s
end

function is_action_animation_finished(p)
  return p.frames_counter > p.current_action.fps * #p.current_action.sprites - 1
end

function is_action_type_eq(p, s)
  return p.current_action.type == s
end

function is_player_attacking(p)
  return p.current_action_params.is_player_attacking
end

function is_limit_left(x)
  return x < 0
end

function is_limit_right(x)
  return x + sprite_w > 127
end

function is_p1_ahead_p2()
  local is_p1_ahead = p1.x > p2.x and p1.facing == forward
  local is_p1_behind = p1.x + sprite_w < p2.x + sprite_w and p1.facing == backward

  return is_p1_ahead or is_p1_behind
end

function is_round_state_eq(s)
  return current_combat.round_state == s
end

function reset_players()
  foreach_player(function(p, p_id)
    define_player(p_id, p)
  end)
end

function update_debug()
  if debug.s == nil then
    debug.s = 0
  end
end