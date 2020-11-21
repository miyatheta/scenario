*youkai
;ラウンド開始時処理--------------------------------------------------------------
[call storage="routin_battle_round.ks" target="*battle_round_start"]

[if exp="f.ambush > 0"]
#
鈴耶の不意打ち[r]
鈴耶の集中力が上昇[p]
[eval exp="f.MND += 1 , f.ambush = 0"][WSs]
[endif]

;PLの行動------------------------------------------------------------------------
#
鈴耶の攻撃[r]
[call storage="PL_battle.ks"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
#
すらいむを倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_attack"]
[else]
[jump target="*youkai_escape" cond="f.Round > 3"]
[jump target="*youkai_sexhara"]
[endif]

*youkai_attack
#
すらいむの「粘液」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.target = (f.SPD - f.en_DEX) * 5 + 50"]
[TESTER]
[if exp="f.target > f.rand"]
#
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[else]
鈴耶の敏捷が3減少[p]
[eval exp="f.SPD = f.SPD - 2"][DAMED]
[endif]
[jump target="*youkai"][s]

*youkai_sexhara
#
すらいむの「まとわりつく」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.target = (f.SPD - f.en_DEX) * 5 + 20"]
[TESTER]
[if exp="f.target > f.rand"]
#
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[else]
すらいむは鈴耶にまとわりついた[p]
すらいむは鈴耶の尻穴に潜り込んだ[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.ANAL / 100 "]
[getMathRound var="tf.tmp"]
#
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][SKEBE][WSs]
[endif]
[if exp="f.ERO >= 1000 "]
;鈴耶は絶頂した[p]
[orgasm]
すらいむは絶頂した鈴耶から離れると[r]
地面に吸い込まれるように消えた[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]
[jump target="*youkai"][s]

*youkai_escape
#
すらいむは地面に吸い込まれるように消えた[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]

;------------------------------------------------------------------------------

*Round_end
#
[if exp="f.HP < 1"][return][endif]
[jump target="*start"]
[s]
