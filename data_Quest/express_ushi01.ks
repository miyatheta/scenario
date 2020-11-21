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

;ステージ情報
[bg storage="mori_yoru.jpg" time="500"]
[eval exp="f.Quest_name='express_ushi01.ks' , f.Quest_type=1"]
[eval exp="f.goal=150 , f.progress=0 , f.Cleared=0 , f.Achievement=0"]
[eval exp="f.security=1 , f.security_MAX=1 , f.warning=0 , f.turn=1"]

;暫定ステータス
[SetStatus]
[WSs]
[chara_show name="suzune" left="-100" top="-20"]
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
[s]
;-------------------------------------------------------------------------------

*goahead
[cm]
@layopt layer=message0 visible=true
[current layer="message0"]
[call storage="routin_progress.ks"]

[if exp="f.progress >= f.goal"]
[jump target=*goal]

[else]
[jump target=*select_event]
[endif]

;-------------------------------------------------------------------------------

*select_event
[getrand min="1" max="60" var="f.event"]
[if exp="f.event<=20 && f.Pre_event != 1"]
[eval exp="f.Pre_event = 1"][jump target=*select_enemy]

[elsif exp="f.event<=40 && f.Pre_event != 2"]
[eval exp="f.Pre_event = 2"][jump target=*event_youkai]

[elsif exp="f.event<=60 && f.Pre_event != 3"]
[eval exp="f.Pre_event = 3"][jump target=*select_incident]

[else][jump target=*select_incident]
[endif]

[s]

;-------------------------------------------------------------------------------

*select_enemy
#
[eval exp="f.En_Raptured = 0 , f.En_Wiseman_time = 0"]

[getrand min="1" max="100" var="f.event"]

[if exp="f.event<=30"]
野犬が現れた[p]
[call storage="process_initialize_enemy.ks"]
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
[call storage="process_initialize_enemy.ks"]
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
[call storage="process_initialize_enemy.ks"]
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
[call storage="process_initialize_enemy.ks"]
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

[endif]
[s]
;-------------------------------------------------------------------------------
*select_incident
[getrand min="1" max="100" var="f.incident"]
[if exp="f.incident<30"]
[jump target=*select_fortune]
[else]
[jump target=*select_accident]
[endif]
[s]
;-------------------------------------------------------------------------------
*select_fortune
[getrand min="1" max="100" var="f.fortune"]
[if exp="f.fortune <= 25 && f.Pre_fortune != 1"]
[eval exp="f.Pre_fortune = 1"]
[jump target=*fortune_01]
[elsif exp="f.fortune <= 50 && f.Pre_fortune != 2"]
[eval exp="f.Pre_fortune = 2"]
[jump target=*fortune_02]
[elsif exp="f.fortune <= 75 && f.Pre_fortune != 3"]
[eval exp="f.Pre_fortune = 3"]
[jump target=*fortune_03]
[elsif exp="f.fortune <= 100 && f.Pre_fortune != 4"]
[eval exp="f.Pre_fortune = 4"]
[jump target=*fortune_04]
[else]
[eval exp="f.Pre_fortune = 0"]
[jump target=*select_fortune]
[endif]
[s]
;-------------------------------------------------------------------------------

*fortune_01
;薬草
[call storage="data_comon_event.ks" target="*healing_herbs"]
[jump target="*no_goal"]
[s]

*fortune_02
;お地蔵様（気力＋）
[call storage="data_comon_event.ks" target="*stone_statue"]
[jump target="*no_goal"]
[s]

*fortune_03
;湧き水（集中力＋）
[call storage="data_comon_event.ks" target="*spring_water"]
[jump target="*no_goal"]
[s]

*fortune_04
;抜け道
[call storage="data_comon_event.ks" target="*forest_shortcut"]
[jump target="*goal" cond="f.progress >= f.goal"]
[jump target="*no_goal"]
[s]
;-------------------------------------------------------------------------------

*select_accident
[getrand min="1" max="70" var="f.accident"]
[if exp="f.accident <= 10 && f.Pre_accident != 1"]
[eval exp="f.Pre_accident = 1"]
[jump target=*accident_01]
[elsif exp="f.accident <= 20 && f.Pre_accident != 2"]
[eval exp="f.Pre_accident = 2"]
[jump target=*accident_02]
[elsif exp="f.accident <= 30 && f.Pre_accident != 3"]
[eval exp="f.Pre_accident = 3"]
[jump target=*accident_03]
[elsif exp="f.accident <= 40 && f.Pre_accident != 4"]
[eval exp="f.Pre_accident = 4"]
[jump target=*accident_04]
[elsif exp="f.accident <= 50 && f.Pre_accident != 5"]
[eval exp="f.Pre_accident = 5"]
[jump target=*accident_05]
[elsif exp="f.accident <= 60 && f.Pre_accident != 6"]
[eval exp="f.Pre_accident = 6"]
[jump target=*accident_06]
[elsif exp="f.accident <= 70 && f.Pre_accident != 7"]
[eval exp="f.Pre_accident = 7"]
[jump target=*accident_07]
[else]
[eval exp="f.Pre_accident = 0"]
[jump target=*select_accident]
[endif]
[s]
;-------------------------------------------------------------------------------

*accident_03
;幽霊を目撃する(気力-)
[call storage="data_comon_event.ks" target="*watch_ghost"]
[jump target="*no_goal"]
[s]

*accident_04
;地すべり迂回（後退）
[call storage="data_comon_event.ks" target="*landslide_roundabout"]
[jump target="*no_goal"]
[s]

*accident_05
;ぬかるみ（＋鈍足）
[call storage="data_comon_event.ks" target="*muddy_swanp"]
[jump target="*no_goal"]
[s]

*accident_06
;毒蜘蛛（＋毒）
[call storage="data_comon_event.ks" target="*poison_spider"]
[jump target="*no_goal"]
[s]

*accident_07
;怪しげな花粉（＋興奮）
[call storage="data_comon_event.ks" target="*strange_flower"]
[jump target="*no_goal"]
[s]

;不意打ち（人間）--------------------------------------------------------------------
*accident_01
#
動く影を見つけた[r]
こちらの気配には気づいていないようだ[p]
どうする？[p]
[glink color="black" target="*try_hinding01" x="450" y="100" width="" height="" text="隠れてやり過ごす" ]
[glink color="black" target="*try_ambush01" x="450" y="200" width="" height="" text="不意打ちする" ]
[s]
*try_hinding01
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
[jump target="*select_enemy"]
[s]

*try_ambush01
#
[getrand min="1" max="100" var="tf.rand"]
[eval exp="tf.tag = f.MND * 10 + 70"]
[if exp="tf.rand <= tf.tag "]
不意打ち成功!![p]
[eval exp="f.ambush = 1"]
[else]
#敵
そこにいるのは何者だ！！[p]
#
不意打ちに失敗した[p]
[endif]
[jump target="*select_enemy"]
[s]

;不意打ち（妖怪）-------------------------------------------------------------------
*accident_02
#
妖怪を見つけた[r]
こちらの気配には気づいていないようだ[p]
[glink color="black" target="*try_hinding02" x="450" y="100" width="" height="" text="隠れてやり過ごす" ]
[glink color="black" target="*try_ambush02" x="450" y="200" width="" height="" text="不意打ちする" ]
[s]
*try_hinding02
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

*try_ambush02
#
[getrand min="1" max="100" var="tf.rand"]
[eval exp="tf.tag = f.MND * 10 + 70"]
[if exp="tf.rand <= tf.tag "]
不意打ち成功!![p]
[eval exp="f.ambush = 1"]
[else]
#敵
！！[p]
#
不意打ちに失敗した[p]
[endif]
[jump target="*event_youkai"]
[s]

;-------------------------------------------------------------------------------
*escape
[call storage="process_escape.ks"]
[jump target="*no_goal"]
[s]

;-------------------------------------------------------------------------------
*battle_end
[BattleFinsish]

[jump target="*no_goal"]
[s]

;-------------------------------------------------------------------------------
*no_goal
#
[call storage="routin_nogoal.ks"]

[jump target="*ready"]
[s]

;-------------------------------------------------------------------------------
*defeat
#鈴耶
そ、そんな・・・[p]
#
鈴耶は気を失った[p]
[SetStatus]
[BattleFinsish]
[call storage="asset_result.ks"]
[jump storage="data_prison/comon_torture01.ks"]
[s]

;-------------------------------------------------------------------------------
*goal
#鈴耶
[chara_mod name="suzune" face="happy" ]
無事到着っと[p]
[SetStatus]
[WSs]

*result
[freeimage layer="0" ]
[call storage="asset_result.ks"]
[jump storage="home.ks" target="*home_start"]
[s]
