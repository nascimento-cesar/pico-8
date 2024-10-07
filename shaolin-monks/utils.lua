function is_action_finished()
  return p.current_action_state == action_states.finished
end

function is_action_held()
  return p.current_action_state == action_states.held
end

function is_action_released()
  return p.current_action_state == action_states.released
end

function is_action_animation_finished()
  return p.frames_counter > p.current_action.frames_per_sprite * #p.current_action.sprites - 1
end