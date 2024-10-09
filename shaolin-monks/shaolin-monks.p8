pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include utils.lua
#include init.lua
#include draw.lua
#include update.lua
__gfx__
00555550005555500055555000555550000000000000000000000000005555500055555000555550005555500055555000555550005555500055555000555550
00888800008888000088880000888800005555500000000000555550008888000088880000888800008888000088880000888800808888008088880080888800
0875f5000875f5000875f5000875f50000888800005555500088880008855f000058550f005855000875f5000875f5008875f5000875f5000875f5000875f500
85ffff0085ffff0085ffff0085ffff000875f500008888000875f5008555ff0005855f0f05855f0085ffff0085ffff0f05ffff0005ffff0005ffff0005ffff00
0f8888f00f8888f00f8888f00f8888f085ffff000875f50085ffff0000f888000f8888f00f8888ff0f8888f00f8888ff0f8888000f88880000888800008888ff
0ff555f00ff555f00ff555f00ff555f00f8558f085ffff000f85580000ff55f0f0555500f05555000ff5550f0ff555000f55ff00f05ff5ff0f55ff000f555500
005885000058850000588500005885000f5885f00f8558f0f05885f000588500005885000058850000588500005885000058850000588000005885ff00588500
0f000f0000f00f0000f0f000000ff00000f00f0000f00f0000f00f000f000f000f000f000f000f000f000f000f000f0000f000f000f000000f0000000f00f000
00000000000000000055555000555550005555500055555000555550000000000000000000000000000000000000000000000000000000000000000000000000
00000000000080000088880088888800008888000088880080888800000000000000000000000000000000000000000000000000000000000000000000000000
00555550005800000875f5000575f5000875f5008875f5000875f500000000000000000000000000000000000000000000000000000000000000000000000000
8088880058f7850085ffff0055ffff0085ffff0055ffff0055ffff00000000000000000000000000000000000000000000000000000000000000000000000000
0875f500f5f58500008888f0008888ff0f8888000f888800ff888800000000000000000000000000000000000000000000000000000000000000000000000000
05ffff00f5ff850000ff550f0055fff00f55555ff05555f0005555f0000000000000000000000000000000000000000000000000000000000000000000000000
0085580058f585000058850000588500008855f0008855f00008855f000000000000000000000000000000000000000000000000000000000000000000000000
005ff500000005000f000f000f000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
808888005000ff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0877f700587f855f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05ffff0058ff85800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f8888f0587f85800000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f5555f0587f855f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
005885000085ff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f00f00080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
08898a000898aa000989aa00089aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88889a008889a700889a770089a77700005555000055550000555500005555000000000000000000000000000000000000000000000000000000000000000000
8889890088989a008989a70089aa77005d5d56575d56575d56575d5d575d5d560000000000000000000000000000000000000000000000000000000000000000
088899000889990008999a00089aaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0055555000ddd5000004444003333300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00888800dd5d5d550044444000366600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0875f5000075f500044fff000077f700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
85ffff0000ffff000045650005533350000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f8888f00f5555f0011fff100f3333f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ff555f00ff888f00ff1f1f00ff555f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00588500001551000011510000533500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f000f000f000f000f000f000f000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ccccc00005555000055550000555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00c6660000dddd000511110000d44450000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0077f7000077f7000575f50000754500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
055ccc5000ffff0055f1115000444400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0fccccf00fdffdf0511111100d8448d0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ff555f00ffaa5f00ff555f004466640000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
005cc500005aa50000111f0000588500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f000f000f000f000f000f0004000400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
005555000fffff000aaaaa000066dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
052222000077f70000a66600066d6dd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0575f50000ffff000077f70066d6dd6d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55f222500df757d0055aaa5000ffff00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
522222200f8ff8f00faaaaf007cccc70000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0ff555f0066887600ff555f007f555f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00222f0000555500005aa500007cc700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f000f000f000f000f000f000f000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00555500055550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5d5d5d5dd5d5d5df0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0075f500075f50f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ffff000ffff1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0f588500058885000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001551f0f01550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f0000000f000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00ddd50000ddd50000ddd50000ddd500000000000000000000000000005ddd00005ddd00005ddd0000ddd50000ddd50000ddd50000ddd50000ddd50000000000
dd5d5d55dd5d5d55dd5d5d55dd5d5d5500ddd5000000000000ddd50055d5d5dd55d5d5dd55d5d5dddd5d5d55dd5d5d55dd5d5d55dd5d5d55dd5d5d5500000000
0075f5000075f5000075f5000075f500dd5d5d5500ddd500dd5d5d550066ff0000666f0f00666f000075f5000075f5000075f5000075f5000075f50000000000
00ffff0000ffff0000ffff0000ffff000075f500dd5d5d550075f5000066ff0000666f0f00666f0000ffff0000ffff0f00ffff0000ffff0000ffff0000000000
0f5555f00f5555f00f5555f00f5555f000ffff000075f50000ffff0000f55500055555f0055555ff0f5555f00f5555ff0f5555000f5555000055550000000000
0ff888f00ff888f00ff888f00ff888f00f5885f000ffff000f58850000ff88f0f0888800f08888000ff8880f0ff888000f88ff00f08ff1ff0f88ff0000000000
001551000015510000155100001551000f1551f00f5885f0f01551f000155100001551000015510000155100001551000015510000155000001551ff00000000
0f000f0000f00f0000f0f000000ff00000f00f0000f00f0000f00f000f000f000f000f000f000f000f000f000f000f0000f000f000f000000f00000000000000
00ddd5000066660000ddd50000ddd500005ddd00005ddd0000ddd500000000000000000000000000000000000000000000000000000000000000000000000000
dd5d5d55006fff00dd5d5d55dd5d5d5555d5d5dd55d5d5dddd5d5d55000000000000000000000000000000000000000000000000000000000000000000000000
0075f5000075f5000075f5000075f5000066ff00005f57000075f500000000000000000000000000000000000000000000000000000000000000000000000000
00ffff0000ffff0000ffff0000ffff000066ff0000ffff0000ffff00000000000000000000000000000000000000000000000000000000000000000000000000
0f5555f00f5555ff0f5555f00f5555f00f5555f00f5555f00f5555f0000000000000000000000000000000000000000000000000000000000000000000000000
0f88880ff0888800f0888ff0f088880ff088880ff088880ff08888f0000000000000000000000000000000000000000000000000000000000000000000000000
00155100001551000015510000115500001115000015510000155100000000000000000000000000000000000000000000000000000000000000000000000000
0f000f000f000f00000f0f00000ff000000ff000000ff000000f0f00000000000000000000000000000000000000000000000000000000000000000000000000
