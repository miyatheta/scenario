*youkai
#
鈴耶の攻撃[r]
[call storage="PL_battle.ks" target="*start"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
#
ひとだまを倒した[p]
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
ひとだまの攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
#
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
鈴耶の精神力が2減少[p]
[eval exp="f.POW = f.POW - 2"]
[endif]
[if exp="f.HP < 1"][return][endif]
[jump target="*youkai"][s]

*youkai_sexhara
#
ひとだまは鈴耶に取りついた[p]
ひとだまは鈴耶の胸に吸い付いた[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 50 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.BUST / 100 "]
[getMathRound var="tf.tmp"]
#
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0][WSs]
[if exp="f.ERO >= 1000 "]
鈴耶は絶頂した[p]
鈴耶の理性が１減少した[p]
[orgasm]
ひとだまは絶頂した鈴耶から離れると[r]
空に溶けるように消えた[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]
[jump target="*youkai"][s]

*youkai_escape
#
ひとだまは虚空に溶けるように消えた[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
