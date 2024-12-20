function _init()
  define_global_constants()
  define_global_variables()
  acs = define_acs()
  chars = define_chars()
  define_pl(p1_id)
  define_pl(p2_id)
end

function define_global_constants()
  ac_stack_timeout, backward, forward, frozen_bd_pal_map, frozen_hd_pal_map, jump_speed, map_min_x, map_max_x, p1_id, p2_id, offensive_speed, pj_speed, round_duration, sp_h, sp_w, stroke_width, walk_speed, x_shift, y_bottom_limit, y_shift, y_upper_limit = 6, -1, 1, "p0c1c2c3c4c5c6c7c8c9cacbcdcecfc", "p0c1c2c374c5c6c8c9cacbcdcecfc", 3, 0, 127, 0, 1, 4, 3, 90, 8, 8, 2, 1, 3, 92, 2, 64
  ground_acs_map, aerial_acs_map, round_timers = string_to_hash("⬅️,➡️,⬆️,⬇️,➡️⬆️,⬅️⬆️,➡️⬇️,⬅️⬇️,🅾️,⬇️🅾️,❎,⬅️❎,⬇️❎,🅾️❎", "walk,walk,jump,crouch,jump,jump,crouch,crouch,punch,hook,kick,roundhouse_kick,sweep,block"), string_to_hash("🅾️,❎", "jump_punch,jump_kick"), string_to_hash("finished,finishing_mv,new_pl,starting,time_up", "60,90,60,60,60")
end

function define_global_variables()
  current_screen, p1, p2 = "start", {}, {}
  define_cb_variables()
end

function define_chars()
  local chars, c_attr_list, sa_attr_list, fa_attr_list, c_attr_keys = {}, split("lk,2,p1f2838485f9fa0b0c0d0e8,1,p3050,#64|65|66|67|68|69|68,2,4,n,#111|112|113|114|113|112;kl,3,p1f2030405f9fa8b8c1d8e0,1,p305085,#70|71|72|73|70|70|74,2,2,p50d5,#121|122|123|124|123|122;jc,13,p1f203f415f91a0b1c0d1e1,1,p305084efb6,#75|76|77|78|75|75|75,2,4,p839bab7b,#111|112|113|114|113|112;rp,4,p1f23435f839fa0b0c0d0e3,1,p1b243a508398,#79|80|81|82|79|79|102|108|109|110,2,4,p839bab7b,#111|112|113|114|113|112;sz,1,p1f2c3c4c5f8c9fa0b0c0d0ec,1,p30508c,#79|80|81|82|79|79|79,2,4,p879cac,#111|112|113|114|113|112;st,8,p1f203f455f9fb5c0daef,1,p305085,#83|84|85|86|83|83|83,2,4,n,#111|112|113|114|113|112;kn,12,p21314151819fa0b0cfd0e1,2,p305081,#87|88|89|90|87|87|87,2,5,n,#115|116|117|118|117|116;jx,14,p142834485495a6b6c0d6e4f4,1,p305085f4,#91|92|93|94|91|91|91,2,4,p829ea7,#111|112|113|114|113|112;ml,13,p12324252829fa0b0cfd0e2,2,p305082,#87|88|89|90|87|87|87,2,5,n,#119;bk,14,p16203f485f869fa7b8c0d7ef,1,n,#95|96|97|98|95|95|95,2,4,p8d96a6,#111|112|113|114|113|112;sc,2,p1f2a3a4a5f8a9fa0b0c0d0ea,1,p508a,#79|80|81|82|79|79|79,2,3,p50,#120;rd,1,p1f2c3c4c5f8d97a0b0c7d0ec,1,p8d,#99|100|100|101|99|99|99,2,4,p8c97a7,#111|112|113|114|113|112;sk,1,p1f3f465296adb5cfef,1,n,#103|104|105|106|103|103|103,2,4,p17839bab7b,#111|112|113|114|113|112", ";"), split("fireball,19,20,20,2,4,pj,n,flinch,➡️+➡️+🅾️,#18|$19/7,f,f,f,f,f,t,t,f,f,f,t;aerial_fireball,19,20,20,2,4,pj,n,flinch,➡️+➡️+🅾️,#18|$19/7,t,f,f,f,f,t,t,f,f,f,t;flying_kick,21,15,20,2,2,lk_flying_kick,n,thrown_backward,➡️+➡️+❎,#12|$14/7,f,f,f,f,f,t,t,1,-1,t,t;bicycle_kick,21,22,20,n,4,lk_bicycle_kick,n,stumble,h3❎,#$31/1/0/1|$32/5/0/1|$33/6/0/1|$32/5/0/1,f,f,f,f,t,f,t,f,f,t,t@hat_toss,19,20,20,3,3,kl_hat_toss,n,flinch,⬅️+➡️+🅾️,#37|37|$18/7|$20/7,f,f,f,f,f,t,t,f,f,t,t;spin,23,15,20,n,1.5,kl_spin,n,thrown_up,⬆️+⬆️,#3|$34/1/0/0/f/f/t|$35/1/0/0/t/f/t|$35/2/0/0/t/f/t|$35/3/0/0/t/f/t|$36/3/0/0/t/f/t|$36/3/0/0/t/f|$35/3|$35/2|35,f,f,f,f,t,f,t,f,f,t,t;teleport,21,n,n,n,4,kl_teleport,n,n,⬇️+⬆️,#$4/1/0/1,f,f,f,f,f,f,t,f,f,t,f;diving_kick,21,14,n,n,4,kl_diving_kick,n,thrown_backward,⬇️❎,#12|14,t,f,f,f,f,f,t,f,f,t,t@low_green_bolt,19,20,20,2,4,pj,n,flinch,⬅️+⬇️+➡️+🅾️,#18|$20/7,f,f,f,f,f,t,t,f,f,f,t;high_green_bolt,19,20,20,2,4,jc_high_green_bolt,n,flinch,➡️+⬇️+⬅️+🅾️,#18|$20/7,f,f,f,f,f,t,t,f,f,f,t;shadow_kick,21,15,20,2,2,jc_shadow_kick,n,thrown_backward,⬅️+➡️+❎,#12|$14/7,f,f,f,f,f,t,t,f,f,t,t;nut_cracker,n,25,20,2,3,jc_nut_cracker,n,ouch,⬇️🅾️❎,#$40/1/0/1|$41/1/0/1,f,f,f,f,f,t,t,f,f,t,f;uppercut,21,14,20,n,2,jc_uppercut,n,thrown_backward,⬅️+⬇️+⬅️+🅾️,#$7/2|$8/3,f,f,f,f,f,f,t,f,f,t,t@acid_spit,19,20,20,2,4,pj,n,flinch,➡️+➡️+🅾️,#29|$30/7|$30/7,f,f,f,f,f,t,t,f,f,f,t;force_ball,19,20,20,2,4,rp_force_ball,n,thrown_forward,⬅️+⬅️+🅾️,#18|19,f,f,f,f,f,t,t,f,f,f,f;invisibility,26,n,20,n,2,rp_invisibility,n,n,⬆️+⬆️+⬇️,#3|34|35|$35/2|$35/3|$36/3,f,f,f,f,f,f,t,f,f,f,f;slide,21,14,20,2,4,slide,n,thrown_forward,⬅️🅾️❎,#$4/1/0/1|$27/1/0/1,f,f,f,f,f,t,t,f,f,t,f@freeze,19,27,0,2,4,sz_freeze,n,n,⬇️+➡️+🅾️,#18|19,f,f,f,f,f,t,t,f,f,f,f;slide,21,14,20,2,4,slide,n,thrown_forward,⬅️🅾️❎,#$4/1/0/1|$27/1/0/1,f,f,f,f,f,t,t,f,f,t,f@fire_skull,19,20,20,2,4,pj,n,flinch,⬅️+⬅️+🅾️,#18|$19/7,f,f,f,f,f,t,t,f,f,f,t;morph_lk,26,n,0,n,2,st_morph#1,n,n,⬅️+➡️+➡️+🅾️❎,#1,f,f,f,f,f,f,t,f,f,f,f;morph_kl,26,n,0,n,2,st_morph#2,n,n,⬅️+⬇️+⬅️+❎,#1,f,f,f,f,f,f,t,f,f,f,f;morph_jc,26,n,0,n,2,st_morph#3,n,n,⬅️+⬅️+⬇️+🅾️,#1,f,f,f,f,f,f,t,f,f,f,f;morph_rp,26,n,0,n,2,st_morph#4,n,n,⬆️+⬇️+🅾️,#1,f,f,f,f,f,f,t,f,f,f,f;morph_sz,26,n,0,n,2,st_morph#5,n,n,➡️+⬇️+➡️+🅾️,#1,f,f,f,f,f,f,t,f,f,f,f;morph_kn,26,n,0,n,2,st_morph#7,n,n,🅾️❎+🅾️❎+🅾️❎,#1,f,f,f,f,f,f,t,f,f,f,f;morph_jx,26,n,0,n,2,st_morph#8,n,n,⬇️+➡️+⬅️+❎,#1,f,f,f,f,f,f,t,f,f,f,f;morph_ml,26,n,0,n,2,st_morph#9,n,n,h3🅾️,#1,f,f,f,f,f,f,t,f,f,f,f;morph_bk,26,n,0,n,2,st_morph#10,n,n,⬇️+⬇️+❎,#1,f,f,f,f,f,f,t,f,f,f,f;morph_sc,26,n,0,n,2,st_morph#11,n,n,⬆️+⬆️,#1,f,f,f,f,f,f,t,f,f,f,f;morph_sc,26,n,0,n,2,st_morph#12,n,n,⬇️+⬅️+➡️+❎,#1,f,f,f,f,f,f,t,f,f,f,f@fan_throw,19,20,20,2,4,pj,n,flinch,➡️+➡️+🅾️,#18|$29/7,f,f,f,f,f,t,t,f,f,f,t;aerial_fan_throw,19,20,20,2,4,pj,n,flinch,➡️+➡️+🅾️,#18|$20/7,t,f,f,f,f,t,t,f,f,f,t;flying_punch,21,14,20,2,1,kn_flying_punch,n,thrown_backward,➡️+⬇️+⬅️+🅾️,#$8/3|15,f,f,f,f,f,f,t,f,f,t,t;fan_lift,23,n,0,2,2,kn_fan_lift,n,stumble,⬅️+⬅️+⬅️+🅾️,#$7/2|$8/3,f,f,f,f,f,t,t,f,f,t,f@energy_wave,19,20,20,2,4,pj,n,flinch,➡️+⬇️+⬅️+❎,#18|$20/7,f,f,f,f,f,t,t,f,f,f,t;ground_pound,n,28,20,2,2,jx_ground_pound,n,stumble,h3❎,#$4/1/0/1|$42/2/0/1,f,f,f,f,f,t,t,f,f,t,f;gotcha,n,29,0,2,3,jx_gotcha,n,grabbed,➡️+➡️+🅾️,#18|20|20,f,f,f,f,f,t,t,f,f,t,f;back_breaker,n,30,20,n,8,jx_back_breaker,n,broken_back,🅾️❎,#43|44|19,t,f,f,f,f,f,t,f,f,f,t@sai_throw,19,20,20,2,4,pj,n,flinch,h2🅾️,#18|$19/7,f,f,f,f,f,t,t,f,f,f;aerial_sai_throw,19,20,20,2,4,pj,n,flinch,h2🅾️,#18|$19/7,t,f,f,f,f,t,t,f,f,f,t;teleport_kick,21,14,20,n,4,ml_teleport_kick,n,flinch,➡️+➡️+❎,#$4/1/0/1,f,f,f,f,f,f,t,f,f,t,t;ground_roll,17,14,20,n,2,ml_ground_roll,n,thrown_forward,⬅️+⬅️+⬇️+❎,#$16/6/0/2|$17/4/2/1|$16/6/0/-2/t/t/t/t|$17/4/-2/-1/t/t/t/t,f,f,f,f,t,f,t,f,1,t,f@blade_spark,19,20,20,2,4,pj,n,flinch,⬇️+⬅️+🅾️,#18|$20/7,f,f,f,f,f,t,t,f,f,f,t;blade_fury,n,22,20,1,3,bk_blade_fury,n,stumble,⬅️+⬅️+⬅️+🅾️,#$7/2|$9/3|$7/2|20,f,f,f,f,t,f,t,1,f,t,t@spear,31,32,5,2,4,sc_spear,n,grabbed,⬅️+⬅️+🅾️,#18|$20/7,f,f,f,f,f,t,t,f,f,t,t;teleport_punch,21,14,0,n,1,sc_teleport_punch,n,n,⬇️+⬅️+🅾️,#$15/6,f,f,f,f,f,f,t,f,f,t,f;scissors,18,14,15,5,2,atk,n,swept,➡️+⬇️+⬅️+❎,#$4/1/0/1|$25/2/0/1|$26/3/-1/1|$25/2/0/1/t/f/t/f|$31/1/0/1|$31/1/0/1|$31/1/0/1|$4/1/0/1,f,t,f,f,f,f,f,1,f,f,f@lightning,19,20,20,2,4,pj,n,flinch,⬇️+➡️+🅾️,#18|$19/7,f,f,f,f,f,t,t,f,f,f,t;electric_grab,n,22,25,2,3,rd_electric_grab,n,stumble,h4🅾️,#18|19,f,f,f,f,f,t,t,f,f,t,f;teleport,24,n,n,n,4,rd_teleport,n,n,⬇️+⬆️,#$4/1/0/1,f,f,f,f,f,f,t,f,f,t,f;torpedo,33,28,20,3,4,rd_torpedo,n,grabbed,⬅️+⬅️+➡️,#18|$45/4/4|$46/4/4,f,f,f,f,f,f,t,f,f,t,f@pj,19,20,35,2,4,sk_pj,n,propelled,➡️+➡️+🅾️,#18|$19/7,f,f,f,f,f,t,t,f,f,f,t;sledgehammer,21,15,35,3,3,sk_sledgehammer,n,propelled,➡️+➡️+❎,#18|47|19,f,f,f,f,f,f,t,f,f,t,t", "@"), split("lk_f1,0,12,3,n,t,chomp,#$t4x-04128/n|$t4x-04130/n|$t4x-04132/n|$t4x-04132/n|$t4x-04132/n|$t4x-04132/n|$t4x-04134/n|$t4x-04128/n,⬇️+➡️+⬅️+⬅️+❎;lk_f2,0,6,3,n,f,no_head,#$6/1/0/1|$7/2|$8/3|$8/3|$8/3|$7/2|0,⬇️+➡️+⬆️+⬅️+⬇️@kl_f1,48,n,n,hat_toss,f,no_head,n,⬅️+➡️+🅾️;kl_f2,4,6,3,n,f,halved,#$29/1|$29/1|$t2136/7/4|$t2138/7/4|$t2138/7/4|$t2136/7/4|$29/1,➡️+➡️+➡️+❎@jc_f1,0,6,3,n,f,no_head,#$6/1/0/1|$7/2|$8/3|$8/3|$8/3|$7/2|0,➡️+➡️+⬇️+⬆️;jc_f2,0,6,4,n,f,ripped,#18|19|19|47|47|19|19|18,⬇️+⬇️+➡️+➡️+🅾️@rp_f1,0,6,5,n,f,chomp,#29|$30/8|$30/8|$x+027/9|$x+0458/10|$x+0458/10|$x+027/9|$30/8|$30/8|29,⬅️+⬅️+⬇️+🅾️;rp_f2,0,1,1,n,f,ripped,#1,➡️+➡️+⬇️+❎@sz_f1_1,0,1,0,n,f,n,#1,➡️+➡️+⬇️+❎;sz_f1_2,0,3,3,n,f,explode,#$6/1/0/1|$7/2|$8/3|$8/3|$8/3|$7/2|0,➡️+⬇️+➡️+➡️+🅾️", "@"), "name,bg_color,bd_pal_map,gender,hd_pal_map,hd_sps,pj_fps,pj_h,pj_pal_map,pj_sps"

  for i, c_attrs in ipairs(c_attr_list) do
    chars[i] = string_to_hash(c_attr_keys, split(c_attrs))
    chars[i].special_atks = define_acs(sa_attr_list[i])
    chars[i].finishing_mvs = define_acs(fa_attr_list[i], "name,distance,fps,dmg_sp,pj,skip_pal_shift,reac,sps,sequence")
  end

  return chars
end

function define_acs(attr_list, attr_keys)
  local acs, attr_list, attr_keys = {}, split(attr_list or "broken_back,n,n,n,n,8,broken_back,thrown_backward,n,n,#$24/4/-4/0/f/f/t/t|$22/4/-4/0/f/f/t/t,t,f,f,f,f,f,f,f,f,f,f;block,n,16,n,n,2,n,n,n,n,#10|11,f,f,t,t,f,t,f,f,f,f,f;crouch,n,n,n,n,2,n,n,n,n,#$4/1/0/1|$5/1/0/2,f,f,t,t,f,t,f,f,f,f,f;fall,n,n,n,n,2,fall,prone,n,n,#$23/6/0/0|$24/4/-4/0/f/f/t/t,t,f,f,f,f,f,f,f,f,t,f;flinch,n,n,n,n,6,flinch,n,n,n,#$23/6,f,f,f,f,f,f,f,f,f,f,f;grabbed,n,n,n,n,1,grabbed,n,n,n,#$23/6,f,f,f,f,f,f,f,f,f,t,f;jump_kick,n,14,10,1,3,jump_atk,n,thrown_backward,n,#$14/6,t,t,f,f,f,f,f,f,f,t,t;jump_punch,n,14,10,1,3,jump_atk,n,flinch,n,#$15/6,t,t,f,f,f,f,f,f,f,t,t;fainted,n,n,n,n,1,n,n,n,n,#$22/d4/-4/0/f/f/t/t,f,f,f,f,f,f,f,f,1,t,f;get_up,n,n,n,n,2,n,n,n,n,#$5/1/0/2|$4/1/0/1,f,f,f,f,f,f,f,f,f,f,f;hook,n,15,100,3,3,atk,n,thrown_up,n,#$6/1/0/1|$7/2|$8/3|$8/3|$8/3|$7/2|0,f,t,f,f,f,f,f,1,f,f,t;idle,n,n,n,n,1,n,n,n,n,#0,f,f,t,f,f,f,f,f,f,f,f;jump,17,n,n,n,2,jump,n,n,n,#$16/6/0/2|$17/4/2/1|$16/6/0/-2/t/t/t/t|$17/4/-2/-1/t/t/t/t,t,f,f,f,t,f,f,f,f,t,f;kick,n,14,10,2,2,atk,n,flinch,n,#$12/5|$13/6|$13/6,f,t,f,f,f,t,f,1,f,f,t;ouch,n,n,n,n,4,ouch,n,n,n,#34|38|$39/1/0/1,f,f,f,f,f,t,f,f,f,t,f;prone,n,n,n,n,8,n,get_up,n,n,#$22/4/-4/0/f/f/t/t,f,f,f,f,f,f,f,f,1,f,f;punch,n,14,10,2,2,atk,n,flinch,n,#$7/2|$9/3|$9/3,f,t,f,f,f,t,f,1,f,f,t;roundhouse_kick,n,15,20,4,2,atk,n,thrown_backward,n,#$7/2|$28/3/-1|$7/2/0/0/t/f/t/f|$12/5|$13/6|$13/6|$13/6|$12/5,f,t,f,f,f,f,f,1,f,f,t;stumble,n,n,n,n,6,n,n,n,n,#$23/6|1,f,f,f,f,t,f,f,f,f,t,f;sweep,n,18,10,5,2,sweep,n,swept,n,#$4/1/0/1|$25/2/0/1|$26/3/-1/1|$25/2/0/1/t/f/t/f|$27/1/0/1|$27/1/0/1|$4/1/0/1,f,t,f,f,f,f,f,1,f,f,f;swept,n,n,n,n,4,swept,prone,n,n,#$21/6/0/1,f,f,f,f,f,f,f,f,f,f,f;propelled,n,n,n,n,3,propelled,prone,n,n,#$23/6/0/0|$24/4/-4/0/f/f/t/t,t,f,f,f,f,f,f,f,f,t,f;taunt,n,n,n,n,6,n,n,n,n,#48|20|48|20|48|20|48,f,f,f,f,f,f,f,f,f,f,f;boss_defeated,n,n,n,n,6,n,n,n,n,#49|50,f,f,f,f,t,f,f,f,f,t,f;dizzy,n,n,n,n,10,n,n,n,n,#$51/d1|$52/d1/1|$51/d1|$53/d1/-1,f,f,f,f,t,f,f,f,f,t,f;thrown_backward,n,n,n,n,3,thrown_backward,prone,n,n,#$23/6/0/0|$24/4/-4/0/f/f/t/t,t,f,f,f,f,f,f,f,f,t,f;thrown_forward,n,n,n,n,3,thrown_forward,prone,n,n,#$23/6/0/0|$24/4/-4/0/f/f/t/t,t,f,f,f,f,f,f,f,f,t,f;thrown_up,n,n,n,n,3,thrown_up,prone,n,n,#$23/6/0/0|$24/4/-4/0/f/f/t/t,t,f,f,f,f,f,f,f,f,t,f;walk,n,n,n,n,4,walk,n,n,n,#1|2|3|2,f,f,t,f,f,f,f,f,f,f,f", ";"), split(attr_keys or "name,ac_sfx,hit_sfx,dmg,dmg_sp,fps,hdlr,complementary_ac,reac,sequence,sps,is_aerial,is_atk,is_cancelable,is_holdable,is_resetable,is_reversible,is_special_atk,is_x_shiftable,is_y_shiftable,requires_forced_stop,spills_blood")

  for i, attrs in ipairs(attr_list) do
    attrs = split(attrs)
    acs[attrs[1]] = string_to_hash(attr_keys, attrs)
  end

  return acs
end

function define_pl(id, p)
  local p = p or {}
  local next_cbs = p.next_cbs

  if not next_cbs then
    next_cbs = split "1,2,3,4,5,6,7,8,9,10,11,12"

    for i = #next_cbs, 2, -1 do
      local j = flr(rnd(i)) + 1
      next_cbs[i], next_cbs[j] = next_cbs[j], next_cbs[i]
    end
  end

  local is_p1 = id == p1_id
  local p = string_to_hash("ac_stack,ac_stack_timeout,char,ca,caf,cap,facing,has_locked_controls,has_joined,highlighted_char,hp,held_btns,held_btns_timer,id,input_detection_delay,is_x_shifted,is_y_shifted,next_cbs,prt_sets,previous_btns,previous_directionals,pj,released_btns,st_timers,t,x,y", { "", ac_stack_timeout, p.char, acs.idle, 0, {}, is_p1 and forward or backward, false, p.has_joined, is_p1 and 1 or 4, 100, nil, 0, id, 0, false, false, next_cbs, {}, nil, nil, nil, nil, { frozen = 0, invisible = 0, morphed = 0 }, 0, is_p1 and 36 or 127 - 36 - sp_w, y_bottom_limit })

  if is_p1 then
    p1 = p
  else
    p2 = p
  end
end