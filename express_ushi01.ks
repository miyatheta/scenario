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
[eval exp="f.goal=100 , f.progress=0 , f.Achievement=0"]

;暫定ステータス
[eval exp="f.MP = f.SAN , f.MND=2"]
[eval exp="f.AVD = 20 , f.type = 1"]
[eval exp="f.poison=0, f.slowly=0, f.excite=0"]
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
@layopt layer=message1 visible=true
[current layer="message1"]
#鈴耶
残念！！[r]
そいつは未実装なのさー[p]
[jump target="*goahead"]

*goahead
[cm]
@layopt layer=message1 visible=true
[current layer="message1"]
[eval exp="f.ahead = f.MOVE"]
[eval exp="f.ahead -= 3 " cond="f.slowly > 0"]
[WriteAhead]
[eval exp="f.progress += f.ahead"]
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
*event_none
[jump target=*select_event]
[s]

;-------------------------------------------------------------------------------

*event_enemy
[eval exp="f.En_Raptured = 0 , f.En_Wiseman_time = 0"]

[getrand min="1" max="100" var="f.event"]
[if exp="f.event<50"]
荒くれ者が現れた[p]
[eval exp="f.en_Name = '荒くれ者'"][WriteEnemy]
[eval exp="f.en_DEX = 6, f.GRB=80, f.en_HP = 120 , f.type = 1, f.Round = 0"]
[call storage="SR_En_arakure.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<60"]
野盗が現れた[p]
[eval exp="f.en_Name = '野盗'"][WriteEnemy]
[eval exp="f.en_DEX=8, f.GRB=90, f.en_HP = 160 , f.type = 1, f.Round = 0"]
[call storage="SR_En_yatou.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<80"]
落ち武者が現れた[p]
[eval exp="f.en_Name = '落ち武者'"][WriteEnemy]
[eval exp="f.en_DEX=8, f.GRB=110, f.en_HP = 250 , f.type = 1, f.Round = 0"]
[call storage="SR_EN_otimusha.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[else]
忍者が現れた[p]
[eval exp="f.en_Name = '忍者'"][WriteEnemy]
[eval exp="f.en_DEX=20, f.GRB=100, f.en_HP = 190 , f.type = 1, f.Round = 0"]
[call storage="SR_EN_genin.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[endif]
[s]


;-------------------------------------------------------------------------------


;-------------------------------------------------------------------------------


;-------------------------------------------------------------------------------


;-------------------------------------------------------------------------------


;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
*event_youkai
#
[getrand min="1" max="135" var="f.event"]
[if exp="f.event<40"]
すらいむが現れた[p]
[eval exp="f.en_Name = 'すらいむ'"][WriteEnemy]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 20"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 135 , f.type = 2, f.Round = 0"]
[jump target=*youkai_01]

[elsif exp="f.event<60"]
ひとだまが現れた[p]
[eval exp="f.en_Name = 'ひとだま'"][WriteEnemy]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 30"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 105 , f.type = 2, f.Round = 0"]
[jump target=*youkai_02]

[elsif exp="f.event<80"]
一反木綿が現れた[p]
[eval exp="f.en_Name = '一反もめん'"][WriteEnemy]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 20"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 135 , f.type = 2, f.Round = 0"]
[jump target=*youkai_03]

[else]
触手塊が現れた[p]
[eval exp="f.en_Name = '触手塊'"][WriteEnemy]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 50"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 200 , f.type = 2, f.Round = 0"]
[jump target=*youkai_04]
[endif]
[s]

;-------------------------------------------------------------------------------
*youkai_01
鈴耶の攻撃[r]
[call storage="SR_PL_battle.ks" target="*start"]
[jump target="*escape" cond="f.escape > 0"]

[if exp="f.en_HP < 1"]
すらいむを倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*battle_end"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_01_attack"]
[else]
[jump target="*youkai_01_escape" cond="f.turn > 3"]
[jump target="*youkai_01_sexhara"]
[endif]

*youkai_01_attack
すらいむの攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
鈴耶のすばやさが3減少[p]
[eval exp="f.SPD = f.SPD - 3"]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*youkai_01"][s]

*youkai_01_sexhara
すらいむは鈴耶にまとわりついた[p]
すらいむは鈴耶の尻穴に潜り込んだ[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.ANAL / 100 "]
[getMathRound var="tf.tmp"]
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0][WSs]
[if exp="f.ERO >= 1000 "]
鈴耶は絶頂した[p]
鈴耶の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[eval exp="f.MND = 0"][WSs]
すらいむは絶頂した鈴耶から離れると[r]
地面に吸い込まれるように消えた[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
[endif]
[jump target="*youkai_01"][s]

*youkai_01_escape
すらいむは地面に吸い込まれるように消えた[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
;-------------------------------------------------------------------------------
*youkai_02
鈴耶の攻撃[r]
[call storage="SR_PL_battle.ks" target="*start"]
[jump target="*escape" cond="f.escape > 0"]

[if exp="f.en_HP < 1"]
ひとだまを倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*battle_end"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_02_attack"]
[else]
[jump target="*youkai_02_escape" cond="f.turn > 3"]
[jump target="*youkai_02_sexhara"]
[endif]

*youkai_02_attack
ひとだまの攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
鈴耶の精神力が１減少[p]
[eval exp="f.POW = f.POW - 1"]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*youkai_02"][s]

*youkai_02_sexhara
ひとだまは鈴耶に取りついた[p]
ひとだまは鈴耶の胸に吸い付いた[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 50 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.BOOB / 100 "]
[getMathRound var="tf.tmp"]
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0][WSs]
[if exp="f.ERO >= 1000 "]
鈴耶は絶頂した[p]
鈴耶の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[eval exp="f.MND = 0"][WSs]
ひとだまは絶頂した鈴耶から離れると[r]
空に溶けるように消えた[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
[endif]
[jump target="*youkai_02"][s]

*youkai_02_escape
ひとだまは虚空に溶けるように消えた[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
;-------------------------------------------------------------------------------
*youkai_03
鈴耶の攻撃[r]
[call storage="SR_PL_battle.ks" target="*start"]
[jump target="*escape" cond="f.escape > 0"]

[if exp="f.en_HP < 1"]
一反もめんを倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*battle_end"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_03_attack"]
[else]
[jump target="*youkai_03_escape" cond="f.turn > 3"]
[jump target="*youkai_03_sexhara"]
[endif]

*youkai_03_attack
一反もめんの攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
鈴耶の腕力が１減少[p]
[eval exp="f.STR = f.STR - 1"]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*youkai_03"][s]

*youkai_03_sexhara
一反もめんは鈴耶を縛り上げた[p]
一反もめんが鈴耶の股間に食い込む[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 50 "]
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
一反もめんは絶頂した鈴耶から離れると[r]
空へ舞い上がり姿を消した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
[endif]
[jump target="*youkai_03"][s]

*youkai_03_escape
一反もめんは空へ舞い上がり姿を消した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
;-------------------------------------------------------------------------------
*youkai_04
鈴耶の攻撃[r]
[call storage="SR_PL_battle.ks" target="*start"]
[jump target="*escape" cond="f.escape > 0"]

[if exp="f.en_HP < 1"]
触手塊を倒した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*battle_end"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_04_attack"]
[else]
[jump target="*youkai_04_escape" cond="f.turn > 4"]
[jump target="*youkai_04_sexhara"]
[endif]

*youkai_04_attack
触手塊の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1]
[else]
鈴耶のすばやさが５減少[p]
[eval exp="f.SPD = f.SPD - 5"]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*youkai_04"][s]

*youkai_04_sexhara
触手塊は鈴耶に取りついた[p]
触手塊は鈴耶の胸に吸い付いた[p]
#鈴耶
ひっ！！[p]
[eval exp="tf.tmp = 200 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.BOOB / 100 "]
[getMathRound var="tf.tmp"]
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0][WSs]
[if exp="f.ERO >= 1000 "]
鈴耶は絶頂した[p]
鈴耶の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[eval exp="f.MND = 0"][WSs]
触手塊は絶頂した鈴耶から離れると[r]
茂みへと姿を消した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
[endif]
[jump target="*youkai_04"][s]

*youkai_04_escape
触手塊は茂みへと姿を消した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[jump target="*no_goal"][s]
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
薬草を見つけた[r]
鈴耶の体力が回復した[p]
[eval exp="f.HP += 100" ][eval exp="f.HP = 1000" cond="f.HP > 1000"]
[jump target="*no_goal"][s]

*trouble_good_02
狐を見つけた[r]
鈴耶の集中力が増加した[p]
[eval exp="f.MND += 1" ][eval exp="f.MND = 5" cond="f.MND > 5"]
[jump target="*no_goal"][s]

*trouble_good_03
湧き水を見つけた[r]
鈴耶の気力が増加した[p]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[jump target="*no_goal"][s]

*trouble_good_04
抜け道を発見した[r]
進行度が上昇した[p]
[eval exp="f.progress += 10"][eval exp="f.progress = f.goal" cond="f.progress > f.goal"]
[jump target="*goal" cond="f.progress >= f.goal"]
[jump target="*no_goal"][s]


*trouble_bad_01
人影を見つけた[r]
こちらの気配には気づいていないようだ[p]
どうする？[p]
[glink color="black" target="*trouble_bad_01-A" x="450" y="100" width="" height="" text="隠れてやり過ごす" ]
[glink color="black" target="*trouble_bad_01-B" x="450" y="200" width="" height="" text="不意打ちする" ]
[s]
*trouble_bad_01-A
[getrand min="1" max="100" var="tf.rand"]
[eval exp="tf.tag = f.MND * 10 + 49"]
[if exp="tf.rand <= tf.tag "]
・・・・・・[p]
やりすごすことができたようだ[p]
[jump target="*no_goal"][s]
[else]
・・・・・・[p]
#敵
そこにいるのは何者だ！！[p]
#
見つかってしまった！[p]
[endif]
[jump target="*event_enemy"]
[s]

*trouble_bad_01-B
[getrand min="1" max="100" var="tf.rand"]
[eval exp="tf.tag = f.MND * 10 + 70"]
[if exp="tf.rand <= tf.tag "]
不意打ち成功!!(１ターン目の攻撃力アップ)[p]
[eval exp="f.ambush = 1"]
[else]
#敵
そこにいるのは何者だ！！[p]
#
不意打ちに失敗した[p]
[endif]
[jump target="*event_enemy"]
[s]

*trouble_bad_02
妖怪を見つけた[r]
こちらの気配には気づいていないようだ[p]

[glink color="black" target="*trouble_bad_02-A" x="450" y="100" width="" height="" text="隠れてやり過ごす" ]
[glink color="black" target="*trouble_bad_02-B" x="450" y="200" width="" height="" text="不意打ちする" ]
[s]
*trouble_bad_02-A
[getrand min="1" max="100" var="tf.rand"]
[eval exp="tf.tag = f.MND * 10 + 49"]
[if exp="tf.rand <= tf.tag "]
・・・・・・[p]
やりすごすことができたようだ[p]
[jump target="*no_goal"][s]
[else]
・・・・・・[p]
#敵
！！[p]
#
見つかってしまった！[p]
[endif]
[jump target="*event_enemy"]
[s]

*trouble_bad_02-B
[getrand min="1" max="100" var="tf.rand"]
[eval exp="tf.tag = f.MND * 10 + 70"]
[if exp="tf.rand <= tf.tag "]
不意打ち成功!!(１ターン目の攻撃力アップ)[p]
[eval exp="f.ambush = 1"]
[else]
#敵
！！[p]
#
不意打ちに失敗した[p]
[endif]
[jump target="*event_enemy"]
[s]


*trouble_bad_03
トラブル6[p]
鈴耶の気力が減少した[p]
[eval exp="f.MP += 10" ][eval exp="f.MP = 0" cond="f.MP < 0"]
[jump target="*no_goal"][s]

*trouble_bad_04
足場が崩れている[l]仕方ないので回り道をした[p]進行度が減少した[p]
[eval exp="f.progress -= 10"][eval exp="f.progress = 0" cond="f.progress < 0"]
[jump target="*no_goal"][s]

*trouble_bad_05
ぬかるみに足を取られた[p]
鈍足状態になった[p]一時的に移動力が低下した[p]
[eval exp="f.slowly = 5" ][eval exp="f.slowly = 5" cond="f.slowly > 5"]
[jump target="*no_goal"][s]

*trouble_bad_06
毒蜘蛛に噛まれた[p]
毒状態になった[p]一時的に行動のたびにダメージを受ける[p]
[eval exp="f.poison = 5" ][eval exp="f.poison = 5" cond="f.poison > 5"]
[jump target="*no_goal"][s]

*trouble_bad_07
あやしげな花の花粉を吸った[p]
興奮状態になった[p]一時的に快感が減少しなくなった[p]
[eval exp="f.excite = 5" ][eval exp="f.excite = 5" cond="f.excite > 5"]
[jump target="*no_goal"][s]

;-------------------------------------------------------------------------------
*no_goal
#鈴耶
;[chara_mod name="suzune" face="default" cross="true" ]
[eval exp="f.ERO = f.ERO - f.SAN" cond="f.excite == 0"]
[eval exp="f.ERO = 0" cond="f.ERO < 0"][WSs]
[eval exp="f.MP += 5" cond="f.MP <= 100"]

[if exp="f.poison > 0"]
毒により鈴耶の体力が減少[p]
[eval exp="f.HP -= 20"][eval exp="f.HP = 0" cond="f.HP < 0"][WSs]
[jump target="*defeat" cond="f.HP <= 0"]
[endif]

[if exp="f.poison == 1"]
鈴耶は毒状態から回復した[p]
[endif]
[if exp="f.excite  == 1"]
鈴耶は興奮状態から回復した[p]
[endif]
[if exp="f.slowly== 1"]
鈴耶は鈍足状態から回復した[p]
[endif]

[eval exp="f.poison -= 1" cond="f.poison > 0"]
[eval exp="f.excite -= 1" cond="f.excite > 0"]
[eval exp="f.slowly -= 1" cond="f.slowly > 0"]
[WSs]

[jump target="*ready"]
[s]


;-------------------------------------------------------------------------------
*escape
鈴耶は逃走した（20後退）[p]
[eval exp="f.escape = 0"]
[eval exp="f.progress -= 20"][eval exp="f.progress = 0" cond="f.progress < 0"]
[jump target="*no_goal"]
[s]
;-------------------------------------------------------------------------------
*battle_end
[eval exp="f.Round = 0, f.ambush=1"]
[jump target="*no_goal"]
[s]
;-------------------------------------------------------------------------------
*defeat
#鈴耶
そ、そんな・・・[p]
#
鈴耶は気を失った[p]
[eval exp="f.poison=0, f.slowly=0, f.excite=0"]
[eval exp="f.SPD = f.SPD_MAX, f.MOVE = f.MOVE_MAX, f.STR = f.STR_MAX, f.POW = f.POW_MAX "]
[jump　target="*result"]
[s]

;-------------------------------------------------------------------------------
*goal
#鈴耶
[chara_mod name="suzune" face="happy" ]
無事到着っと[p]
[eval exp="f.poison=0, f.slowly=0, f.excite=0"]
[eval exp="f.SPD = f.SPD_MAX, f.MOVE = f.MOVE_MAX, f.STR = f.STR_MAX, f.POW = f.POW_MAX "]
[WSs]

*result
[cm][clearfix][freeimage layer=1]
#
Homeに戻ります[p]
[eval exp="f.date += 1"]
[jump storage="home.ks" target="*home_start"]
[s]
