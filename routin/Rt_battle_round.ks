*battle_round_start
[eval exp="f.Round += 1"]
[eval exp="f.GRD = 1 , f.AVD =  0 , f.EN_STR_BUFF=0" ]

[eval exp="f.warning += 1 , f.turn += 1" cond="f.Round >= 2"]
[eval exp="f.warning = 100" cond="f.warning > 100"]
[WSs]

[if exp="f.ambush > 0"]
#
鈴耶の不意打ち[r]
鈴耶の集中力が上昇[p]
[eval exp="f.MND += 1 , f.ambush = 0"][WSs]
[endif]

[if exp="f.unescape == 1"]
#
逃走封印状態が解消した[p]
[endif]
[eval exp="f.unescape -= 1 " cond="f.unescape > 0"]

[if exp="f.En_Raptured_time == 1"]
#
敵は房中術の影響から脱した[p]
[endif]
[eval exp="f.En_Raptured_time -= 1 " cond="f.En_Raptured > 0"]

[if exp="f.En_Wiseman_time == 1"]
#
敵は虚脱状態から回復した[p]
[endif]
[eval exp="f.En_Wiseman_time -= 1 " cond="f.En_Wiseman > 0"]

[return]
[s]
;-------------------------------------------------------------------------------
*battle_round_end
[if exp="f.poison > 0"]
毒により鈴耶の体力が減少[p]
[eval exp="f.HP -= 10"][eval exp="f.HP = 1" cond="f.HP < 0"][WSs]
[endif]

[if exp="f.aphrodisy > 0"]
[eval exp="tf.fuck = f.aphrodisy "]
[eval exp="tf.fuck = tf.fuck * f.CURSE / 100 + tf.fuck"]
欲情効果により鈴耶の快感[emb exp="tf.fuck"]が上昇[p]
[eval exp="f.ERO = tf.fuck + f.aphrodisy"][eval exp="f.ERO = 999" cond="f.ERO < 1000"][WSs]
[endif]

[return]
[s]