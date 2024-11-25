pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include shared/draw.lua
#include shared/update.lua
#include shared/utils.lua
#include core/draw.lua
#include core/init.lua
#include core/update.lua
#include draw/character_selection.lua
#include draw/gameplay.lua
#include draw/next_combat.lua
#include draw/start.lua
#include update/character_selection.lua
#include update/gameplay/actions.lua
#include update/gameplay/combat.lua
#include update/gameplay/controls.lua
#include update/gameplay/core.lua
#include update/gameplay/movement.lua
#include update/gameplay/special_attacks.lua
#include update/next_combat.lua
#include update/start.lua

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000f00000000000000000000000100000000000000000000000000000000
0943349009433490094334900943349000000000000000000000000000944300094ee490094ee4f1094334900943349f09433400094334000043340000433491
0f1aab100f1aab100f1aab100f1aab1009433490000000000943340000f1ba1010bddb0010bddb000f1aab010f1aab0001ba190010b19c5501ba190001baab00
00c22c0000c22c0000c22c0000c22c0001c22c100143341010c22c1000c22c0000c22c0000c22c0000c22c0000c22c0000c22c0000c2200000c22c5500c22c00
05000500005005000050500000055000005005000050050000500500050005000500050005000500050005000500050000500050005000000500000005005000
00000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000009100000000000000900000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000004bc50000000000004bc500000000000000000000000000000000000000000000000000000000
00000000c40000000000000000000000000000000000000000003a200000000000003a2000000000000000000000000000000000000100000000000000000000
00000000130000000043349000433491004334910000000000003a200943349000003a2000000000000000000000000094334900009f34900943349000000000
000000001300000000f1ab0100ba9f1001baab000943349000004bc5001aab01000041c5009ee40014ee4900094331900baab01000baab1010baab0109433400
00433400c400000000c22c0000c22c0000c22c0010c22c010000910000c22c000000900000f12c100c22c01010c22c000c22c00000c22c0088c22c0001baabc5
00c11c0000000000050005000500050005000500000505000000000000500500000000000500050055005000005000555000500000500500050005000022cc50
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000000009f1000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000900000009000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000001000000000cb400000cb4000001010000
0000000000000000000000000000000000000000000010000000000000000000000000000000000000000000f000000f1000000152a3000052a300000f00f000
00000000000000000943349000943300094ee4900943f900094334900000000000000000000000000000000009433490f943349f52a3000052a3000009433900
09433400194334000f1aa1f000f1aa0000bddb0001baab0000faaf000943349009433490094334910044990000baab0000baab000cb400000cb4000000baab00
10baab5000baab5000c22c00002cc20000c22c0000c22c0000c11c0000faaf00001aa10001baab0000cc2f0000c22c0000c22c00000900000009000000c22c00
0022cc5000022cc5000550000005500000055000005005000005500000c11c005cc22cc55cc22cc50505001000055000000550000000100000009f1005000500
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
004334900f4334f00443344000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01baab0110baab010fbaabf000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00c22c0000c22c0010c22c0100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05000500005005000050050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00555550005555500055555000800000005555500055555000888500005888000058880000800000006666000088888000888880008888800000000008888800
00888800008888000088880058000000008888008088880088585855558585885585858800800000006fff00008fff8000888f80008888800000000000866600
0873f30008555f0000585500f78500008873f3000873f3000073f3000066ff0000666f00f75800000073f30000f363000088630000888800ff8800000087f700
85ffff008555ff0005855f00f385000005ffff0005ffff0000ffff000066ff0000666f00f388000000ffff0000ffff0000ffff0000ffff00f3f8000005588850
000000000000000000000000ff8500000000000000000000000000000000000000000000ff58000000000000000000000000000000000000f6f8000000000000
000000000000000000000000f38500000000000000000000000000000000000000000000f385000000000000000000000000000000000000f3f8000000000000
00000000000000000000000000050000000000000000000000000000000000000000000000500000000000000000000000000000000000000088000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000500000000000000000000000000000000000000000000000000000
0888880008888800000000000055550000555500005555000000000000555550005555500055555050000000005555500055555000555550000000000fffff00
0088660000888600500800000088880000888800008888000000000005888850058888500088885055500000008fff5000588f5000555850000000000077f700
0088ff0000888f00588800000077f70000555f0000555500f78500000573f30005555f0000555500f78500000073f3000088ff0000888800f785000000ffff00
00558800058885508768000000ffff000055ff0000555f00f785000055f8885055558800055555508385000000ffff0000ffff0000ffff00f3f5000000767600
00000000000000008f680000000000000000000000000000ff8500000000000000000000000000008f850000000000000000000000000000fff5000000000000
000000000000000087680000000000000000000000000000f785000000000000000000000000000083850000000000000000000000000000f3f5000000000000
00000000000000005000000000000000000000000000000000000000000000000000000000000000505500000000000000000000000000000055000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0fffff000fffff0000000000006688000068880006000000022212000606606006066060060660606000000000000000000000000000000000000000088a8700
00ffff0000ffff00000f00000668688006868880066000000073130000666600006666000066660026060000000000000000000000000000000000008888a700
00ffff0000ffff007f7f00006686888868686888f866000000111100067767600677676006776760f76000000000000000000000000000000000000088898900
00ff760000ffff006f7f000000ffff0000ffff00f68600000557699962ffff2662ffff2662ffff26f76600000000000000000000000000000000000008889900
00000000000000007fff00000000000000000000f868000000000000000000000000000000000000f66600000000000000000000000000000000000000000000
00000000000000006f7f00000000000000000000f888000000000000000000000000000000000000f76000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000680000000000000000000000000000000000000260600000000000000000000000000000000000000000000
00000000000000000000000000000000000000000800000000000000000000000000000000000000600000000000000000000000000000000000000000000000
0898a7000989a700089a77000d6660000d6d0000666d000067676000000200000015000000ddd50000dd5d0000d5dd00005ddd00666110000006600000000000
8889a700889a770089a77700d6777000d666d0007776d0006767600002d00000915766005d5d56575d56575d56575d5d575d5d56666610000006660000000000
88989a008989a70089aa7700666660006767600066666000676760002d7666000015000000000000000000000000000000000000005000000000660000000000
0889990008999a00089aaa00d6777000676760007776d000d666d00002d00000000000000000000000000000000000000000000000d000000000561000000066
0000000000000000000000000d66600067676000666d00000d6d000000020000000000000000000000000000000000000000000000500000000d011000000066
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d0000000500000d5d5d566
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000005000000d00000000000061
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000d000005000000000000011
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00004494940000000000449494000000000044949400000000004494940000000000444949000000000044449400000000004444940000000000004494940000
00009999990000000000999999000000000099999900000000009999990000000000999999000000000099999900000000009999990000000000009999990000
00004477970000000000447797000000000044779700000000004477970000000000444499000000000044444900000000004444490000000000004477970000
0060999fff0600000060999fff0600000060999fff0600000060999fff060000006069999f600000006099996f600000006099996f600000000060999fff6000
05558476765550000555847676555000055584767655500005558476765550000055558447500000005544445555000000554444555500000005558476765500
0044989ff94400000044989ff94400000044989ff94400000044989ff94400000004f9989f00000000449999894949640044999984f00000000444989ff94000
04ff448558ff400004ff448558ff400004ff448558ff400004ff448558ff40000004f4448500000004ff85584949496404ff855894f6f000004fff448558f400
4f0599955950f4004f0599955950f4004f0599955950f4004f0599955950f400005f4f6f956f00004f059559559496404f0595595f46400004f0559995590f40
664f448ff8f46600664f448ff8f46600664f448ff8f46600664f448ff8f46600005f94648f640000664f844855949640664f8448446400000664ff448ff84660
4f66dddddd66f4004f66dddddd66f4004f66dddddd66f4004f66dddddd66f4000004f6fdddf000004f66dddddd0000004f66dddddd89496404f660dddddd6f40
004f888dd8f40000004f888dd8f40000004f888dd8f40000004f888dd8f40000000046488d400000004f888888000000004f88888889496f0004f0888dd84000
0000998dd90000000000998dd90000000000998dd90000000000998dd9000000000099998d00000000009900990000000000990000000000000009998dd90000
00066000660000000000660066000000000066066000000000000666600000000006600066000000000660006600000000066000000000000000660006600000
000f4000f40000000000f400f40000000000f40f4000000000000f4f40000000000f4000f4000000000f4000f4000000000f4000000000000000f4000f400000
000000000000000000000000000000000000000000000000000000000000000000000000000000000088889a0088899a008899a700889a770000000000000000
000000000000000000000000000000000000000000000000000000000000000000000000000000000889899a088899a709899a770889a7770000000000000000
00000000000000000000000000000000000004944940000000000004640000000000044449400000888899a789899a778899a777889a77770000000000000000
0000000000000000000004944940000000000999999000000000504f6f0000000000099999900000889899a788899a779899a777889a77770000000000000000
000004944940000000000999999000000000047997400000000654f04640000000000444449000000888899a089899a708899a770889a7770000000000000000
00000999999000000000047997400000000609ffff906000000054f5f6f000000006099996f600f40088889a0088899a008899a700889a770000000000000000
0000047997400000000609ffff9060000055546776455500497f69898d8964000055544445555066000000000000000000000000000000000000000000000000
000609ffff906000005554677645550004fff89ff98fff40999f7f55fddd6f00000449999894fff9000000000000000000000000000000000000000000000000
005554677645550004fff89ff98fff404f044485584440f4497f6f55fddd0000004ff85584949494000000000000000000000000000000000000000000000000
04fff89ff98fff404f044485584440f4664ff995599ff466997979898d88000004f059559559ff40000000000000000000000000000000000000000000000000
4f044485584440f4664ff995599ff4664f60048ff84006f4494948494d8900000664f84485549490000000000000000000000000000000000000000000000000
664ff995599ff4664f600dddddd006f404f00dddddd00f40494989494d89640004f66dddddd00000000000000000000000000000000000000000000000000000
4f608dddddd806f404f0088dd8800f400000088dd8800000000054f5f6f06f000004f88888800000000000000000000000000000000000000000000000000000
04f9988dd8899f400000899dd99800000000899dd9980000000654f0464000000000999099000000000000000000000000000000000000000000000000000000
0006698dd8966000000066000066000000006600006600000000504f6f0000000006600066000000000000000000000000000000000000000000000000000000
0004400000044000000044000044000000004400004400000000000464000000000f4000f4000000000000000000000000000000000000000000000000000000
05550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
59995000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
59885000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
58885000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
11111111222222223333333355555555dddddddd8888888844444444eeeeeeee6666666600000000000000000000000000000000000000000000000000949400
11111111222222223333333355555555dddddddd8888888844444444eeeeeeee6666666600000000000000000000000000000000000000000000000000774700
11111111222222223333333355555555dddddddd8888888844444444eeeeeeee66666666000000000000000000000000000000000000000000000000f04fff0f
11111111222222223333333355555555dddddddd8888888844444444eeeeeeee6666666600000000000000000000000000000000000000000000000040976704
11111111222222223333333355555555dddddddd8888888844444444eeeeeeee6666666600000000000000000000000000000000000000000000000009855890
11111111222222223333333355555555dddddddd8888888844444444eeeeeeee66666666000000000000000000000000000000000000000000000000f45ff54f
11111111222222223333333355555555dddddddd8888888844444444eeeeeeee6666666600000000000000000000000000000000000000000000000000855800
11111111222222223333333355555555dddddddd8888888844444444eeeeeeee666666660000000000000000000000000000000000000000000000000f000f00
__map__
f1f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f1f4f4f4f4f4f4f4f4f4f4f4f4f4f4f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f1f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f2f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f3f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f0f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f5f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7f7
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
f8f8f8f8f8f8f8f8f8f8f8f8f8f8f8f800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
