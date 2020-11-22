*youkai
;ラウンド開始時処理--------------------------------------------------------------
[call storage="routin_battle_round.ks" target="*battle_round_start"]


;PLの行動------------------------------------------------------------------------
#
鈴耶の攻撃[r]
[call storage="PL_battle.ks"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
#
ひとだまを倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]

;敵の行動------------------------------------------------------------------------
*enemy_comand_select
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_attack"]
[else]
[jump target="*youkai_escape" cond="f.Round > 3"]
[jump target="*youkai_sexhara"]
[endif]

;敵の攻撃------------------------------------------------------------------------
*youkai_attack
#
ひとだまの「怪光」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.target = (f.SPD - f.en_DEX) * 5 + 50"]
[TESTER]
[if exp="f.target > f.rand"]
#
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[else]
鈴耶の精神力が2減少[p]
[eval exp="f.POW = f.POW - 2"][DAMED]
[endif]
[jump target="*youkai"][s]

*youkai_sexhara
#
ひとだまの「取り憑く」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.target = (f.SPD - f.en_DEX) * 5 + 20"]
[TESTER]
[if exp="f.target > f.rand"]
#
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[else]
ひとだまは鈴耶に取りついた[p]
ひとだまは鈴耶の胸に吸い付いた[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 50 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.BOOB / 100 "]
[getMathRound var="tf.tmp"]
#
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"]
[SKEBE][WSs]
[call storage="asset_extra_reaction.ks" target="*orgasm"]
[call storage="asset_extra_reaction.ks" target="*milk" cond="f.Milk > 0"]
[endif]
[if exp="f.ERO >= 1000 "]
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

;------------------------------------------------------------------------------

*Round_end
#
[if exp="f.HP < 1"][return][endif]
[call storage="routin_battle_round.ks" target="*battle_round_end"]
[jump target="*start"]
[s]
