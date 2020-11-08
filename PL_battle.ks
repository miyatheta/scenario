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
[glink color="black" target="*PL_attack_select" x="450" y="100" width="" height="" text="格闘" ]
[glink color="black" target="*PL_magic_select" x="450" y="200" width="" height="" text="忍術" ]
;[glink color="black" target="*PL_skill_select" x="450" y="300" width="" height="" text="スキル" ]
[glink color="black" target="*PL_item_select" x="450" y="300" width="" height="" text="道具" ]
[glink color="black" target="*PL_escape_select" x="450" y="400" width="" height="" text="逃走" ]
[s]

*PL_skill_select
[glink color="black" target="*PL_battle_select" x="450" y="100" width="" height="" text="戻　る" ]
[glink color="black" target="*PL_skill_01" x="450" y="300" width="" height="" text="誘惑の術" cond="f.MND >= 1"]
[glink color="black" target="*PL_skill_02" x="450" y="400" width="" height="" text="退魔の術" cond="f.MND >= 3"]
[glink color="black" target="*PL_skill_00" x="450" y="500" width="" height="" text="空蝉の術" cond="f.MND >= 4"]
[s]

*PL_attack_select
[glink color="black" target="*PL_battle_select" x="450" y="100" width="" height="" text="戻　る" ]
[glink color="black" target="*PL_attack_00" x="450" y="500" width="" height="" text="防　御" cond="f.MND <= 2"]
[glink color="black" target="*PL_attack_01" x="450" y="200" width="" height="" text="牽　制" cond="f.MND <= 4"]
[glink color="black" target="*PL_attack_02" x="450" y="300" width="" height="" text="打　撃" cond="f.MND < 3"]
[glink color="black" target="*PL_attack_06" x="450" y="400" width="" height="" text="強　打" cond="f.MND > 0 & f.MND < 3"]
[glink color="black" target="*PL_attack_03" x="450" y="300" width="" height="" text="斬　撃" cond="f.MND >= 3"]
[glink color="black" target="*PL_attack_04" x="450" y="400" width="" height="" text="強　斬" cond="f.MND >= 3"]
[glink color="black" target="*PL_attack_05" x="450" y="500" width="" height="" text="渾　身" cond="f.MND >= 5"]
[s]

*PL_magic_select
[glink color="black" target="*PL_battle_select" x="450" y="100" width="" height="" text="戻　る" ]
[glink color="black" target="*PL_magic_01" x="450" y="200" width="" height="" text="退魔攻撃弱" cond="f.MP >= 20"]
[glink color="black" target="*PL_magic_02" x="750" y="200" width="" height="" text="退魔攻撃強" cond="f.MP >= 50"]
[glink color="black" target="*PL_magic_03" x="450" y="400" width="" height="" text="魔法弱" cond="f.MP >= 10"]
[glink color="black" target="*PL_magic_04" x="750" y="400" width="" height="" text="魔法中" cond="f.MP >= 40"]
[glink color="black" target="*PL_magic_05" x="450" y="500" width="" height="" text="魔法強" cond="f.MP >= 70"]
[glink color="black" target="*PL_magic_06" x="750" y="500" width="" height="" text="魔法強" cond="f.MP >= 100"]

[s]

;-------------------------------------------------------------------------------
*PL_skill_01
鈴耶の魅了(魔法弱)[r]
敵はムラムラした[p]
;敵に拘束を誘発させる
[eval exp="f.charm = 1 , f.AVD = -100"]
[eval exp="f.MND -= 1"][eval exp="f.MND = 0" cond="f.MND < 0"]
[WSs]
[jump target="*PL_battle_select"]
[s]

*PL_skill_02
鈴耶の退魔の術[r]
妖怪へのダメージが増加（３ターン、50%）[p]
;敵に拘束を誘発させる
[eval exp="f.enchant = 3 "]
[eval exp="f.MND -= 3"][eval exp="f.MND = 0" cond="f.MND < 0"]
[WSs]
[jump target="*PL_battle_select"]
[s]

*PL_skill_03
鈴耶の空蝉の術[r]
ダメージ、拘束を１回だけ無効化（２ターン）[p]
;敵に拘束を誘発させる
[eval exp="f.invincible = 2 "]
[eval exp="f.MND -= 4"][eval exp="f.MND = 0" cond="f.MND < 0"]
[WSs]
[jump target="*PL_battle_select"]
[s]

;-------------------------------------------------------------------------------

*PL_attack_00
鈴耶は守りを固めた(防御上昇)[p]
[eval exp="f.GRD = 0.5 , f.AVD = -100"][WSs]
[return]

*PL_attack_01
[eval exp="f.AVD = 50"]
[eval exp="f.ATP = f.STR + f.arms_atp + f.acceA_atp + f.acceB_atp"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[getrand min="1" max="10" var="f.rand"]
[eval exp="tf.arg = f.ATP / 2 + f.rand "]
[if exp="f.type==2"]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==2"]
[eval exp="tf.arg = tf.arg + (f.MGP / 2) " cond="f.enchant > 0"]
[eval exp="tf.arg = tf.arg * 3 " cond="f.arms_type==2"]
[endif]
[getMathRound var="tf.DMG"]
鈴耶は牽制にくないを投じた(回避上昇)[r]
回避の成功確率が上昇[p]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[WSs]
[return]

*PL_attack_02
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.ATP = f.STR + f.arms_atp + f.acceA_atp + f.acceB_atp"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.arg = (f.ATP * 1) + f.rand "]
[if exp="f.type==2"]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==2"]
[eval exp="tf.arg = tf.arg + (f.MGP * 1) " cond="f.enchant > 0"]
[eval exp="tf.arg = tf.arg * 3 " cond="f.arms_type==2"]
[endif]
[getMathRound var="tf.DMG"]
鈴耶の蹴り[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[WSs]
[return]

*PL_attack_06
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.ATP = f.STR + f.arms_atp + f.acceA_atp + f.acceB_atp"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.arg = (f.ATP * 1.5)  + f.rand"]
[if exp="f.type==2"]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==2"]
[eval exp="tf.arg = tf.arg + (f.MGP * 1.5) " cond="f.enchant > 0"]
[eval exp="tf.arg = tf.arg * 3 " cond="f.arms_type==2"]
[endif]
[getMathRound var="tf.DMG"]
鈴耶の飛び蹴り(回避減少)[r]
[emb exp="tf.DMG"]のダメージ[p]
回避の成功確率が低下[p]
[eval exp="f.AVD = -30"]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[WSs]
[return]

*PL_attack_03
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.ATP = f.STR + f.arms_atp + f.acceA_atp + f.acceB_atp"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.arg = (f.ATP * 1.5) + f.rand"]
[if exp="f.type==2"]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==2"]
[eval exp="tf.arg = tf.arg + (f.MGP * 1.5) " cond="f.enchant > 0"]
[eval exp="tf.arg = tf.arg * 3 " cond="f.arms_type==2"]
[endif]
[getMathRound var="tf.DMG"]
鈴耶の斬撃(物理強打)[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[WSs]
[return]

*PL_attack_04
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.ATP = f.STR + f.arms_atp + f.acceA_atp + f.acceB_atp"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.arg = (f.ATP * 2.75)  + f.rand"]
[if exp="f.type==2"]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==2"]
[eval exp="tf.arg = tf.arg + (f.MGP * 2.75) " cond="f.enchant > 0"]
[eval exp="tf.arg = tf.arg * 3 " cond="f.arms_type==2"]
[endif]
[getMathRound var="tf.DMG"]
鈴耶の兜割り(回避減少)[r]
[emb exp="tf.DMG"]のダメージ[p]
回避の成功確率が低下[p]
[eval exp="f.AVD = -40"]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[WSs]
[return]

*PL_attack_05
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.ATP = f.STR + f.arms_atp + f.acceA_atp + f.acceB_atp"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.arg = (f.ATP * 5.5) + f.rand"]
[if exp="f.type==2"]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==2"]
[eval exp="tf.arg = tf.arg + (f.MGP * 5.5) " cond="f.enchant > 0"]
[eval exp="tf.arg = tf.arg * 3 " cond="f.arms_type==2"]
[endif]
[getMathRound var="tf.DMG"]
鈴耶の雷電掌(物理集中消費)[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[eval exp="f.MND = 0"][eval exp="f.MND = 0" cond="f.MND < 0"]
[WSs]
[return]

;-------------------------------------------------------------------------------

*PL_magic_01
[getrand min="10" max="20" var="f.rand"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.arg = (f.MGP * 2 * 2) + f.rand"]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==1"]
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
[eval exp="tf.arg = (f.MGP * 5 * 2) + f.rand"]
[eval exp="tf.arg = tf.arg / 2" cond="f.type==1"]
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
敵はムラムラした[p]
;敵に拘束を誘発させる
[eval exp="f.charm = 1 , f.AVD = -100"]
[eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_04
[getrand min="10" max="20" var="f.rand"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.arg = (f.MGP * 3 * 2) + f.rand"]
[getMathRound var="tf.DMG"]
鈴耶の真空波(魔法中)[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"]
[eval exp="f.MP -= 40"]
[eval exp="f.MND = 0" cond="f.MND < 0"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_5
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.RATE = 4"]
[eval exp="f.RATE = 4.5" cond="f.HP <= 1500 && f.HP > 1000"]
[eval exp="f.RATE = 5" cond="f.HP <= 1000 && f.HP > 600"]
[eval exp="f.RATE = 6" cond="f.HP <= 600 && f.HP > 300"]
[eval exp="f.RATE = 9" cond="f.HP <= 300 && f.HP > 0"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.arg = (f.MGP * f.RATE * 2) + f.rand"]
[getMathRound var="tf.DMG"]
餓狼の舞(魔法強)体力が少ないほど威力アップ[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"]
[eval exp="f.MP -= 70"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_6
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.RATE = 3"]
[eval exp="f.RATE = 4" cond="f.CURSE >= 100"]
[eval exp="f.RATE = 7" cond="f.CURSE >= 200"]
[eval exp="f.RATE = 11" cond="f.CURSE >= 300"]
[eval exp="f.RATE = 16" cond="f.CURSE >= 400"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.arg = (f.MGP * f.RATE * 2) + f.rand"]
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
;-------------------------------------------------------------------------------
*PL_escape_select
#
[eval exp="f.escape = 0"]

[if exp="f.unescape >= 100"]
この状態から逃げることは出来ない（逃走不可能）[p]
[jump target="*PL_battle_select"]
[endif]

[if exp="f.unescape >= 1"]
今は逃走できない！！（逃走封印）[p]
[jump target="*PL_comand_select"]
[endif]

鈴耶は敵から逃れようと試みた[p]
[getrand min="0" max="100" var="f.rand"]
[eval exp="f.rand += f.Lv"]
[eval exp="f.hit = f.SPD * 3"]
目標値：[emb exp="f.hit"]>判定値：[emb exp="f.rand"]？[p]
・・・・・・・・・・・・・・・[p]
[if exp="f.hit > f.rand"]
[eval exp="f.escape = 1"]
[return]
[else]
しかし、失敗した！！[p]
[eval exp="f.Lv -= f.MOV"]
[return]
[endif]

[return]
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
