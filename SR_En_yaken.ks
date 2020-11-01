*start
;ラウンド開始時処理--------------------------------------------------------------
[eval exp="f.Round += 1"]
[eval exp="f.GRD = 1 , f.AVD =  0" ]
[eval exp="f.ambush = 0" cond="f.Round >= 2"]
[eval exp="f.BUFF_ATP = 1 + f.ambush"]

[if exp="f.En_Raptured_time == 1"]
#
敵は房中術の影響から脱した
[endif]
[eval exp="f.En_Raptured_time -= 1 " cond="f.En_Raptured > 0"]

[if exp="f.En_Wiseman_time == 1"]
#
敵は虚脱状態から回復した
[endif]
[eval exp="f.En_Wiseman_time -= 1 " cond="f.En_Wiseman > 0"]

;PLの行動------------------------------------------------------------------------
#
鈴耶の攻撃[r]
[call storage="SR_PL_battle.ks" target="*start"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
#
野犬を撃退した[p]
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

*enemy_attack1
#
野犬の攻撃[r]
「爪」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 10 + f.AVD"]
[eval exp="f.hit = f.hit + (f.En_Raptured * 5)"]
[TESTER]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
[eval exp="tf.arg = 50 * f.GRD"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][MP1][WSs]
[endif]
[if exp="f.HP < 1"][return][endif]
[jump target="*start"][s]

*enemy_attack2
#
野犬の攻撃[r]
「牙」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50 + f.AVD"]
[eval exp="f.hit = f.hit + (f.En_Raptured * 5)"]
[TESTER]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
[eval exp="tf.arg = 50 * f.GRD"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][MP1][WSs]
[endif]
[if exp="f.HP < 1"][return][endif]
[jump target="*start"][s]
