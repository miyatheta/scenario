*youkai
#
鈴耶の攻撃[r]
[call storage="PL_battle.ks" target="*start"]
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
[jump target="*youkai_escape" cond="f.turn > 3"]
[jump target="*youkai_sexhara"]
[endif]

*youkai_attack
#
すらいむの攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
#
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
鈴耶のすばやさが3減少[p]
[eval exp="f.SPD = f.SPD - 3"]
[endif]
[if exp="f.HP < 1"][return][endif]
[jump target="*youkai"][s]

*youkai_sexhara
#
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
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0][WSs]
[if exp="f.ERO >= 1000 "]
鈴耶は絶頂した[p]
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
