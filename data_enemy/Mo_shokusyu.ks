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
触手塊を倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]

;敵の行動------------------------------------------------------------------------
*enemy_comand_select
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_attack"]
[else]
[jump target="*youkai_escape" cond="f.Round > 4"]
[jump target="*youkai_sexhara"]
[endif]

;敵の攻撃------------------------------------------------------------------------
*youkai_attack
#
触手塊の「粘液」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.target = (f.SPD - f.en_DEX) * 5 + 50"]
[TESTER]
[if exp="f.target > f.rand"]
#
鈴耶は敵の攻撃を回避した[p][AVOID]
[elsif exp="f.invincible > 0"][call storage="macro_invincible.ks"]
[else]
鈴耶の敏捷が１減少[p]
[eval exp="f.SPD = f.SPD - 1"][DAMED]
[endif]
[jump target="*Round_end"][s]

*youkai_sexhara
#
触手塊の「触手」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.target = (f.SPD - f.en_DEX) * 5 + 20"]
[TESTER]
[if exp="f.target > f.rand"]
#
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"][call storage="macro_invincible.ks"]
[else]
触手塊は鈴耶に絡みついた[p]
触手が鈴耶の胸に吸い付く[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.fack = 200 "]
[call storage="routin/Rt_kaikan.ks" target="*BOOB"]
[call storage="asset_extra_reaction.ks" target="*orgasm"]
[call storage="asset_extra_reaction.ks" target="*milk" cond="f.Milk > 0"]
[endif]
[if exp="f.ERO >= 1000 "]
;鈴耶は絶頂した[p]
[orgasm]
触手塊は絶頂した鈴耶から離れると[r]
茂みへと姿を消した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]
[jump target="*Round_end"][s]

*youkai_escape
#
触手塊は茂みへと姿を消した[p]
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
