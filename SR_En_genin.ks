*start
;ラウンド開始時処理--------------------------------------------------------------
[eval exp="f.Round += 1"]
[eval exp="f.GRD = 1 , f.AVD =  0" ]
[eval exp="f.BUFF_ATP = 1 + f.ambush" cond="f.Round < 2"]

[if exp="f.En_Raptured_time == 1"]
敵は房中術の影響から脱した
[endif]
[eval exp="f.En_Raptured_time -= 1 " cond="f.En_Raptured > 0"]

[if exp="f.En_Wiseman_time == 1"]
敵は虚脱状態から回復した
[endif]
[eval exp="f.En_Wiseman_time -= 1 " cond="f.En_Wiseman > 0"]

;PLの行動------------------------------------------------------------------------
鈴耶の攻撃[r]
[call storage="SR_PL_battle.ks" target="*start"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
忍者を撃退した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]

;敵の行動------------------------------------------------------------------------
[jump target="*enemy_sexhara" cond="f.charm > 0"]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 80"]
[jump target="*enemy_attack"]
[else]
[jump target="*enemy_sexhara"]
[endif]

*enemy_attack
忍者の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50 + f.AVD"]
[eval exp="f.hit = f.hit - (f.En_Raptured * 5)"]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
[eval exp="tf.arg = 200 * f.GRD"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][MP1][WSs]
[endif]
[if exp="f.HP < 1"][return][endif]
[jump target="*start"][s]

*enemy_sexhara
[eval exp="f.charm = 0"]
忍者の組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 40 + f.AVD"]
[if exp="f.hit > f.rand"]
鈴耶は敵の組付きを回避した[p][MND1]
[jump target="*start"][s]
[endif]
鈴耶は忍者に組み付かれた[p]
忍者は鈴耶の女陰をまさぐった[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.VGNA / 100 "]
[getMathRound var="tf.tmp"]
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0][WSs]
[if exp="f.ERO >= 1000 "]
鈴耶は絶頂した[p]
鈴耶の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[eval exp="f.MND = 0"][WSs]
[endif]
[jump target="*start"][s]
