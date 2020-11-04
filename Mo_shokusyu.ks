*youkai
#
鈴耶の攻撃[r]
[call storage="PL_battle.ks" target="*start"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
#
触手塊を倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_attack"]
[else]
[jump target="*youkai_escape" cond="f.turn > 4"]
[jump target="*youkai_sexhara"]
[endif]

*youkai_attack
#
触手塊の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
#
鈴耶は敵の攻撃を回避した[p][MND1]
[else]
鈴耶のすばやさが５減少[p]
[eval exp="f.SPD = f.SPD - 5"]
[endif]
[if exp="f.HP < 1"][return][endif]
[jump target="*youkai"][s]

*youkai_sexhara
#
触手塊は鈴耶に取りついた[p]
触手塊は鈴耶の胸に吸い付いた[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 200 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.BUST / 100 "]
[getMathRound var="tf.tmp"]
#
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0][WSs]
[if exp="f.ERO >= 1000 "]
鈴耶は絶頂した[p]
[orgasm]
触手塊は絶頂した鈴耶から離れると[r]
茂みへと姿を消した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]
[jump target="*youkai"][s]

*youkai_escape
#
触手塊は茂みへと姿を消した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
