function attack(p)
  local vs, full_sprite_w = get_vs(p), sprite_w + 1

  if not p.cap.has_hit and has_collision(p.x, p.y, vs.x, vs.y, nil, full_sprite_w) then
    p.cap.has_hit = true

    if vs.ca == actions.block then
    else
      deal_damage(p.ca, vs)

      if p.cap.callback then
        p.cap.callback()
      end
    end
  elseif p.ca.is_special_attack and (is_limit_left(p.x) or is_limit_right(p.x)) then
    finish_action(p)
  end
end

function check_defeat(p)
  if is_round_state_eq "finishing_move" then
    combat_round_state = "finished"
  elseif p.hp <= 0 then
    local vs = get_vs(p)
    combat_rounds_won[vs.id] += 1
    combat_round_loser, combat_round_winner, combat_round_state = p, vs, has_combat_ended() and "finishing_move" or "finished"
  end
end

function deal_damage(action, p)
  p.hp -= action.dmg

  remove_temporary_conditions(p)

  if p.ca.is_aerial and not any_match("freeze,hook", action.name) then
    setup_next_action(p, "thrown_lower", nil, true)
  else
    setup_next_action(p, action.reaction, nil, true)
  end

  if action ~= actions.sweep then
    spill_blood(p)
  end

  -- check_defeat(p)
end

function has_collision(a_x, a_y, t_x, t_y, type, a_w, a_h, t_w, t_h)
  local a_w, a_h, t_w, t_h = a_w or sprite_w, a_h or sprite_h, t_w or sprite_w, t_h or sprite_h
  local has_r_col, has_l_col, has_u_col, has_d_col = a_x + a_w > t_x and a_x < t_x, a_x < t_x + t_w and a_x > t_x, t_y + t_h > a_y and t_y <= a_y, a_y + a_h > t_y and t_y >= a_y

  if type == "left" then
    return has_l_col and (has_u_col or has_d_col)
  elseif type == "right" then
    return has_r_col and (has_u_col or has_d_col)
  else
    return (has_r_col or has_l_col) and (has_u_col or has_d_col)
  end
end

function remove_temporary_conditions(p)
  p.st_frozen_timer = 0
end

function spill_blood(p)
  add(p.particle_sets, build_particle_set(8, 30, p.facing == forward and p.x + sprite_w or p.x, p.y))
end