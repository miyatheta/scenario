*start
;ラウンド開始時処理--------------------------------------------------------------
[call storage="battle/Rt_battle_round.ks" target="*battle_round_start"]

;PLの行動------------------------------------------------------------------------
#
鈴猫の攻撃[r]
[call storage="battle/PL_battle.ks"]
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
鈴猫は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"]
[call storage="battle/Rt_invincible.ks"]
[else]
鈴猫の敏捷が3減少[p]
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
鈴猫は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"]
[call storage="battle/Rt_invincible.ks"]
[else]
すらいむは鈴猫にまとわりついた[p]
すらいむは鈴猫の尻穴に潜り込んだ[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.fuck = 100 "]
[call storage="bochu/Rt_kaikan.ks" target="*ANAL"]
;絶頂判定
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
[endif]
[if exp="f.ERO >= 1000 "]
;鈴猫は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
すらいむは絶頂した鈴猫から離れると[r]
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
;ラウンド終了[p]
[if exp="f.HP < 1"][return][endif]
[call storage="battle/Rt_battle_round.ks" target="*battle_round_end"]
[if exp="f.Quest_type == 4"][call storage="routin/Rt_progress.ks" target="*trace"][endif]

[jump target="*start"]
[s]
