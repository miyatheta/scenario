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
[chara_show name="suzune" left="-100" top="-20"]
[eval exp="f.goal=150 , f.progress=0 , f.Achievement=0"]
[eval exp="f.security=1 , f.security_MAX=1 , f.warning=0"]

;暫定ステータス
[SetStatus]
[WSs]

;-------------------------------------------------------------------------------

*ready
[progressbar]
[glink color="black" target="*goahead" x="400" y="250" width="" height="" text="先へ進む" ]
[glink color="black" target="*menu" x="400" y="350" width="" height="" text="メニュー" ]
[glink color="black" target="*menu" x="400" y="450" width="" height="" text="撤退する" ]
[s]
;-------------------------------------------------------------------------------

*menu
[cm]
@layopt layer=message0 visible=true
[current layer="message0"]
[call storage="showmenu.ks"]
[jump target="*ready"]
;-------------------------------------------------------------------------------

*goahead
[cm]
@layopt layer=message0 visible=true
[current layer="message0"]
[eval exp="f.MOVE = f.MOVE_MAX"]
[eval exp="f.MOVE -= 3 " cond="f.slowly > 0"]
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
[getrand min="1" max="60" var="f.event"]
[if exp="f.event<=20 && f.Pre_event != 1"]
[eval exp="f.Pre_event = 1"][jump target=*event_enemy]

[elsif exp="f.event<=40 && f.Pre_event != 2"]
[eval exp="f.Pre_event = 2"][jump target=*event_youkai]

[elsif exp="f.event<=60 && f.Pre_event != 3"]
[eval exp="f.Pre_event = 3"][jump target=*event_trouble]

[else][jump target=*event_trouble]
[endif]

[s]
;-------------------------------------------------------------------------------

*event_enemy
#
[eval exp="f.En_Raptured = 0 , f.En_Wiseman_time = 0"]

[getrand min="1" max="100" var="f.event"]

[if exp="f.event<=30"]
野犬が現れた[p]
[eval exp="f.en_Name = '野犬'"][WriteEnemy]
[eval exp="f.Lv = 10 + (f.security * 10), f.en_HP = 110 + (f.security * 10) , f.GRB = 70 + (f.security * 10)"]
[eval exp="f.EN_STR = 9 + f.security, f.en_DEX = 31 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/EN_comon_yaken.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=60"]
野盗が現れた[p]
[eval exp="f.en_Name = '野盗'"][WriteEnemy]
[eval exp="f.Lv = 20 + (f.security * 10) , f.en_HP = 150 + (f.security * 10)"]
[eval exp="f.GRB = 90 + (f.security * 10), f.SEX = 90 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.en_DEX = 21 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/EN_comon_yatou.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=80"]
落ち武者が現れた[p]
[eval exp="f.en_Name = '落ち武者'"][WriteEnemy]
[eval exp="f.Lv = 20 + (f.security * 10) , f.en_HP = 240 + (f.security * 10)"]
[eval exp="f.GRB = 100 + (f.security * 10), f.SEX = 110 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.en_DEX = 24 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/EN_comon_otimusha.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[else]
忍者が現れた[p]
[eval exp="f.en_Name = '忍者'"][WriteEnemy]
[eval exp="f.Lv = 20 + (f.security * 10) , f.en_HP = 180 + (f.security * 10)"]
[eval exp="f.GRB = 90 + (f.security * 10), f.SEX = 140 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.EN_POW = 9 + f.security, f.en_DEX = 27 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/EN_comon_ninja01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[endif]
[s]

;-------------------------------------------------------------------------------
*event_youkai
#
[getrand min="1" max="90" var="f.event"]

[if exp="f.event<40"]
すらいむが現れた[p]
[eval exp="f.en_Name = 'すらいむ'"][WriteEnemy]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 20"][WSs]
[eval exp="f.en_DEX = 30, f.en_HP = 135 , f.type = 2, f.Round = 0"]
[call storage="data_enemy/Mo_suraimu.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[jump target="*no_goal"]
[s]

[elsif exp="f.event<70"]
ひとだまが現れた[p]
[eval exp="f.en_Name = 'ひとだま'"][WriteEnemy]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 30"][WSs]
[eval exp="f.en_DEX = 30, f.en_HP = 105 , f.type = 2, f.Round = 0"]
[call storage="data_enemy/Mo_hitodama.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[jump target="*no_goal"]
[s]

[else]
触手塊が現れた[p]
[eval exp="f.en_Name = '触手塊'"][WriteEnemy]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 50"][WSs]
[eval exp="f.en_DEX = 30, f.en_HP = 200 , f.type = 2, f.Round = 0"]
[call storage="data_enemy/Mo_shokusyu.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[jump target="*no_goal"]
[s]

[endif]
;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
*event_trouble
[getrand min="1" max="100" var="f.trouble"]
[if exp="f.trouble<30"]
[jump target=*trouble_good]
[else]
[jump target=*trouble_bad]
[endif]
[s]

*trouble_good
[getrand min="1" max="100" var="f.trouble"]
[if exp="f.trouble <= 25 && f.Pre_trouble_g != 1"]
[eval exp="f.Pre_trouble_g = 1"]
[jump target=*trouble_good_01]
[elsif exp="f.trouble <= 50 && f.Pre_trouble_g != 2"]
[eval exp="f.Pre_trouble_g = 2"]
[jump target=*trouble_good_02]
[elsif exp="f.trouble <= 75 && f.Pre_trouble_g != 3"]
[eval exp="f.Pre_trouble_g = 3"]
[jump target=*trouble_good_03]
[elsif exp="f.trouble <= 100 && f.Pre_trouble_g != 4"]
[eval exp="f.Pre_trouble_g = 4"]
[jump target=*trouble_good_04]
[else]
[eval exp="f.Pre_trouble_g = 0"]
[jump target=*trouble_good]
[endif]
[s]

*trouble_bad
[getrand min="1" max="70" var="f.trouble"]
[if exp="f.trouble <= 10 && f.Pre_trouble_b != 1"]
[eval exp="f.Pre_trouble_b = 1"]
[jump target=*trouble_bad_01]
[elsif exp="f.trouble <= 20 && f.Pre_trouble_b != 2"]
[eval exp="f.Pre_trouble_b = 2"]
[jump target=*trouble_bad_02]
[elsif exp="f.trouble <= 30 && f.Pre_trouble_b != 3"]
[eval exp="f.Pre_trouble_b = 3"]
[jump target=*trouble_bad_03]
[elsif exp="f.trouble <= 40 && f.Pre_trouble_b != 4"]
[eval exp="f.Pre_trouble_b = 4"]
[jump target=*trouble_bad_04]
[elsif exp="f.trouble <= 50 && f.Pre_trouble_b != 5"]
[eval exp="f.Pre_trouble_b = 5"]
[jump target=*trouble_bad_05]
[elsif exp="f.trouble <= 60 && f.Pre_trouble_b != 6"]
[eval exp="f.Pre_trouble_b = 6"]
[jump target=*trouble_bad_06]
[elsif exp="f.trouble <= 70 && f.Pre_trouble_b != 7"]
[eval exp="f.Pre_trouble_b = 7"]
[jump target=*trouble_bad_07]
[else]
[eval exp="f.Pre_trouble_b = 0"]
[jump target=*trouble_bad]
[endif]
[s]

*trouble_good_01
#
薬草を見つけた[r]
鈴耶の体力が回復した[p]
[eval exp="f.HP += 100" ][eval exp="f.HP = 1000" cond="f.HP > 1000"]
[jump target="*no_goal"][s]

*trouble_good_02
#
狐を見つけた[r]
鈴耶の集中力が増加した[p]
[eval exp="f.MND += 1" ][eval exp="f.MND = 5" cond="f.MND > 5"]
[jump target="*no_goal"][s]

*trouble_good_03
#
湧き水を見つけた[r]
鈴耶の気力が増加した[p]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[jump target="*no_goal"][s]

*trouble_good_04
#
抜け道を発見した[r]
進行度が上昇した[p]
[eval exp="f.progress += 10"][eval exp="f.progress = f.goal" cond="f.progress > f.goal"]
[jump target="*goal" cond="f.progress >= f.goal"]
[jump target="*no_goal"][s]


*trouble_bad_01
#
動く影を見つけた[r]
こちらの気配には気づいていないようだ[p]
どうする？[p]
[glink color="black" target="*trouble_bad_01-A" x="450" y="100" width="" height="" text="隠れてやり過ごす" ]
[glink color="black" target="*trouble_bad_01-B" x="450" y="200" width="" height="" text="不意打ちする" ]
[s]
*trouble_bad_01-A
#
[getrand min="1" max="100" var="tf.rand"]
[eval exp="tf.tag = f.MND * 10 + 49"]
[if exp="tf.rand <= tf.tag && f.MND >= 1"]
・・・・・・[p]
やりすごすことができたようだ[p]
集中力を１消費した[p]
[eval exp="f.MND -= 1"]
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
#
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
#
妖怪を見つけた[r]
こちらの気配には気づいていないようだ[p]

[glink color="black" target="*trouble_bad_02-A" x="450" y="100" width="" height="" text="隠れてやり過ごす" ]
[glink color="black" target="*trouble_bad_02-B" x="450" y="200" width="" height="" text="不意打ちする" ]
[s]
*trouble_bad_02-A
#
[getrand min="1" max="100" var="tf.rand"]
[eval exp="tf.tag = f.MND * 10 + 49"]
[if exp="tf.rand <= tf.tag && f.MND >= 1"]
・・・・・・[p]
やりすごすことができたようだ[p]
[eval exp="f.MND -= 1"]
[jump target="*no_goal"][s]
[else]
・・・・・・[p]
#敵
！！[p]
#
見つかってしまった！[p]
[endif]
[jump target="*event_youkai"]
[s]

*trouble_bad_02-B
#
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
[jump target="*event_youkai"]
[s]


*trouble_bad_03
#
鈴耶の気力が減少した[p]
[eval exp="f.MP -= 10" ][eval exp="f.MP = 0" cond="f.MP < 0"]
[jump target="*no_goal"][s]

*trouble_bad_04
#
足場が崩れている[l]仕方ないので回り道をした[p]進行度が減少した[p]
[eval exp="f.progress -= 10"][eval exp="f.progress = 0" cond="f.progress < 0"]
[jump target="*no_goal"][s]

*trouble_bad_05
#
ぬかるみに足を取られた[p]
鈍足状態になった[p]一時的に移動力が低下した[p]
[eval exp="f.slowly = 5" ][eval exp="f.slowly = 5" cond="f.slowly > 5"]
[jump target="*no_goal"][s]

*trouble_bad_06
#
毒蜘蛛に噛まれた[p]
毒状態になった[p]一時的に行動のたびにダメージを受ける[p]
[eval exp="f.poison = 5" ][eval exp="f.poison = 5" cond="f.poison > 5"]
[jump target="*no_goal"][s]

*trouble_bad_07
#
あやしげな花の花粉を吸った[p]
興奮状態になった[p]一時的に快感が減少しなくなった[p]
[eval exp="f.excite = 5" ][eval exp="f.excite = 5" cond="f.excite > 5"]
[jump target="*no_goal"][s]


;-------------------------------------------------------------------------------
*escape
鈴耶は逃走した（20後退）[p]
[eval exp="f.escape = 0"]
[eval exp="f.progress -= 20"][eval exp="f.progress = 0" cond="f.progress < 0"]
[jump target="*no_goal"]
[s]

;-------------------------------------------------------------------------------
*battle_end
[eval exp="f.Round = 0, f.ambush=0"]

[if exp="f.enchant > 0 "]
退魔の術の効力が切れた
[eval exp="f.enchant = 0 "]
[endif]

[if exp="f.invincible > 0 "]
退魔の術の効力が切れた
[eval exp="f.invincible = 0 "]
[endif]
;no_goalで加算される分を相殺
[eval exp="f.MP -= 5"]
[jump target="*no_goal"]
[s]


;-------------------------------------------------------------------------------
*no_goal
#
;[chara_mod name="suzune" face="default" cross="true" ]
[eval exp="f.ERO = f.ERO - f.SAN" cond="f.excite == 0"]
[eval exp="f.ERO = 0" cond="f.ERO < 0"]
[MP1][WSs]

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
*defeat
#鈴耶
そ、そんな・・・[p]
#
鈴耶は気を失った[p]
[SetStatus]
[jump　target="*result"]
[s]

;-------------------------------------------------------------------------------
*goal
#鈴耶
[chara_mod name="suzune" face="happy" ]
無事到着っと[p]
[SetStatus]
[WSs]

*result
[cm][clearfix][freeimage layer=1]
#
Homeに戻ります[p]
[eval exp="f.date += 1"]
[jump storage="home.ks" target="*home_start"]
[s]
