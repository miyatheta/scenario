*mission_start
@layopt layer=message0 visible=true
#鈴耶
それじゃあ、鈴耶[r]
忍務行ってまいりまーす！[p]
[cm]
@layopt layer=message0 visible=false
[chara_hide name="suzune" time=500]
[freeimage layer="base" ]

[wait time=1000]
[bg storage="mori_yoru.jpg" time="500"]
[chara_show name="suzune" left="-70" top="-30"]
[eval exp="f.goal=100 , f.progress=0 , f.Achievement=0, f.security = 0"]

;暫定ステータス
[eval exp="f.MP = f.SAN , f.MND=2"]
[eval exp="f.AVD = 20 , f.type = 1"]
[eval exp="f.ANAL = 100, f.VGNA = 100, f.BUST = 100"]
[WSs]

;-------------------------------------------------------------------------------

*ready
[progressbar]
[glink color="black" target="*goahead" x="400" y="250" width="" height="" text="先へ進む" ]
[glink color="black" target="*menu" x="400" y="350" width="" height="" text="メニュー" ]
[glink color="black" target="*menu" x="400" y="450" width="" height="" text="撤退する" ]
[s]

*menu
[cm]
@layopt layer=message0 visible=true
[current layer="message0"]
#鈴耶
残念！！[r]
そいつは未実装なのさー[p]
[jump target="*goahead"]

*goahead
[cm]
@layopt layer=message0 visible=true
[current layer="message0"]
[eval exp="f.MOVE = f.MOVE"]
[WSs]
[eval exp="f.progress += f.MOVE"]
[if exp="f.progress > f.goal"][eval exp="f.progress = f.goal"]
[endif]
[progressbar]

[if exp="f.progress >= f.goal"]
[jump target=*goal]

[else]
[jump target=*select_event]
[endif]

;-------------------------------------------------------------------------------

*select_event
[getrand min="1" max="70" var="f.event"]
[if exp="f.event<10"][jump target=*event_enemy]

[elsif exp="f.event<20"][jump target=*event_youkai]

[elsif exp="f.event<30"][jump target=*event_trouble]

[elsif exp="f.event<40"][jump target=*event_enemy]

[elsif exp="f.event<50"][jump target=*event_youkai]

[elsif exp="f.event<60"][jump target=*event_trouble]

[else][jump target=*event_none]
[endif]

[s]

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
*event_none
[jump target=*select_event]
[s]

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
*PL_battle_select
[eval exp="f.GRD = 1 , f.AVD =  0"]

[glink color="black" target="*PL_attack_00" x="400" y="100" width="" height="" text="防御" cond="f.MND <= 1"]
[glink color="black" target="*PL_attack_01" x="400" y="200" width="" height="" text="回避上昇" cond="f.MND <= 3"]
[glink color="black" target="*PL_attack_02" x="400" y="300" width="" height="" text="確率追撃" ]
[glink color="black" target="*PL_attack_03" x="400" y="400" width="" height="" text="物理通常" ]
[glink color="black" target="*PL_attack_04" x="400" y="500" width="" height="" text="回避減少" cond="f.MND >= 3"]
[glink color="black" target="*PL_attack_05" x="400" y="600" width="" height="" text="物理集中消費" cond="f.MND > 3"]

[glink color="black" target="*PL_attack_06" x="750" y="200" width="" height="" text="退魔攻撃弱" cond="f.MP >= 20"]
[glink color="black" target="*PL_attack_07" x="750" y="300" width="" height="" text="退魔攻撃強" cond="f.MND >= 4 && f.MP >= 30"]
[glink color="black" target="*PL_attack_08" x="750" y="400" width="" height="" text="魔法弱" cond="f.MP >21"]
[glink color="black" target="*PL_attack_09" x="750" y="500" width="" height="" text="魔法中" cond="f.MND >= 4 && f.MP >= 30"]
[glink color="black" target="*PL_attack_10" x="750" y="600" width="" height="" text="魔法必殺" cond="f.MND >= 5 && f.MP >= 50"]
[s]

*PL_attack_00
#
鈴耶は守りを固めた(防御上昇)[r]
[eval exp="f.MP += 5 , f.GRD = 0.5 , f.AVD = -100"]
[return]

*PL_attack_01
#
鈴耶の牽制(回避上昇)[r]
回避の成功確率が上昇[p]
[eval exp="f.AVD = 50"]
[return]

*PL_attack_02
#
[getrand min="1" max="10" var="f.rand"]
[eval exp="tf.ATP = 60 + f.rand "]
[eval exp="tf.ATP = tf.ATP - 50 " cond="f.type==2"]
鈴耶のくない(確率追撃)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[getrand min="f.MND" max="6" var="f.rand"]
[if exp="f.rand > 5"]
[eval exp="tf.ATP = 40"]
[emb exp="tf.ATP"]の追加ダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[endif]
[WSs]
[return]

*PL_attack_03
#
[getrand min="1" max="30" var="f.rand"]
[eval exp="tf.ATP = f.STR + f.rand"]
[eval exp="tf.ATP = tf.ATP - 50 " cond="f.type==2"]
鈴耶の蹴り(物理通常)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[WSs]
[return]

*PL_attack_04
#
[getrand min="30" max="60" var="f.rand"]
[eval exp="tf.ATP = f.STR + f.rand"]
[eval exp="tf.ATP = tf.ATP - 50 " cond="f.type==2"]
鈴耶の回し蹴り(回避減少)[r]
[emb exp="tf.ATP"]のダメージ[p]
回避の成功確率が低下[p]
[eval exp="f.AVD = -30"]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[WSs]
[return]

*PL_attack_05
#
[getrand min="1" max="30" var="f.rand"]
[eval exp="tf.ATP = (f.STR * 2) + f.rand"]
[eval exp="tf.ATP = tf.ATP - 50 " cond="f.type==2"]
鈴耶の絶影(物理集中消費)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[eval exp="f.MND -= 2"][eval exp="f.MND = 0" cond="f.MND < 0"]
[WSs]
[return]

*PL_attack_06
#
[getrand min="10" max="20" var="f.rand"]
[eval exp="tf.ATP = (f.POW * 2) + f.rand"]
[eval exp="tf.ATP = tf.ATP * 0 " cond="f.type==1"]
鈴耶の斬穢(退魔攻撃弱)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[eval exp="f.MP -= 20"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_attack_07
#
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.ATP = (f.POW * 4) + f.rand"]
[eval exp="tf.ATP = tf.ATP * 0 " cond="f.type==1"]
鈴耶の凶祓(退魔攻撃強)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[eval exp="f.MP -= 30, f.MND = -1"]
[eval exp="f.MND = 0" cond="f.MND < 0"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_attack_08
#
鈴耶の魅了(魔法弱)[r]
回避の成功確率が上昇[p]
[eval exp="f.AVD = 50"]
[eval exp="f.MP -= 20"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_attack_09
#
[getrand min="10" max="20" var="f.rand"]
[eval exp="tf.ATP = (f.POW * 3) + f.rand"]
鈴耶の火遁(魔法中)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[eval exp="f.MP -= 30, f.MND -= 1"]
[eval exp="f.MND = 0" cond="f.MND < 0"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]

*PL_attack_10
#
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.ATP = (f.POW * 5) + f.rand"]
鈴耶の螺旋(魔法強)[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[eval exp="f.MP -= 50, f.MND = 0"][eval exp="f.MP = 0" cond="f.MP < 0"]
[WSs]
[return]
;-------------------------------------------------------------------------------
*event_enemy
#
[getrand min="1" max="100" var="f.event"]
[if exp="f.event<50"]
荒くれ者が現れた[p]
[eval exp="f.en_Name = '荒くれ者'"][WriteEnemy]
[eval exp="f.en_DEX = 6, f.en_HP = 105 , f.type = 1"]
[jump target=*enemy_01]

[elsif exp="f.event<60"]
野盗が現れた[p]
[eval exp="f.en_Name = '野盗'"][WriteEnemy]
[eval exp="f.en_DEX=8, f.en_HP = 120 , f.type = 1"]
[jump target=*enemy_02]

[elsif exp="f.event<80"]
落ち武者が現れた[p]
[eval exp="f.en_Name = '落ち武者'"][WriteEnemy]
[eval exp="f.en_DEX=8, f.en_HP = 210 , f.type = 1"]
[jump target=*enemy_03]

[else]
忍者が現れた[p]
[eval exp="f.en_Name = '忍者'"][WriteEnemy]
[eval exp="f.en_DEX=20, f.en_HP = 160 , f.type = 1"]
[jump target=*enemy_04]

[endif]
[s]


;-------------------------------------------------------------------------------
*enemy_01
#
鈴耶の攻撃[r]
[call target="*PL_battle_select"]

[if exp="f.en_HP < 1"]
#
荒くれ者を倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 80"]
[jump target="*enemy_01_attack"]
[else]
[jump target="*enemy_01_sexhara"]
[endif]

*enemy_01_attack
#
荒くれ者の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50 + f.AVD"]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
[eval exp="tf.arg = 100 * f.GRD"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][MND0][MP1][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*enemy_01"][s]

*enemy_01_sexhara
荒くれ者の組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 40 + f.AVD"]
[if exp="f.hit > f.rand"]
鈴耶は敵の組付きを回避した[p][MND1][WSs]
[jump target="*enemy_01"][s]
[endif]
鈴耶は荒くれ者に組み付かれた[p]
荒くれ者は鈴耶の胸に吸い付いた[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.BUST / 100 "]
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
[jump target="*enemy_01"][s]

;-------------------------------------------------------------------------------
*enemy_02
鈴耶の攻撃[r]
[call target="*PL_battle_select"]

[if exp="f.en_HP < 1"]
野盗を倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 80"]
[jump target="*enemy_02_attack"]
[else]
[jump target="*enemy_02_sexhara"]
[endif]

*enemy_02_attack
野盗の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50 + f.AVD"]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
[eval exp="tf.arg = 100 * f.GRD"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][MND0][MP1][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*enemy_02"][s]

*enemy_02_sexhara
野盗の組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 40 + f.AVD"]
[if exp="f.hit > f.rand"]
鈴耶は敵の組付きを回避した[p][MND1][WSs]
[jump target="*enemy_02"][s]
[endif]
鈴耶は野盗に組み付かれた[p]
野盗は鈴耶の尻を撫で回した[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.ANAL / 100 "]
[getMathRound var="tf.tmp"]
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0]
[if exp="f.ERO >= 1000 "]
鈴耶は絶頂した[p]
鈴耶の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[eval exp="f.MND = 0"][WSs]
[endif]
[jump target="*enemy_02"][s]

;-------------------------------------------------------------------------------
*enemy_03
鈴耶の攻撃[r]
[call target="*PL_battle_select"]

[if exp="f.en_HP < 1"]
落ち武者を倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 80"]
[jump target="*enemy_03_attack"]
[else]
[jump target="*enemy_03_sexhara"]
[endif]

*enemy_03_attack
落ち武者の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50 + f.AVD"]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
[eval exp="tf.arg = 200 * f.GRD"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][MND0][MP1][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*enemy_03"][s]

*enemy_03_sexhara
落ち武者の組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 40 + f.AVD"]
[if exp="f.hit > f.rand"]
鈴耶は敵の組付きを回避した[p][MND1][WSs]
[jump target="*enemy_03"][s]
[endif]
鈴耶は荒くれ者に組み付かれた[p]
落ち武者は鈴耶の胸に揉みしだいた[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.BUST / 100 "]
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
[jump target="*enemy_03"][s]

;-------------------------------------------------------------------------------
*enemy_04
鈴耶の攻撃[r]
[call target="*PL_battle_select"]

[if exp="f.en_HP < 1"]
忍者を倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 80"]
[jump target="*enemy_04_attack"]
[else]
[jump target="*enemy_04_sexhara"]
[endif]

*enemy_04_attack
忍者の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50 + f.AVD"]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
[eval exp="tf.arg = 200 * f.GRD"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][MND0][MP1][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*enemy_04"][s]

*enemy_04_sexhara
忍者の組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 40 + f.AVD"]
[if exp="f.hit > f.rand"]
鈴耶は敵の組付きを回避した[p][MND1]
[jump target="*enemy_04"][s]
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
[jump target="*enemy_04"][s]

;-------------------------------------------------------------------------------
*defeat
#鈴耶
そ、そんな・・・[p]
#
鈴耶は気を失った[p]
[s]

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
*event_youkai
#
[getrand min="1" max="100" var="f.event"]
[if exp="f.event<40"]
すらいむが現れた[p]
[eval exp="f.en_Name = 'すらいむ'"][WriteEnemy]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 20"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 135 , f.type = 2"]
[jump target=*youkai_01]

[elsif exp="f.event<60"]
ひとだまが現れた[p]
[eval exp="f.en_Name = 'ひとだま'"][WriteEnemy]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 30"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 105 , f.type = 2"]
[jump target=*youkai_02]

[elsif exp="f.event<80"]
一反木綿が現れた[p]
[eval exp="f.en_Name = '一反もめん'"][WriteEnemy]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 20"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 125 , f.type = 2"]
[jump target=*youkai_03]

[else]
触手塊が現れた[p]
[eval exp="f.en_Name = '触手塊'"][WriteEnemy]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 50"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 200 , f.type = 2"]
[jump target=*youkai_04]
[endif]
[s]

;-------------------------------------------------------------------------------


;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
*event_trouble
[getrand min="1" max="100" var="f.event"]
[if exp="f.event<30"]
[jump target=*trouble_good]
[else]
[jump target=*trouble_bad]
[endif]
[s]

*trouble_good
[getrand min="1" max="100" var="f.event"]
[if exp="f.event<25"]
[jump target=*trouble_good_01]
[elsif exp="f.event<50"]
[jump target=*trouble_good_02]
[elsif exp="f.event<75"]
[jump target=*trouble_good_03]
[else]
[jump target=*trouble_good_04]
[endif]
[s]

*trouble_bad
[getrand min="1" max="70" var="f.event"]
[if exp="f.event<10"]
[jump target=*trouble_bad_01]
[elsif exp="f.event<20"]
[jump target=*trouble_bad_02]
[elsif exp="f.event<30"]
[jump target=*trouble_bad_03]
[elsif exp="f.event<40"]
[jump target=*trouble_bad_04]
[elsif exp="f.event<50"]
[jump target=*trouble_bad_05]
[elsif exp="f.event<60"]
[jump target=*trouble_bad_06]
[else]
[jump target=*trouble_bad_07]
[endif]
[s]

*trouble_good_01
鈴耶の体力が回復した[p]
[eval exp="f.HP += 100" ][eval exp="f.HP = 1000" cond="f.HP > 1000"]
[jump target="*no_goal"][s]

*trouble_good_02
鈴耶の集中力が増加した[p]
[eval exp="f.MND += 1" ][eval exp="f.MND = 5" cond="f.MND > 5"]
[jump target="*no_goal"][s]

*trouble_good_03
鈴耶の気力が増加した[p]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[jump target="*no_goal"][s]

*trouble_good_04
抜け道を発見した[p]
[eval exp="f.progress += 10"][eval exp="f.progress = f.goal" cond="f.progress > f.goal"]
[jump target="*goal" cond="f.progress >= f.goal"]
[jump target="*no_goal"][s]


*trouble_bad_01
鈴耶の体力が減少した[p]
[eval exp="f.HP -= 50"][eval exp="f.HP = 1" cond="f.HP < 1"]
[jump target="*no_goal"][s]

*trouble_bad_02
トラブル4[p]
鈴耶の集中力が減少した[p]
[eval exp="f.MND -= 1" ][eval exp="f.HP = 0" cond="f.MND < 0"]
[jump target="*no_goal"][s]

*trouble_bad_03
トラブル6[p]
鈴耶の気力が減少した[p]
[eval exp="f.MP += 10" ][eval exp="f.MP = 0" cond="f.MP < 0"]
[jump target="*no_goal"][s]

*trouble_bad_04
トラブル8[p]
足場が崩れている[p]
[eval exp="f.progress -= 10"][eval exp="f.progress = 0" cond="f.progress < 0"]
[jump target="*no_goal"][s]

*trouble_bad_05
トラブル9[p]
麻痺状態になった[p]
[jump target="*no_goal"][s]

*trouble_bad_06
トラブル10[p]
毒状態になった[p]
[jump target="*no_goal"][s]

*trouble_bad_07
トラブル11[p]
発情状態になった[p]
[jump target="*no_goal"][s]

;-------------------------------------------------------------------------------
*no_goal
#鈴耶
[chara_mod name="suzune" face="happy" cross="true" ]
[eval exp="f.ERO = f.ERO - f.SAN"]
[eval exp="f.ERO = 0" cond="f.ERO < 1"][WSs]
[eval exp="f.MP += 5" cond="f.MP < 101"]
[chara_mod name="suzune" face="default" cross="false" ]
[jump target="*ready"]
[s]

;-------------------------------------------------------------------------------
*goal
#鈴耶
[chara_mod name="suzune" face="happy" ]
無事到着っと[p]
[eval exp="f.SPD = f.SPD_MAX, f.MOVE = f.MOVE_MAX, f.STR = f.STR_MAX, f.POW = f.POW_MAX "]
[eval exp="f.date += 1"]
[WSs]

*result
[cm][clearfix][freeimage layer=1]
#鈴耶
Homeに戻るよ！[p]
[jump storage="home.ks" target="*home_start"]
[s]
