*battle_round_start
[eval exp="f.Round += 1"]
[eval exp="f.GRD = 1 , f.AVD =  0 , f.EN_STR_BUFF=0" ]

[eval exp="f.warning += 1 , f.turn += 1" cond="f.Round >= 2"]
[eval exp="f.warning = 100" cond="f.warning > 100"]
[WSs]
[return]
[s]
;-------------------------------------------------------------------------------
*battle_round_end
[if exp="f.poison > 0"]
毒により鈴耶の体力が減少[p]
[eval exp="f.HP -= 10"][eval exp="f.HP = 1" cond="f.HP < 0"][WSs]
[endif]

[if exp="f.aphrodisy > 0"]
欲情効果により鈴耶の快感が上昇[p]
[eval exp="f.ERO += f.aphrodisy"][eval exp="f.ERO = 999" cond="f.ERO < 1000"][WSs]
[endif]

[return]
[s]
