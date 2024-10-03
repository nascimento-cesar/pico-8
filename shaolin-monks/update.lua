function _update()
  handle_controls()
  handle_actions()
  update_frames()
end

function handle_controls()
  check_idle_state()

  if player.is_action_locked == false then
    if btn(0) then
      set_current_action(actions.backward)
    end

    if btn(1) then
      set_current_action(actions.forward)
    end

    if btn(3) then
      set_current_action(actions.crouch)
    end

    if btnp(5) then
      set_current_action(actions.kick)
    end

    if btnp(4) then
      set_current_action(actions.punch)
    end
  end
end

function handle_actions()
  if player.current_action == actions.backward then
    handle_backward()
  elseif player.current_action == actions.forward then
    handle_forward()
  elseif player.current_action == actions.crouch then
    handle_crouch()
  elseif player.current_action == actions.punch then
    handle_punch()
  elseif player.current_action == actions.kick then
    handle_kick()
  end
end

function update_frames()
  player.frames_counter += 1
end

function check_idle_state()
  if is_current_action_finished() then
    set_current_action(actions.idle)
    shift_pixel(true)
  end
end

function set_current_action(action)
  if action == player.current_action then
    return
  end

  if action != actions.idle then
    record_action(action)
    -- poke(0x5f5c, action.l and 255 or 0)
  end

  player.current_action = action
  player.frames_counter = 0
  player.is_action_locked = action.l or false
end

function record_action(action)
  add(actions_stack, action.i)

  if #actions_stack > 10 then
    deli(actions_stack, 1)
  end
end

function is_current_action_finished()
  return player.frames_counter > player.current_action.f * #player.current_action.s - 1
end

function handle_forward()
  move_x(0.5)
end

function handle_backward()
  move_x(-0.5)
end

function handle_crouch()
  -- player.x += 0.25 * player.direction
end

function handle_punch()
  shift_pixel()
end

function handle_kick()
  shift_pixel()
end

function shift_pixel(unshift)
  if unshift then
    if player.is_pixel_shifted then
      move_x(-pixel_shift)
      player.is_pixel_shifted = false
    end
  else
    if player.is_pixel_shifted == false then
      move_x(pixel_shift)
      player.is_pixel_shifted = true
    end
  end
end

function move_x(x)
  player.x += x * player.direction
end