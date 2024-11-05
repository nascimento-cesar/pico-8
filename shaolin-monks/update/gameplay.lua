function update_gameplay()
  if is_arcade_mode() then
    detect_new_player()
  end

  if player_has_joined() then
    return process_new_player()
  elseif is_round_beginning() then
    process_round_start()
  elseif is_round_finished() then
    process_round_end()
  elseif is_round_finishing_move() then
    process_finishing_move()
  end

  update_player(p1)
  update_player(p2)
  fix_players_orientation()
  fix_players_placement()
end

function detect_new_player()
  for p in all({ p1, p2 }) do
    if not is_playing(p) and not player_has_joined() then
      if btnp(🅾️, p.id) or btnp(❎, p.id) then
        init_player(p)
        game.current_combat.round_state = "new_player"
      end
    end
  end
end

function reset_timers()
  for k, v in pairs(timers) do
    game.current_combat.timers[k] = v
  end
end

function process_new_player()
  if game.current_combat.timers.new_player > 0 then
    game.current_combat.timers.new_player -= 1
  else
    reset_players()
    game.current_screen = "character_selection"
    p1.character = nil
    p2.character = nil
  end
end

function process_finishing_move()
  if game.current_combat.timers.finishing_move > 0 then
    game.current_combat.timers.finishing_move -= 1
  else
    game.current_combat.round_state = "finished"
  end
end

function process_round_end()
  if game.current_combat.timers.round_end > 0 then
    game.current_combat.timers.round_end -= 1
  else
    game.current_combat.round += 1
    reset_players()

    if has_combat_ended() then
      local winner = get_combat_winner()
      local loser = get_vs(winner)

      if is_arcade_mode() then
        game.current_screen = "next_combat"
        loser.character = nil
      else
        game.current_screen = "character_selection"
        loser.character = nil
        winner.character = nil
      end
    else
      game.current_combat.round_state = "countdown"
      reset_timers()
    end
  end
end

function process_round_start()
  if game.current_combat.timers.round_start > 0 then
    game.current_combat.timers.round_start -= 1
  else
    game.current_combat.round_start_time = time()
    game.current_combat.round_state = "in_progress"
  end
end

function get_next_challenger(p)
  local challenger = characters[game.next_combats[p.id][1]]
  deli(game.next_combats[p.id], 1)

  if p.character == challenger then
    return get_next_challenger(p)
  end

  return challenger
end

function reset_players()
  p1 = create_player(p_id.p1, p1.character)
  p2 = create_player(p_id.p2, p2.character)
end

function update_player(p)
  update_frames_counter(p)
  update_previous_action(p)

  if (is_round_in_progress() or is_round_finishing_move()) and not has_lost(p) then
    if is_playing(p) then
      process_inputs(p)
    else
      next_cpu_action(p)
    end
  end

  perform_current_action(p)
  update_aerial_action(p)
  update_projectile(p)

  if is_playing(p) then
    cleanup_action_stack(p)
  end
end

function next_cpu_action(p)
  handle_no_key_press(p)
end

function update_frames_counter(p)
  p.frames_counter += 1
end

function update_previous_action(p)
  if is_action_animation_finished(p) then
    if is_aerial(p) and not p.current_action_params.has_landed then
      restart_action(p)
    elseif is_aerial_attacking(p) and not p.current_action_params.has_landed then
      hold_action(p)
    elseif is_propelled(p) and not p.current_action_params.has_landed then
      hold_action(p)
    elseif is_special_attacking(p) then
      hold_action(p)
    elseif p.current_action == actions.swept then
      start_action(p, actions.prone)
    elseif p.current_action == actions.flinch and is_round_finished() then
      swept(p)
    elseif p.current_action == actions.prone then
      if is_round_finished() then
        hold_action(p)
      else
        start_action(p, actions.get_up)
      end
    else
      finish_action(p)
    end
  end
end

function process_inputs(p)
  local button_pressed = btn() > 0
  local h🅾️❎ = btn(🅾️, p.id) and btn(❎, p.id)
  local p🅾️ = btnp(🅾️, p.id)
  local p❎ = btnp(❎, p.id)
  local h⬆️ = btn(⬆️, p.id)
  local h⬇️ = btn(⬇️, p.id)
  local h⬅️ = btn(⬅️, p.id)
  local h➡️ = btn(➡️, p.id)

  if button_pressed then
    p.action_stack_timeout = action_stack_timeout

    if h⬇️ then
      if h🅾️❎ then
        setup_action(p, actions.block)
      elseif p🅾️ then
        setup_attack(p, actions.hook)
      elseif p❎ then
        setup_attack(p, actions.sweep)
      else
        setup_action(p, actions.crouch)
      end
    elseif h⬆️ and not h🅾️❎ then
      if h⬅️ then
        setup_action(p, actions.jump, { direction = p.facing * -1 })

        if p🅾️ then
          setup_attack(p, actions.flying_punch)
        elseif p❎ then
          setup_attack(p, actions.flying_kick)
        end
      elseif h➡️ then
        setup_action(p, actions.jump, { direction = p.facing })

        if p🅾️ then
          setup_attack(p, actions.flying_punch)
        elseif p❎ then
          setup_attack(p, actions.flying_kick)
        end
      else
        setup_action(p, actions.jump)

        if p🅾️ then
          setup_attack(p, actions.flying_punch)
        elseif p❎ then
          setup_attack(p, actions.flying_kick)
        end
      end
    elseif h⬅️ and not h➡️ then
      if h🅾️❎ then
        setup_action(p, actions.block)
      elseif p🅾️ then
        setup_attack(p, is_aerial(p) and actions.flying_punch or actions.punch)
      elseif p❎ then
        if is_aerial(p) then
          setup_attack(p, actions.flying_kick)
        else
          setup_attack(p, p.facing == directions.forward and actions.roundhouse_kick or actions.kick)
        end
      else
        setup_action(p, actions.walk, { direction = p.facing * -1 })
      end
    elseif h➡️ and not h⬅️ then
      if h🅾️❎ then
        setup_action(p, actions.block)
      elseif p🅾️ then
        setup_attack(p, is_aerial(p) and actions.flying_punch or actions.punch)
      elseif p❎ then
        if is_aerial(p) then
          setup_attack(p, actions.flying_kick)
        else
          setup_attack(p, p.facing == directions.forward and actions.kick or actions.roundhouse_kick)
        end
      else
        setup_action(p, actions.walk, { direction = p.facing })
      end
    elseif h🅾️❎ then
      setup_action(p, actions.block)
    elseif p🅾️ then
      setup_attack(p, is_aerial(p) and actions.flying_punch or actions.punch)
    elseif p❎ then
      setup_attack(p, is_aerial(p) and actions.flying_kick or actions.kick)
    else
      handle_no_key_press(p)
    end
  else
    handle_no_key_press(p)
  end
end

function perform_current_action(p)
  return p.current_action.handler and p.current_action.handler(p)
end

function update_aerial_action(p)
  if is_aerial(p) or is_aerial_attacking(p) or is_propelled(p) then
    local direction = p.current_action_params.direction
    local x_speed = jump_speed * (direction or 0) / 2
    local y_speed = jump_speed
    local has_changed_orientation = p.current_action_params.has_changed_orientation

    if p.current_action_params.is_landing then
      move_y(p, y_speed)
      move_x(p, x_speed, has_changed_orientation and p.facing * -1 or p.facing)

      if is_p1_ahead_p2() and not has_changed_orientation then
        if is_aerial(p) then
          p.current_action_params.has_changed_orientation = true
          shift_players_orientation()
        end
      end

      if p.y >= y_bottom_limit then
        p.is_orientation_locked = false
        p.current_action_params.has_landed = true
        p.current_action_params.is_landing = false

        if is_propelled(p) then
          setup_action(p, actions.prone)
        else
          setup_action(p, actions.idle)
        end
      end
    else
      if not p.current_action_params.has_landed then
        p.is_orientation_locked = true
        move_y(p, -y_speed)
        move_x(p, x_speed)

        if p.y <= y_upper_limit then
          p.current_action_params.is_landing = true
        end
      end
    end
  end
end

function update_projectile(p)
  local vs = get_vs(p)

  if p.projectile then
    p.projectile.x += projectile_speed * p.facing
    p.projectile.frames_counter += 1

    if has_collision(p.projectile.x, p.projectile.y, vs.x, vs.y, nil, 6) then
      p.projectile = nil
      deal_damage(p.current_action, vs)
      start_action(p, actions.idle)
    elseif is_limit_right(p.projectile.x) or is_limit_left(p.projectile.x) then
      p.projectile = nil
      start_action(p, actions.idle)
    end
  end
end

function fix_players_orientation()
  local is_orientation_locked = p1.is_orientation_locked or p2.is_orientation_locked

  if is_p1_ahead_p2() and not is_orientation_locked then
    if not is_aerial_attacking(p1) and not is_aerial_attacking(p2) then
      shift_players_orientation()
    end
  end
end

function fix_players_placement()
  if p1.y >= y_bottom_limit and p2.y >= y_bottom_limit then
    if p1.x < sprite_w and p2.x < sprite_w then
      if p1.facing == directions.forward then
        p1.x = 0
        p2.x = sprite_w - 1
      else
        p1.x = sprite_w - 1
        p2.x = 0
      end
    end

    if p1.x + sprite_w > 127 - sprite_w and p2.x + sprite_w > 127 - sprite_w then
      if p1.facing == directions.forward then
        p1.x = 127 - sprite_w * 2 + 1
        p2.x = 127 - sprite_w
      else
        p1.x = 127 - sprite_w
        p2.x = 127 - sprite_w * 2 + 1
      end
    end
  end
end

function cleanup_action_stack(p)
  if p.action_stack_timeout > 0 then
    p.action_stack_timeout -= 1
  else
    p.action_stack_timeout = action_stack_timeout
    p.action_stack = ""
  end
end

function shift_players_orientation()
  p1.facing *= -1
  p2.facing *= -1
end

function handle_no_key_press(p)
  if p.current_action == actions.walk then
    setup_action(p, actions.idle)
  elseif p.current_action.is_holdable and is_action_held(p) and not is_propelled(p) then
    setup_action(p, p.current_action, { is_released = true })
  elseif is_action_finished(p) then
    setup_action(p, actions.idle)
  end
end

function setup_action(p, next_action, params)
  params = params or {}

  if is_aerial(p) and next_action.type == "aerial_attack" then
    merge(params, p.current_action_params)
  end

  if is_action_finished(p) then
    if p.current_action == next_action then
      if p.current_action.is_holdable then
        hold_action(p)
      elseif is_moving(p) then
        restart_action(p)
      else
        start_action(p, next_action, params)
      end
    else
      start_action(p, next_action, params)
    end
  elseif p.current_action == next_action then
    if is_action_held(p) and params.is_released then
      release_action(p)
    elseif is_moving(p) and p.current_action_params.direction ~= params.direction then
      start_action(p, next_action, params)
    end
  elseif p.current_action ~= next_action then
    if is_aerial(p) then
      if next_action.type == "aerial_attack" or next_action == actions.idle then
        start_action(p, next_action, params)
      end
    elseif is_moving(p) then
      start_action(p, next_action, params)
    elseif is_action_held(p) then
      if not is_aerial_attacking(p) and not is_special_attacking(p) and next_action.type == "attack" then
        start_action(p, next_action, params)
      elseif next_action == actions.prone then
        start_action(p, next_action, params)
      end
    end
  end
end

function setup_attack(p, next_action)
  setup_action(p, next_action, { is_attacking = true })
end

function start_action(p, action, params)
  params = params or {}

  record_action(p, action, params)

  for _, special_attack in pairs(p.character.special_attacks) do
    local current_sequence = sub(p.action_stack, #p.action_stack - #special_attack.sequence + 1, #p.action_stack)

    if current_sequence == special_attack.sequence then
      p.action_stack = ""

      return setup_attack(p, special_attack.action)
    end
  end

  p.current_action = action
  p.current_action_state = "in_progress"
  p.current_action_params = params
  p.frames_counter = 0

  if action.is_x_shiftable then
    shift_player_x(p)
  end

  if action == actions.prone then
    shift_player_y(p)
  elseif action == actions.get_up then
    shift_player_y(p, true)
  end
end

function hold_action(p)
  p.current_action_state = "held"
  p.frames_counter = 0
end

function release_action(p)
  p.current_action_state = "released"
  p.current_action_params = { is_released = true }
  p.frames_counter = 0
end

function finish_action(p)
  p.current_action_state = "finished"
  shift_player_x(p, true)
end

function restart_action(p)
  p.current_action_state = "in_progress"
  p.frames_counter = 0
end

function has_collision(a_x, a_y, t_x, t_y, type, a_w, a_h, t_w)
  local a_w = a_w or sprite_w
  local a_h = a_h or sprite_h
  local t_w = t_w or sprite_w

  local has_r_col = a_x + a_w > t_x + 8 - t_w and a_x < t_x
  local has_l_col = a_x + 8 - a_w < t_x + t_w and a_x > t_x
  local has_v_col = a_y + a_h > t_y

  if type == "left" then
    return has_l_col and has_v_col
  elseif type == "right" then
    return has_r_col and has_v_col
  else
    return (has_r_col or has_l_col) and has_v_col
  end
end

function record_action(p, action, params)
  local key

  if action == actions.crouch then
    key = "⬇️"
  elseif action == actions.hook then
    key = "🅾️"
  elseif action == actions.jump then
    key = "⬆️"
  elseif action == actions.kick then
    key = "❎"
  elseif action == actions.punch then
    key = "🅾️"
  elseif action == actions.walk then
    key = params.direction == directions.forward and "➡️" or "⬅️"
  end

  if key then
    p.action_stack = p.action_stack .. key

    if #p.action_stack > 10 then
      p.action_stack = sub(p.action_stack, 2, 11)
    end
  end
end

function shift_player_x(p, unshift)
  if unshift then
    if p.is_x_shifted then
      move_x(p, -x_shift)
      p.is_x_shifted = false
    end
  else
    if not p.is_x_shifted then
      move_x(p, x_shift, nil, true)
      p.is_x_shifted = true
    end
  end
end

function shift_player_y(p, unshift, shift_up)
  if unshift then
    if p.is_y_shifted then
      move_y(p, y_bottom_limit - p.y)
      p.is_y_shifted = false
    end
  else
    if not p.is_y_shifted then
      move_y(p, y_shift * (shift_up and -1 or 1), nil, true)
      p.is_y_shifted = true
    end
  end
end

function fire_projectile(p)
  if not p.projectile then
    local height = p.character.projectile_height or 4

    p.projectile = {
      frames_counter = 0,
      x = p.x + sprite_w * p.facing,
      y = p.y + 5 - ceil(height / 2)
    }
  end
end

function deal_damage(action, p)
  p.hp -= action.damage
  action.reaction_handler(p)

  if action ~= actions.sweep then
    spill_blood(p)
  end

  check_defeat(p)
end

function spill_blood(p)
  local x = p.facing == directions.forward and p.x + sprite_w or p.x
  add(p.particle_sets, build_particle_set(8, 30, x, p.y))
end

function check_defeat(p)
  if is_round_finishing_move() then
    game.current_combat.round_state = "finished"
  elseif p.hp <= 0 then
    local vs = get_vs(p)
    game.current_combat.round_loser = p
    game.current_combat.round_winner = vs
    game.current_combat.rounds_won[vs.id] += 1

    if has_combat_ended() then
      game.current_combat.round_state = "finishing_move"
    else
      game.current_combat.round_state = "finished"
    end
  end
end

function flinch(p)
  if p.current_action ~= actions.flinch then
    start_action(p, actions.flinch)
    move_x(p, -flinch_speed)
  end
end

function propelled(p)
  if not is_propelled(p) then
    start_action(p, actions.propelled, { direction = directions.backward })
  end
end

function swept(p)
  if p.current_action ~= actions.swept then
    move_x(p, -swept_speed)
    start_action(p, actions.swept)
  end
end

function attack(p)
  local vs = get_vs(p)
  local full_sprite_w = sprite_w + 1

  if is_attacking(p) and has_collision(p.x, p.y, vs.x, vs.y, nil, full_sprite_w) then
    if vs.is_blocking then
    else
      deal_damage(p.current_action, vs)
      p.current_action_params.is_attacking = false
    end
  end
end

function walk(p)
  move_x(p, walk_speed * p.current_action_params.direction)
end

function build_particle_set(color, count, x, y)
  local particle_set = {
    color = color,
    particles = {},
    x = x,
    y = y
  }

  for i = 1, count do
    add(
      particle_set.particles, {
        current_lifespan = rnd(10),
        max_lifespan = 10,
        speed_x = rnd() * 2 - 1,
        speed_y = rnd() * 2 - 1,
        x = particle_set.x,
        y = particle_set.y
      }
    )
  end

  return particle_set
end

function move_x(p, x_increment, direction, allow_overlap, ignore_collision)
  direction = direction or p.facing

  local vs = get_vs(p)
  local new_p_x = p.x + x_increment * direction
  local has_l_col = has_collision(new_p_x, p.y, vs.x, vs.y, "left")
  local has_r_col = has_collision(new_p_x, p.y, vs.x, vs.y, "right")

  if is_limit_left(new_p_x) then
    p.x = 0
  elseif is_limit_right(new_p_x) then
    p.x = 127 - sprite_w
  elseif has_l_col and not ignore_collision then
    if allow_overlap then
      p.x = new_p_x
    else
      local vs_x_increment = vs.x - new_p_x + sprite_w - 1

      if not is_limit_left(vs.x - vs_x_increment) then
        if not is_aerial(vs) and not is_aerial_attacking(vs) then
          move_x(vs, vs_x_increment * -1, nil, false, true)
        end

        p.x = new_p_x
      end
    end
  elseif has_r_col and not ignore_collision then
    if allow_overlap then
      p.x = new_p_x
    else
      local vs_x_increment = new_p_x + sprite_w - vs.x - 1

      if not is_limit_right(vs.x + vs_x_increment) then
        if not is_aerial(vs) and not is_aerial_attacking(vs) then
          move_x(vs, vs_x_increment * -1, nil, false, true)
        end

        p.x = new_p_x
      end
    end
  else
    p.x = new_p_x
  end
end

function move_y(p, y)
  p.y += y
end