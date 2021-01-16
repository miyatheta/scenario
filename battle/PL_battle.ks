*start
#
[if exp="f.enchant == 1 "]
退魔の術の効力が切れた
[endif]
[eval exp="f.enchant -= 1 " cond="f.enchant > 0"]

[if exp="f.invincible == 1 "]
変わり身の術の効力が切れた
[endif]
[eval exp="f.invincible -= 1 " cond="f.invincible > 0"]

;-------------------------------------------------------------------------------

*PL_battle_select
[glink color="black" target="*PL_attack_select" x="450" y="100" width="" height="" text="攻撃" ]
[glink color="black" target="*PL_magic_select" x="450" y="200" width="" height="" text="忍術" ]
[glink color="black" target="*PL_skill_select" x="450" y="300" width="" height="" text="スキル" ]
;[glink color="black" target="*PL_item_select" x="450" y="300" width="" height="" text="道具" ]
[glink color="black" target="*PL_escape_select" x="750" y="400" width="" height="" text="逃走" ]
[s]

*PL_skill_select
[iscript]
f.skill_01CTtxt = "魅了の瞳術：" + f.skill_01CT;
f.skill_02CTtxt = "集気法：" + f.skill_02CT;
f.skill_03CTtxt = "変わり身の術" + f.skill_03CT;
[endscript]
[glink color="black" target="*PL_battle_select" x="450" y="100" width="" height="" text="戻　る" ]
[glink color="blue" target="*PL_skill_01" x="450" y="300" width="" height="" text="&f.skill_01CTtxt " ]
[glink color="blue" target="*PL_skill_02" x="450" y="400" width="" height="" text="&f.skill_02CTtxt" ]
[glink color="blue" target="*PL_skill_03" x="450" y="500" width="" height="" text="&f.skill_03CTtxt" ]
[s]

*PL_attack_select
[iscript]
f.yPosition1 = 300 - (f.MND * 100);
f.yPosition2 = 400 - (f.MND * 100);
f.yPosition3 = 500 - (f.MND * 100);
f.yPosition4 = 600 - (f.MND * 100);
f.yPosition5 = 700 - (f.MND * 100);
f.yPosition6 = 800 - (f.MND * 100);
f.yPosition7 = 900 - (f.MND * 100);
[endscript]
[glink color="black" target="*PL_battle_select" x="450" y="100" width="" height="" text="戻　る" ]
[glink color="green" target="*PL_attack_00" x="450" y="&f.yPosition1" width="" height="" text="防　御" cond="f.MND >= 0 && f.MND < 1 "]
[glink color="green" target="*PL_attack_01" x="450" y="&f.yPosition2" width="" height="" text="牽　制" cond="f.MND >= 0 && f.MND <= 2 "]
[glink color="green" target="*PL_attack_02" x="450" y="&f.yPosition3" width="" height="" text="格　闘" cond="f.MND >= 1 && f.MND <= 3 "]
[glink color="blue"  target="*PL_attack_03" x="750" y="&f.yPosition4" width="" height="" text="抜　刀" cond="f.MND >= 2 && f.MND <= 4 "]
[glink color="green" target="*PL_attack_04" x="450" y="&f.yPosition5" width="" height="" text="発　勁" cond="f.MND >= 3 "]
[glink color="blue"  target="*PL_attack_05" x="750" y="&f.yPosition5" width="" height="" text="斬　撃" cond="f.MND >= 3 "]
[glink color="blue"  target="*PL_attack_06" x="750" y="&f.yPosition6" width="" height="" text="刺　突" cond="f.MND >= 4 "]
[glink color="blue"  target="*PL_attack_07" x="750" y="&f.yPosition7" width="" height="" text="必　殺" cond="f.MND >= 5 "]
[s]

*PL_magic_select
[glink color="black" target="*PL_battle_select" x="450" y="100" width="" height="" text="戻　る" ]
[glink color="blue" target="*PL_magic_01" x="450" y="200" width="" height="" text="退魔攻撃弱" cond="f.MP >= 30"]
[glink color="blue" target="*PL_magic_02" x="750" y="200" width="" height="" text="退魔攻撃強" cond="f.MP >= 60"]
;[glink color="blue" target="*PL_magic_03" x="450" y="400" width="" height="" text="魔法弱" cond="f.MP >= 10"]
[glink color="blue" target="*PL_magic_04" x="750" y="400" width="" height="" text="真空波" cond="f.MP >= 50"]
[glink color="blue" target="*PL_magic_05" x="450" y="500" width="" height="" text="魔法強" cond="f.MP >= 75"]
[glink color="blue" target="*PL_magic_06" x="750" y="500" width="" height="" text="魔法強" cond="f.MP >= 100"]

[s]

;PLのスキル----------------------------------------------------------------------
*PL_skill_01
[if exp="f.skill_01CT > 0"]
再使用には[emb exp="f.skill_01CT"]ターン必要です[p]
[jump target="*PL_battle_select"]
[endif]

鈴耶の誘惑[r]
[if exp="f.En_Wiseman > 0"]
射精したばかりの敵には効果がなかった[p]
[else]
敵はムラムラした[p]
鈴耶の淫気が上昇[p]
[eval exp="f.charm = 1 , f.AVD = -100"]
[eval exp="f.CURSE += 20"]
[eval exp="f.skill_01CT = 10"]
[WSs]
[endif]
[jump target="*PL_battle_select"]
[s]

;------------------------------------------------

*PL_skill_02
[if exp="f.MND < 2"]
使用には集中力が２以上必要です[p]
[jump target="*PL_battle_select"]
[endif]

[if exp="f.skill_02CT > 0"]
再使用には[emb exp="f.skill_02CT"]ターン必要です[p]
[jump target="*PL_battle_select"]
[endif]

鈴耶の集気法[r]
集中力を気力に変換[p]
[eval exp="f.MP += 20 "][eval exp="f.MP = 100" cond="f.MP > 100"]
[eval exp="f.MND -= 2"][eval exp="f.MND = 0" cond="f.MND < 0"]
[eval exp="f.skill_02CT = 10"]
[WSs]
[jump target="*PL_battle_select"]
[s]

;------------------------------------------------

*PL_skill_03
[if exp="f.dress != 1"]
脱衣状態では使うことが出来ない！！[p]
[jump target="*PL_battle_select"]
[endif]

[if exp="f.skill_03CT > 0"]
再使用には[emb exp="f.skill_03CT"]ターン必要です[p]
[jump target="*PL_battle_select"]
[endif]

鈴耶の変わり身の術[r]
ダメージ、拘束を１回だけ無効化（２ターン）[p]
発動時、鈴耶は衣服を１枚失う[p]
[eval exp="f.MP -= 10"][eval exp="f.MP = 0" cond="f.MP < 0"]
[eval exp="f.invincible = 2 "]
[eval exp="f.skill_03CT = 10"]
[WSs]
[jump target="*PL_battle_select"]
[s]

;-------------------------------------------------------------------------------

*PL_attack_00
鈴耶は守りを固めた(防御上昇、集中＋1)[p]
[eval exp="f.GRD = 0.5 , f.AVD = -100 , f.MND += 1"][WSs]
[return]

*PL_attack_01
[eval exp="f.DTR = 0.5 , f.AVD = 40"]
[getrand min="1" max="10" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶は牽制にくないを投じた[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[WSs]
[return]

*PL_attack_02
[eval exp="f.DTR = 1 , f.AVD = 10"]
[getrand min="1" max="20" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶の格闘術[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[WSs]
[return]

*PL_attack_03
[eval exp="f.DTR = 2"]
[getrand min="1" max="20" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶の抜刀「霞」[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[WSs]
[return]

*PL_attack_04
[eval exp="f.DTR = 1.5"]
[getrand min="1" max="20" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶の発勁「らせん」[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[eval exp="f.MND -= 2"]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand >= 50"]
[eval exp="f.En_Stan = 1"]
敵は硬直状態になった[p]
[endif]
[WSs]
[return]

*PL_attack_05
;斬撃
[eval exp="f.DTR = 3"]
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.EN_GRD=1"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶の斬撃「朧」[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[eval exp="f.MND -= 3"]
[WSs]
[return]

*PL_attack_06
;刺突
[eval exp="f.DTR = 5.5"]
[getrand min="1" max="20" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶の突き「朔」[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[eval exp="f.MND -= 4"][eval exp="f.MND = 0" cond="f.MND < 0"]
[WSs]
[return]

*PL_attack_07
;必殺
[eval exp="f.DTR = 5.5"]
[getrand min="1" max="20" var="f.rand"]
[STRIKE]
[getMathRound var="tf.DMG"]
鈴耶の必殺「絶影」[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"][ATKED]
[eval exp="f.MND = 0"][eval exp="f.MND = 0" cond="f.MND < 0"]
[WSs]
[return]
;-------------------------------------------------------------------------------

*PL_magic_01
[getrand min="10" max="20" var="f.rand"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.argment = (f.MGP * 2 * 2 * f.EN_GRD) + f.rand"]
[eval exp="tf.argment = tf.argment / 2 " cond="f.type==1"]
[getMathRound var="tf.DMG"]
鈴耶の破魔の拳(退魔攻撃弱)[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"]
[eval exp="f.MP -= 30"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_magic_02
[getrand min="1" max="20" var="f.rand"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.argment = (f.MGP * 5 * 2 * f.EN_GRD) + f.rand"]
[eval exp="tf.argment = tf.argment / 2" cond="f.type==1"]
[getMathRound var="tf.DMG"]
鈴耶の凶祓いの太刀(退魔攻撃強)[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"]
[eval exp="f.MP -= 60"]
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
[eval exp="tf.argment = (f.MGP * 3 * 2 * f.EN_GRD) + f.rand"]
[getMathRound var="tf.DMG"]
鈴耶の鎌鼬(魔法中)[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"]
[eval exp="f.MP -= 50"]
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
[eval exp="tf.argment = (f.MGP * f.RATE * 2 * f.EN_GRD) + f.rand"]
[getMathRound var="tf.DMG"]
返魂の術(魔法強)体力が少ないほど威力アップ[r]
[emb exp="tf.DMG"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.DMG"]
[eval exp="f.MP -= 75"][eval exp="f.MP = 0" cond="f.MP < 0"]
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
[eval exp="tf.argment = (f.MGP * f.RATE * 2 * f.EN_GRD) + f.rand"]
[getMathRound var="tf.DMG"]
天鼠の舞(魔法強)淫気が多いほど威力アップ[r]
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
