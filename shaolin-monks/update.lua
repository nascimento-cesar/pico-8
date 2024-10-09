function _update()
  if debug.s == nil then
    debug.s = 0
  end
  debug.x = p.x
  debug.y = p.y

  for player in all(players) do
    p = player

    if not p.is_npc then
      update_frames_counter()
      update_previous_action()
      process_inputs()
      perform_current_action()
      perform_jumping()
    end
  end
end

function update_frames_counter()
  p.frames_counter += 1
end

function update_previous_action()
  if is_action_animation_finished() then
    if is_aerial() and not p.current_action_params.has_landed then
      p.frames_counter = 0
    elseif is_aerial_attacking() and not p.current_action_params.has_landed then
      p.current_action_state = action_states.held
    else
      p.current_action_state = action_states.finished
      shift_pixel(true)
    end
  end
end

function process_inputs()
  local button_pressed = btn() > 0
  local h🅾️❎ = btn(🅾️) and btn(❎)
  local p🅾️ = btnp(🅾️)
  local p❎ = btnp(❎)
  local h⬆️ = btn(⬆️)
  local h⬇️ = btn(⬇️)
  local h⬅️ = btn(⬅️)
  local h➡️ = btn(➡️)

  if button_pressed then
    if h⬇️ then
      if h🅾️❎ then
        setup_action(actions.block)
      elseif p🅾️ then
        setup_action(actions.hook)
      else
        setup_action(actions.crouch)
      end
    elseif h⬆️ and not h🅾️❎ then
      if h⬅️ then
        setup_action(actions.jump, { direction = directions.backward })

        if p🅾️ then
          setup_action(actions.flying_punch)
        elseif p❎ then
          setup_action(actions.flying_kick)
        end
      elseif h➡️ then
        setup_action(actions.jump, { direction = directions.forward })

        if p🅾️ then
          setup_action(actions.flying_punch)
        elseif p❎ then
          setup_action(actions.flying_kick)
        end
      else
        setup_action(actions.jump)

        if p🅾️ then
          setup_action(actions.flying_punch)
        elseif p❎ then
          setup_action(actions.flying_kick)
        end
      end
    elseif h⬅️ and not h➡️ then
      if h🅾️❎ then
        setup_action(actions.block)
      elseif p🅾️ then
        setup_action(actions.punch)
      elseif p❎ then
        setup_action(actions.kick)
      else
        setup_action(actions.walk, { direction = directions.backward })
      end
    elseif h➡️ and not h⬅️ then
      if h🅾️❎ then
        setup_action(actions.block)
      elseif p🅾️ then
        setup_action(actions.punch)
      elseif p❎ then
        setup_action(actions.kick)
      else
        setup_action(actions.walk, { direction = directions.forward })
      end
    elseif h🅾️❎ then
      setup_action(actions.block)
    elseif p🅾️ then
      if is_aerial() then
        setup_action(actions.flying_punch)
      else
        setup_action(actions.punch)
      end
    elseif p❎ then
      if is_aerial() then
        setup_action(actions.flying_kick)
      else
        setup_action(actions.kick)
      end
    else
      handle_no_key_press()
    end
  else
    handle_no_key_press()
  end
end

function perform_current_action()
  return p.current_action.handler and p.current_action.handler()
end

function perform_jumping()
  if is_aerial() or is_aerial_attacking() then
    local x_speed = jump_speed * (p.current_action_params.direction or 0) / 2
    local y_speed = jump_speed

    if p.current_action_params.is_landing then
      move_y(y_speed)
      move_x(x_speed)

      if p.y >= y_bottom_limit then
        p.current_action_params.has_landed = true
        p.current_action_params.is_landing = false
        setup_action(actions.idle)
      end
    else
      if not p.current_action_params.has_landed then
        move_y(-y_speed)
        move_x(x_speed)

        if p.y <= y_upper_limit then
          p.current_action_params.is_landing = true
        end
      end
    end
  end
end

function handle_no_key_press()
  if p.current_action == actions.walk then
    setup_action(actions.idle)
  elseif p.current_action.is_holdable and is_action_held() then
    setup_action(p.current_action, { is_released = true })
  elseif is_action_finished() then
    setup_action(actions.idle)
  end
end

function setup_action(next_action, params)
  local should_trigger_action = false
  local next_action_state = action_states.in_progress
  params = params or {}

  if p.current_action == next_action then
    if is_action_finished() and p.current_action.is_holdable then
      next_action_state = action_states.held
    elseif is_action_held() and params.is_released then
      next_action_state = action_states.released
    end
  end

  if is_aerial() and next_action.type == action_types.aerial_attack then
    params = p.current_action_params
  end

  if is_action_finished() then
    should_trigger_action = true
  elseif p.current_action == next_action then
    if is_moving() and p.current_action_params.direction ~= params.direction then
      should_trigger_action = true
    end
  elseif p.current_action ~= next_action then
    if is_aerial() then
      if next_action.type == action_types.aerial_attack or next_action == actions.idle then
        should_trigger_action = true
      end
    elseif is_moving() then
      should_trigger_action = true
    elseif is_action_held() then
      if not is_aerial_attacking() and next_action.type == action_types.attack then
        should_trigger_action = true
      end
    end
  elseif next_action_state == action_states.released then
    should_trigger_action = true
  end

  if should_trigger_action then
    p.current_action = next_action
    p.current_action_state = next_action_state
    p.current_action_params = params or {}
    p.frames_counter = 0
    shift_pixel(not next_action.is_pixel_shiftable)
  end
end

function shift_pixel(unshift)
  if unshift then
    if p.is_pixel_shifted then
      move_x(-pixel_shift)
      p.is_pixel_shifted = false
    end
  else
    if p.is_pixel_shifted == false then
      move_x(pixel_shift)
      p.is_pixel_shifted = true
    end
  end
end

function walk()
  move_x(0.5 * p.current_action_params.direction)
end

function move_x(x)
  p.x += x * p.facing
end

function move_y(y)
  p.y += y
end