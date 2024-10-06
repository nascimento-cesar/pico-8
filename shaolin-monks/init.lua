function _init()
  debug = {}
  general = configure_general()
  actions = configure_actions()
  player = configure_player()
  action_handlers = configure_action_handlers()
  disable_hold_function()
end

function configure_general()
  return {
    directions = {
      left = -1,
      right = 1
    },
    pixel_shift = 2
  }
end

function configure_player()
  return {
    current_action = {
      action = actions.idle,
      is_finished = true,
      is_held = false
    },
    action_stack = {},
    rendering = {
      x = 8,
      y = 63,
      current_sprite = 0,
      frames_counter = 0,
      facing = general.directions.right,
      is_pixel_shifted = false
    }
  }
end

function configure_actions()
  return {
    idle = set_action(1, { 0 }, 1, false, false),
    punch = set_action(2, { 4, 5, 4 }, 3, false, true),
    kick = set_action(3, { 6, 7, 6 }, 3, false, true),
    backward = set_action(4, { 1, 2, 3, 2 }, 4, true, false),
    forward = set_action(5, { 1, 2, 3, 2 }, 4, true, false),
    crouch = set_action(6, { 9, 10 }, 2, false, false),
    stand = set_action(7, { 9 }, 2, false, false),
    hook = set_action(8, { 16, 17, 18, 18, 18, 18, 18, 17 }, 2, false, true),
    block = set_action(9, { 19, 20 }, 2, false, false),
    unblock = set_action(10, { 19 }, 2, false, false)
  }
end

function configure_action_handlers()
  return {
    [actions.backward] = backward,
    [actions.forward] = forward,
    [actions.crouch] = crouch,
    [actions.punch] = punch,
    [actions.kick] = kick,
    [actions.hook] = hook,
    [actions.block] = block,
    [actions.unblock] = unblock
  }
end

function set_action(index, sprites, frames_per_sprite, is_movement, is_pixel_shiftable)
  return {
    index = index,
    sprites = sprites,
    frames_per_sprite = frames_per_sprite,
    is_movement = is_movement,
    is_pixel_shiftable = is_pixel_shiftable
  }
end

function disable_hold_function()
  poke(0x5f5c, 255)
end