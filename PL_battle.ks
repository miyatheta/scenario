*start
#
[if exp="f.enchant == 1 "]
退魔の術の効力が切れた
[endif]
[eval exp="f.enchant -= 1 " cond="f.enchant > 0"]

[if exp="f.invincible == 1 "]
空蝉の術の効力が切れた
[endif]
[eval exp="f.invincible -= 1 " cond="f.invincible > 0"]

;-------------------------------------------------------------------------------

*PL_battle_select
[glink color="black" target="*PL_attack_select" x="450" y="100" width="" height="" text="攻撃" ]
[glink color="black" target="*PL_magic_select" x="450" y="200" width="" height="" text="忍術" ]
[glink color="black" target="*PL_skill_select" x="450" y="300" width="" height="" text="スキル" ]
;[glink color="black" target="*PL_item_select" x="450" y="300" width="" height="" text="道具" ]
[glink color="black" target="*PL_escape_select" x="450" y="400" width="" height="" text="逃走" ]
[s]

*PL_skill_select
[glink color="black" target="*PL_battle_select" x="450" y="100" width="" height="" text="戻　る" ]
[glink color="blue" target="*PL_skill_01" x="450" y="300" width="" height="" text="誘惑の術" cond="f.MP >= 10"]
[glink color="blue" target="*PL_skill_02" x="450" y="400" width="" height="" text="退魔の術" cond="f.MP >= 10"]
[glink color="blue" target="*PL_skill_03" x="450" y="500" width="" height="" text="代わり身の術" cond="f.MP >= 10"]
[s]

*PL_attack_select
[glink color="black" target="*PL_battle_select" x="450" y="100" width="" height="" text="戻　る" ]
[glink color="green" target="*PL_attack_00" x="450" y="200" width="" height="" text="防　御" cond="f.MND >= 0 && f.MND <= 1 "]
[glink color="green" target="*PL_attack_01" x="450" y="300" width="" height="" text="牽　制" cond="f.MND >= 0 && f.MND <= 4 "]
[glink color="blue"  target="*PL_attack_02" x="450" y="400" width="" height="" text="格　闘" cond="f.MND >= 0 "]
[glink color="blue"  target="*PL_attack_03" x="750" y="200" width="" height="" text="斬　撃" cond="f.MND >= 2 "]
[glink color="blue"  target="*PL_attack_04" x="750" y="300" width="" height="" text="スタン" cond="f.MND >= 3 "]
[glink color="blue"  target="*PL_attack_05" x="750" y="400" width="" height="" text="貫　通" cond="f.MND >= 3 "]
[glink color="red"   target="*PL_attack_06" x="750" y="500" width="" height="" text="必　殺" cond="f.MND >= 5 "]
[s]

*PL_magic_select
[glink color="black" target="*PL_battle_select" x="450" y="100" width="" height="" text="戻　る" ]
[glink color="blue" target="*PL_magic_01" x="450" y="200" width="" height="" text="退魔攻撃弱" cond="f.MP >= 20"]
[glink color="blue" target="*PL_magic_02" x="750" y="200" width="" height="" text="退魔攻撃強" cond="f.MP >= 50"]
[glink color="blue" target="*PL_magic_03" x="450" y="400" width="" height="" text="魔法弱" cond="f.MP >= 10"]
[glink color="blue" target="*PL_magic_04" x="750" y="400" width="" height="" text="魔法中" cond="f.MP >= 40"]
[glink color="blue" target="*PL_magic_05" x="450" y="500" width="" height="" text="魔法強" cond="f.MP >= 70"]
[glink color="blue" target="*PL_magic_06" x="750" y="500" width="" height="" text="魔法強" cond="f.MP >= 100"]

[s]

;PLのスキル（未実装）----------------------------------------------------------------------
*PL_skill_01
鈴耶の魅了[r]
敵はムラムラした[p]
鈴耶の穢れが上昇[p]
[eval exp="f.charm = 1 , f.AVD = -100"]
[eval exp="f.CURSE += 20"]
[eval exp="f.MP -= 10"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[jump target="*PL_battle_select"]
[s]

*PL_skill_02
鈴耶の退魔の術[r]
妖怪へのダメージが増加（３ターン、50%）[p]
鈴耶の腕力が低下（クエスト中）[p]
[eval exp="f.enchant = 3 "]
[eval exp="f.MP -=10"][eval exp="f.MP = 0" cond="f.MP < 0"]
[eval exp="f.STR -= 3"][eval exp="f.STR = 0" cond="f.STR < 0"]
[WSs]
[jump target="*PL_battle_select"]
[s]

*PL_skill_03
鈴耶の代わり身の術[r]
ダメージ、拘束を１回だけ無効化（２ターン）[p]
発動時、鈴耶は衣服を１枚失う[p]
[eval exp="f.MP -= 10"][eval exp="f.MP = 0" cond="f.MP < 0"]
[eval exp="f.invincible = 2 "]
[WSs]
[jump target="*PL_battle_select"]
[s]

;-------------------------------------------------------------------------------

*PL_attack_00
鈴耶は守りを固めた(防御上昇、集中＋1)[p]
[eval exp="f.GRD = 0.5 , f.AVD = -100 , f.MND += 1"][WSs]
[return]

*PL_attack_01
[eval exp="f.DTR = 0.5 , f.AVD = 30 , f.MND += 1"]
[getrand min="1" max="10" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶は牽制にくないを投じた[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[WSs]
[return]

*PL_attack_02
[eval exp="f.DTR = 1"]
[getrand min="1" max="20" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶の蹴り[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[WSs]
[return]

*PL_attack_03
[eval exp="f.DTR = 2"]
[getrand min="1" max="20" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶の斬撃[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[eval exp="f.MND -= 1"]
[WSs]
[return]

*PL_attack_04
[eval exp="f.DTR = 3"]
[getrand min="1" max="20" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶のスタン攻撃[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[eval exp="f.MND -= 2"]
[WSs]
[return]

*PL_attack_05
[eval exp="f.DTR = 3"]
[getrand min="1" max="20" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶の貫通攻撃[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[eval exp="f.MND -= 2"]
[WSs]
[return]

*PL_attack_06
[eval exp="f.DTR = 5.5"]
[getrand min="1" max="20" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶の雷電掌[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[eval exp="f.MND = 0"][eval exp="f.MND = 0" cond="f.MND < 0"]
[WSs]
[return]

;-------------------------------------------------------------------------------

*PL_magic_01
[getrand min="10" max="20" var="f.rand"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.argment = (f.MGP * 2 * 2) + f.rand"]
[eval exp="tf.argment = tf.argment / 2 " cond="f.type==1"]
[getMathRound var="tf.DMG"]
鈴耶の九字斬り(退魔攻撃弱)[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"]
[eval exp="f.MP -= 20"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_02
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.argment = (f.MGP * 5 * 2) + f.rand"]
[eval exp="tf.argment = tf.argment / 2" cond="f.type==1"]
[getMathRound var="tf.DMG"]
鈴耶の大凶祓い(退魔攻撃強)[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"]
[eval exp="f.MP -= 50"]
[eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_03
鈴耶の魅了(魔法弱)[r]
[if exp="f.En_Wiseman > 0"]
射精したばかりの敵には効果がなかった[p]
[else]
敵はムラムラした[p]
;敵に拘束を誘発させる
[eval exp="f.charm = 1 , f.AVD = -100"]
[eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[endif]
[return]

*PL_magic_04
[getrand min="10" max="20" var="f.rand"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.argment = (f.MGP * 3 * 2) + f.rand"]
[getMathRound var="tf.DMG"]
鈴耶の真空波(魔法中)[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"]
[eval exp="f.MP -= 40"]
[eval exp="f.MND = 0" cond="f.MND < 0"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_05
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.RATE = 4"]
[eval exp="f.RATE = 4.5" cond="f.HP <= 1500 && f.HP > 1000"]
[eval exp="f.RATE = 5" cond="f.HP <= 1000 && f.HP > 600"]
[eval exp="f.RATE = 6" cond="f.HP <= 600 && f.HP > 300"]
[eval exp="f.RATE = 9" cond="f.HP <= 300 && f.HP > 0"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.argment = (f.MGP * f.RATE * 2) + f.rand"]
[getMathRound var="tf.DMG"]
餓狼の舞(魔法強)体力が少ないほど威力アップ[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"]
[eval exp="f.MP -= 70"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_06
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.RATE = 3"]
[eval exp="f.RATE = 4" cond="f.CURSE >= 100"]
[eval exp="f.RATE = 7" cond="f.CURSE >= 200"]
[eval exp="f.RATE = 11" cond="f.CURSE >= 300"]
[eval exp="f.RATE = 16" cond="f.CURSE >= 400"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.argment = (f.MGP * f.RATE * 2) + f.rand"]
[getMathRound var="tf.DMG"]
天鼠の舞(魔法強)穢れが多いほど威力アップ[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"]
[eval exp="f.MP -= 100"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]
;-------------------------------------------------------------------------------
*PL_item_select
#
未実装機能です[p]
[jump target="*PL_battle_select"]
;ここでジャンプすると戻れない
[s]
;-------------------------------------------------------------------------------
*PL_escape_select
#
[eval exp="f.escape = 0"]

[if exp="f.cantescape >= 1"]
この状態から逃げることは出来ない（逃走不能）[p]
[jump target="*PL_battle_select"]
[endif]

[if exp="f.unescape >= 1"]
今は逃走できない！！（逃走封印）[p]
[jump target="*PL_battle_select"]
[endif]

鈴耶は敵から逃れようと試みた[p]
[getrand min="0" max="100" var="f.rand"]
[eval exp="f.target = f.SPD * 3 - f.Lv"]
目標値：[emb exp="f.target"] > 判定値：[emb exp="f.rand"]？[p]
・・・・・・・・・・・・・・・[p]
[if exp="f.target > f.rand"]
[eval exp="f.escape = 1"]
[return]
[else]
しかし、失敗した！！[p]
[eval exp="f.Lv = f.Lv - f.MOVE"]
[return]
[endif]

[return]
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
