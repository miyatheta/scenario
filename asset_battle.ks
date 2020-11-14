*battle_round_start
[eval exp="f.Round += 1"]
[eval exp="f.GRD = 1 , f.AVD =  0 , f.EN_STR_BUFF=0" ]

[eval exp="f.warning += f.NOISE" cond="f.Round >= 2"]
[eval exp="f.warning = 100" cond="f.warning > 100"]
[return]
