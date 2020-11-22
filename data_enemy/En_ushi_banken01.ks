*start
;ラウンド開始時処理--------------------------------------------------------------
[call storage="routin_battle_round.ks" target="*battle_round_start"]


;PLの行動------------------------------------------------------------------------
#
鈴耶の攻撃[r]
[call storage="PL_battle.ks"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
#
番犬を撃退した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]

;敵の行動------------------------------------------------------------------------
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*enemy_attack1"]
[else]
[jump target="*enemy_attack2"]
[endif]

;敵の攻撃------------------------------------------------------------------------
*enemy_attack1
#
番犬の「牙」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 0"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[else]
[eval exp="tf.arg = f.EN_STR * 5 * f.GRD"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][DAMED][WSs]
[endif]
[jump target="*Round_end"][s]

*enemy_attack2
#
番犬の「遠吠え」[p]
周囲の警戒度が上昇した[p]
[eval exp="f.warning += 20"]
[jump target="*Round_end"][s]

;------------------------------------------------------------------------------

*Round_end
#
[if exp="f.HP < 1"][return][endif]
[if exp="f.Quest_type == 3"][call storage="routin_progress.ks" target="*guard"][endif]
[call storage="routin_battle_round.ks" target="*battle_round_end"]
[jump target="*start"]
[s]
