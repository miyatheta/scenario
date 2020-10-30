*start
[eval exp="f.Round += 1"]
[eval exp="f.GRD = 1 , f.AVD =  0" ]
[eval exp="f.BUFF_ATP = 1 + f.ambush" cond="f.Round < 2"]
;-------------------------------------------------------------------------------

*PL_battle_select
[glink color="black" target="*PL_attack_select" x="450" y="100" width="" height="" text="攻撃" ]
[glink color="black" target="*PL_magic_select" x="450" y="200" width="" height="" text="忍術" ]
[glink color="black" target="*PL_item_select" x="450" y="300" width="" height="" text="道具" ]
[glink color="black" target="*PL_escape_select" x="450" y="400" width="" height="" text="逃走" ]
[s]

*PL_attack_select
[glink color="black" target="*PL_battle_select" x="450" y="100" width="" height="" text="戻　る" ]
[glink color="black" target="*PL_attack_00" x="450" y="200" width="" height="" text="防　御" cond="f.MND <= 2"]
[glink color="black" target="*PL_attack_01" x="450" y="300" width="" height="" text="回避上昇" cond="f.MND <= 3"]
[glink color="black" target="*PL_attack_02" x="450" y="400" width="" height="" text="物理通常" cond="f.MND < 3"]
[glink color="black" target="*PL_attack_03" x="450" y="400" width="" height="" text="物理強打" cond="f.MND >= 3" ]
[glink color="black" target="*PL_attack_04" x="450" y="500" width="" height="" text="回避減少" cond="f.MND >= 3"]
[glink color="black" target="*PL_attack_05" x="450" y="600" width="" height="" text="集中消費" cond="f.MND >= 4"]
[s]

*PL_magic_select
[glink color="black" target="*PL_battle_select" x="450" y="100" width="" height="" text="戻　る" ]
[glink color="black" target="*PL_magic_01" x="450" y="200" width="" height="" text="退魔攻撃弱" cond="f.MP >= 20"]
[glink color="black" target="*PL_magic_02" x="450" y="300" width="" height="" text="退魔攻撃強" cond="f.MND >= 4 && f.MP >= 30"]
[glink color="black" target="*PL_magic_03" x="450" y="400" width="" height="" text="魔法弱" cond="f.MP >= 10"]
[glink color="black" target="*PL_magic_04" x="450" y="500" width="" height="" text="魔法中" cond="f.MND >= 4 && f.MP >= 30"]
[glink color="black" target="*PL_magic_05" x="450" y="600" width="" height="" text="魔法必殺" cond="f.MND >= 5 && f.MP >= 50"]
[s]

*PL_attack_00
鈴猫は守りを固めた(防御上昇)[r]
[eval exp="f.MP += 5 , f.GRD = 0.5 , f.AVD = -100"]
[return]

*PL_attack_01
[eval exp="f.AVD = 50"]
[getrand min="1" max="10" var="f.rand"]
[eval exp="tf.arg = 10 + f.rand "]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==2"][getMathRound var="tf.ATP"]
鈴猫は牽制にくないを投じた(回避上昇)[r]
回避の成功確率が上昇[p]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[WSs]
[return]

*PL_attack_02
[eval exp="f.AVD = 50"]
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.arg = f.STR + f.rand "]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==2"][getMathRound var="tf.ATP"]
鈴猫の拳[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[WSs]
[return]

*PL_attack_03
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.arg = (f.STR * 1.5) + f.rand"]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==2"][getMathRound var="tf.ATP"]
鈴猫の蹴り(物理強打)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[WSs]
[return]

*PL_attack_04
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.arg = (f.STR * 2.5)  + f.rand"]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==2"][getMathRound var="tf.ATP"]
鈴猫の飛び蹴り(回避減少)[r]
[emb exp="tf.ATP"]のダメージ[p]
回避の成功確率が低下[p]
[eval exp="f.AVD = -30"]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[WSs]
[return]

*PL_attack_05
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.arg = (f.STR * 4) + f.rand"]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==2"][getMathRound var="tf.ATP"]
鈴猫の絶影(物理集中消費)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[eval exp="f.MND -= 2"][eval exp="f.MND = 0" cond="f.MND < 0"]
[WSs]
[return]

;-------------------------------------------------------------------------------

*PL_magic_01
[getrand min="10" max="20" var="f.rand"]
[eval exp="tf.arg = (f.POW * 2 * 2) + f.rand"]
[eval exp="tf.arg = tf.arg / 2 " cond="f.type==1"][getMathRound var="tf.ATP"]
鈴猫の斬穢(退魔攻撃弱)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[eval exp="f.MP -= 20"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_02
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.arg = (f.POW * 4 * 2) + f.rand"]
[eval exp="tf.arg = tf.arg / 2" cond="f.type==1"][getMathRound var="tf.ATP"]
鈴猫の凶祓(退魔攻撃強)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[eval exp="f.MP -= 30, f.MND = -1"]
[eval exp="f.MND = 0" cond="f.MND < 0"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_03
鈴猫の魅了(魔法弱)[r]
敵はムラムラした[p]
;敵に拘束を誘発させる
[eval exp="f.charm = 1"]
[eval exp="f.MP -= 10"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_04
[getrand min="10" max="20" var="f.rand"]
[eval exp="tf.arg = (f.POW * 3 * 2) + f.rand"][getMathRound var="tf.ATP"]
鈴猫の火遁(魔法中)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[eval exp="f.MP -= 30"]
[eval exp="f.MND = 0" cond="f.MND < 0"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_5
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.RATE = 4"]
[eval exp="f.RATE = 4.5" cond="f.HP <= 1500 && f.HP > 1000"]
[eval exp="f.RATE = 5" cond="f.HP <= 1000 && f.HP > 600"]
[eval exp="f.RATE = 6" cond="f.HP <= 600 && f.HP > 300"]
[eval exp="f.RATE = 9" cond="f.HP <= 300 && f.HP > 100"]
[eval exp="tf.arg = (f.POW * f.RATE * 2) + f.rand"][getMathRound var="tf.ATP"]
鈴猫の螺旋(魔法強)体力が少ないほど威力アップ[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[eval exp="f.MP -= 100"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_6
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.RATE = 3"]
[eval exp="f.RATE = 4" cond="f.CURSE >= 100"]
[eval exp="f.RATE = 7" cond="f.CURSE >= 200"]
[eval exp="f.RATE = 11" cond="f.CURSE >= 300"]
[eval exp="f.RATE = 16" cond="f.CURSE >= 400"]
[eval exp="tf.arg = (f.POW * f.RATE * 2) + f.rand"][getMathRound var="tf.ATP"]
鈴猫の反魂(魔法強)穢れが多いほど威力アップ[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[eval exp="f.MP -= 50"][eval exp="f.MP = 0" cond="f.MP < 0"]
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
[eval exp="f.escape = 1"]
[return]
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
