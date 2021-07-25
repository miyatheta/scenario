;変数宣言
;基本ステータス
[eval exp="f.HP_MAX = 1000, f.SAN_MAX = 60, f.SEX = 30"]
[eval exp="f.STR_MAX = 30 , f.POW_MAX=30, f.SPD_MAX = 32, f.MOVE_MAX = 12"]
;服装
[eval exp="f.dress = 1 , f.invincible = 0 "]
;欲情など
[eval exp="f.ERO = 0 , f.orgasmpoint = 0 , f.acme = 0"]
;感度
[eval exp="f.ANAL = 50, f.VGNA = 100, f.BOOB = 50"]
;魅力
[eval exp="f.HLv = 30"]
;バッドステータス
[eval exp="f.poison = 0, f.DPoizon = 0, f.Wheeze = 0, f.Estrus = 0"]
[eval exp="f.ERO_down = 0, f.DEF_down = 0, f.ATP_down = 0, f.RESdown = 0, f.DEXdown = 0"]
;ペナルティステータス
[eval exp="f.Parasite = 0, f.milk = 0, f.milkpoint = 0, f.mazo = 0, f.bags = 0, f.slave = 0, f.tatoo = 0, f.nasty = 0"]
[eval exp="f.date = 0"]
[eval exp="f.escape = 0 , f.charm = 0"]
[eval exp="f.rapture = 0 , f.onanie = 0"]
[eval exp="f.SPD = f.SPD_MAX, f.MOVE = f.MOVE_MAX, f.STR = f.STR_MAX, f.POW = f.POW_MAX "]
[eval exp="f.HP = f.HP_MAX, f.SAN = f.SAN_MAX"]
;スキル
[iscript]
f.skill=[0,1,2,3];
f.skill[0]={name:"心眼",value:100,learn:0,cooltime:0};
f.skill[1]={name:"変り身",value:100,learn:0,cooltime:0};
f.skill[2]={name:"誘惑",value:100,learn:0,cooltime:0};
f.skill[3]={name:"空蝉",value:100,learn:0,cooltime:0};
[endscript]
[return]
