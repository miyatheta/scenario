*start
;ラウンド開始時処理--------------------------------------------------------------
[call storage="routin/Rt_battle_round.ks" target="*battle_round_start"]

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
すらいむの「粘液」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.target = (f.SPD - f.en_DEX) * 5 + 50"]
[TESTER]
[if exp="f.target > f.rand"]
#
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"]
[call storage="macro_invincible.ks"]
[else]
鈴耶の敏捷が3減少[p]
[eval exp="f.SPD = f.SPD - 2"][DAMED]
[endif]
[jump target="*Round_end"][s]

*youkai_sexhara
#
すらいむの「まとわりつく」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.target = (f.SPD - f.en_DEX) * 5 + 20"]
[TESTER]
[if exp="f.target > f.rand"]
#
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"]
[call storage="macro_invincible.ks"]
[else]
すらいむは鈴耶にまとわりついた[p]
すらいむは鈴耶の尻穴に潜り込んだ[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[call storage="routin/Rt_kaikan.ks" target="*ANAL"]
[endif]
[if exp="f.ERO >= 1000 "]
;鈴耶は絶頂した[p]
[call storage="macro_orgasm.ks"]
すらいむは絶頂した鈴耶から離れると[r]
地面に吸い込まれるように消えた[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]
[jump target="*Round_end"][s]

*youkai_escape
#
すらいむは地面に吸い込まれるように消えた[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]

;------------------------------------------------------------------------------

*Round_end
#
ラウンド終了[p]
[if exp="f.HP < 1"][return][endif]
[call storage="routin/Rt_battle_round.ks" target="*battle_round_end"]
[if exp="f.Quest_type == 4"][call storage="routin/Rt_progress.ks" target="*trace"][endif]

[jump target="*start"]
[s]
