pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include init.lua
#include update.lua
#include draw.lua
#include utils.lua

__gfx__
00000000000220000002200000022000000000000000000000000000088008800880088000000000000000000000000000000000000000000000000000000000
00000000002880000028820000088200000770000007700000c77c00888888788008800800000000000000000000000000000000000000000000000000000000
0070070000288200002882000028820000c77c00000770000cccccc0888888788000000800000000000000000000000000000000000000000000000000000000
0007700002e88e2002e88e2002e88e2000cccc00000cc00000cccc00888888888000000800000000000000000000000000000000000000000000000000000000
00077000087c88202e87c8e20288c780000cc000000cc00000000000088888800800008000000000000000000000000000000000000000000000000000000000
0070070008118820288118820288118000000000000cc00000000000008888000080080000000000000000000000000000000000000000000000000000000000
00000000025582200285582002285520000000000000000000000000000880000008800000000000000000000000000000000000000000000000000000000000
00000000002992000029920000299200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900033003300330033003300330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09aaaa9033b33b3333b33b3333b33b33000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aa77aa93bbbbbb33bbbbbb33bbbbbb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9a7777a93b7707b33b7707b33b7707b3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9a7777a90b7007b00b7007b00b7007b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aa77aa9003773000037730000377300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
09aaaa90030330300303303003033030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00999900030000303000000303300330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00000000000000000000000000000000000000500000000000000050000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000099900000000555555000500000055555500550000000000000000000000000000000000000000000000000000000000000000000
00000000070000000000999999900000055522222255550000052552225550000000050555000000000000000000000000000000000000000000000000000000
00070000000007000009aaaaaaaa9900005228888882550000525588885555000000055500000500000000000000000000000000000000000000000000000000
0000770aaa900000009aaaa777aaa990055288999988200000552255555525500000000000005505000000000000000000000000000000000000000000000000
000000a777aa0000009aaaa7777aaa905522889aaa98250005255552999525000000000000000550000000000000000000000000000000000000000000000000
00000a7777770700009aa777777aaa00022889aa7aa9825002255995999982505005555000000550000000000000000000000000000000000000000000000000
0000a7777777a000099aa7777777aa00522889a777aa825502288999995885500050505500000000000000000000000000000000000000000000000000000000
000097777777a00009aaa7777777aa9052289aa77aaa822502289955558885200055000000005005000000000000000000000000000000000000000000000000
00000a777777a00009aaa7777777aa9005289aaaaaaa825505255995588952500055000050005550000000000000000000000000000000000000000000000000
00770a77777a7000009aaa77777aaa900528899aaaa9825005585555595582500050005055000550000000000000000000000000000000000000000000000000
000000777aa007000099aaaaaaaaa900052288999998825005555255999882500000500005555500000000000000000000000000000000000000000000000000
000070000000000000099aaaaaa99900005528888882250000525555558225000055000000555000000000000000000000000000000000000000000000000000
00000007007000000000999aa9999000000552222250050000005222225000000000505500050000000000000000000000000000000000000000000000000000
00000000007000000000000999000000000050550550500000000055050000000000050000500000000000000000000000000000000000000000000000000000
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
00000000000000000000000000070000020000200200002002000020020000205555555555555555555555555555555502222220022222200222222002222220
000bb000000bb0000007700000077000022ff220022ff220022ff220022ff2200578875005788750d562465d0578875022e66e2222e66e2222e66e2222e66e22
0066660000666600606666066066660602ffff2002ffff2002ffff2002ffff2005624650d562465d05177150d562465d27761772277617722776177227716772
0566665065666656b566665bb566665b0077d7000077d700007d77000077d700d517715d051771500566865005177150261aa172216aa162261aa612261aa162
65637656b563765b056376500563765008577580085775800857758008577580056686500566865005d24d50056686502ee99ee22ee99ee22ee99ee22ee99ee2
b063360b006336000063360000633600080550800805508008055080080550805d5245d505d24d500505505005d24d5022299222229999222229922222299222
006336000063360000633600006336000c0000c007c007c007c00c7007c007c05005500505055050050000500505505020999902020000202099990202999920
0006600000066000000660000006600000c7c7000007c0000077cc000007c000dd0000dd0dd00dd005dddd500dd00dd022000022022002202200002202200220
00ff880000ff88000000000000000000200000020200002000000000000000003350053303500530000000000000000000000000000000000000000000000000
0888888008888880000000000000000022000022220000220000000000000000330dd033030dd030005005000350053000000000000000000000000000000000
06555560076665500000000000000000222222222222222200000000000000003b8dd8b3338dd833030dd030030dd03003e33e300e33e330033e333003e333e0
6566665576555565000000000000000028222282282222820000000000000000032dd2300b2dd2b0038dd830338dd833e33e33e333e33e333e33e333e33e333e
57655576555776550000000000000000288888822888888200000000000000003b3553b33b3553b3033dd3300b2dd2b033300333333003333330033333300333
0655766005765550000000000000000028788782287887820000000000000000333dd333333dd33303b55b303b3553b3e3e3333bbe33333ebe3e333be3e3333b
0057650000655700000000000000000028888882080000800000000000000000330550330305503003bddb30333dd3334bbbbeb44bbbebb44bbbbeb44bbbebe4
00065000000570000000000000000000080000800000000000000000000000000000000000000000003553000305503004444440044444400444444004444440
0066600000666000006660000068600000888000002222000022220000222200002222000cccccc00c0000c00000000000000000000000000000000000000000
055556000555560005585600058886000882880002eeee2002eeee2002eeee2002eeee20c0c0c0ccc000000c0000000000000000000000000000000000000000
55555560555855605588856058828860882228802ee77ee22ee77ee22eeeeee22ee77ee2c022220ccc2c2c0cc022220c00222200000000000000000000000000
55555550558885505882885088222880822222802ee77ee22ee77ee22ee77ee22ee77ee2cc2cac0cc02aa20cc0cac2ccc02aa20c000000000000000000000000
15555550155855501588855018828850882228802eeeeee22eeeeee22eeeeee22eeeeee2c02aa20cc0cac2ccc02aa20ccc2cac0c000000000000000000000000
01555500015555000158550001888500088288002222222222222222222222222222222200222200c022220ccc2c2c0cc022220c000000000000000000000000
0011100000111000001110000018100000888000202020200202020220202020020202020000000000000000c000000cc0c0c0cc000000000000000000000000
00000000000000000000000000000000000000002000200002000200002000200002000200000000000000000c0000c00cccccc0000000000000000000000000
000880000009900000089000000890000000000001111110011111100000000000d89d0000189100001891000019810000005500000050000005000000550000
706666050766665000676600006656000000000001cccc1001cccc10000000000d5115d000d515000011110000515d0000055000000550000005500000055000
1661c6610161661000666600001666000000000001cccc1001cccc1000000000d51aa15d0151a11000155100011a151005555550055555500555555005555550
7066660507666650006766000066560000000000017cc710017cc71000000000d51aa15d0d51a15000d55d00051a15d022222222222222222222222222222222
0076650000766500007665000076650000000000017cc710017cc710000000006d5005d6065005d0006dd6000d50056026060602260606022666666226060602
000750000007500000075000000750000000000001111110011111100000000066d00d60006d0d600066660006d0d60020000002206060622222222020606062
00075000000750000007500000075000000000001100001101100110000000000760067000660600000660000060660020606062222222200000000022222220
00060000000600000006000000060000000000001100001101100110000000000070070000070700000770000070700022222220000000000000000000000000
0007033000700000007d330003330333000000000022220000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d3300000d33000028833003bb3bb3000000000888882000000000000000000000000000000000000000000000000000000000000000000000000000000000
0778827000288330071ffd1000884200002882000888882000288200000000000000000000000000000000000000000000000000000000000000000000000000
071ffd10077ffd700778827008ee8e800333e33308ee8e80088ee883000000000000000000000000000000000000000000000000000000000000000000000000
00288200071882100028820008ee8e8003bb4bb308ee8e8008eeee83000000000000000000000000000000000000000000000000000000000000000000000000
07d882d00028820007d882d00888882008eeee800088420008eeee80000000000000000000000000000000000000000000000000000000000000000000000000
0028820007d882d000dffd0008888820088ee88003bb3bb3088ee880000000000000000000000000000000000000000000000000000000000000000000000000
00dffd0000dffd000000000000222200002882000333033300288200000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000149aa94100000000012222100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00019777aa921000000029aaaa920000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d09a77a949920d00d0497777aa920d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0619aaa9422441600619a77944294160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07149a922249417006149a9442244160000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
07d249aaa9942d7006d249aa99442d60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
067d22444422d760077d22244222d770000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d666224422666d00d776249942677d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
066d51499415d66001d1529749251d10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0041519749151400066151944a151660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00a001944a100a0000400149a4100400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000049a400090000a0000000000a00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0001000034150311502d1502815023150211501f150211501d1501b1501915019150181501715017150151501315012150101500e1500b1500915005150041500415004150041500515004150031500215001150
000100002d5502955026550225501d55019550175500e5000c500095000850003500005000850000500015000050000500075000750007500075000b5000a7000b5000c5000d5000e5000f5000f5001050012500
000000002f330186302b330293300f63018630253301763022330156301c330156301b3301b3301a330193300863017330153301063012330046300f3300d3300c3300a3300a3300163008330073300633003330
00000000223501f3501c3501a35017350173501535013350133500c35011350103500c3500a350083500535004350033500235002350013500135001350003500135001350013500035000350003500035001350
011000001880000000000000000000000000001a80000000000001a80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244
00 42414244

