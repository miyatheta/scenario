*mission_start
;ステージ情報
[eval exp="f.Quest_name='1st_expr.ks' , f.Quest_type=1"]
[eval exp="f.goal=100 , f.progress=0 , f.Cleared=0 , f.Achievement=0"]
[eval exp="f.security=1 , f.security_MAX=1 , f.warning=0 , f.turn=1"]

;暫定ステータス
[call storage="routin/Rt_setStatus.ks"]
[WSs]

;-------------------------------------------------------------------------------
;チュートリアル
*ready1
[progressbar]
右下に表示されているバーは忍務の進行度を表します[p]
*ready1x
「先へ進む」を選んで下さい[p]
[glink color="black" target="*goahead1" x="400" y="150" width="" height="" text="先へ進む" ]
[glink color="black" target="*ready1x" x="400" y="250" width="" height="" text="メニュー" ]
[glink color="black" target="*ready1x" x="400" y="350" width="" height="" text="撤退する" ]
[s]

*goahead1
[cm]
#
「先へ進む」を選択すると移動力分だけ進行度が増えます[p]
進行度が既定値（バー右端）に到達すると忍務クリアになります[p]
@layopt layer=message0 visible=true
@current layer="message0"
[call storage="routin/Rt_progress.ks"]
[if exp="f.progress >= f.goal"]
[jump target=*goal]
[else]
[jump target=*tutorial_event1]
[endif]

*tutorial_event1
[cm]
#
進んだ先では必ず何かしらのイベントが発生します[p]
;抜け道
[call storage="data_Quest/comon_event.ks" target="*forest_shortcut"]

*ready2
[progressbar]
「先へ進む」を選んで下さい[p]
[glink color="black" target="*goahead2" x="400" y="150" width="" height="" text="先へ進む" ]
[glink color="black" target="*ready2" x="400" y="250" width="" height="" text="メニュー" ]
[glink color="black" target="*ready2" x="400" y="350" width="" height="" text="撤退する" ]
[s]

*goahead2
[cm]
#
@layopt layer=message0 visible=true
@current layer="message0"
[call storage="routin/Rt_progress.ks"]
[if exp="f.progress >= f.goal"]
[jump target=*goal]
[else]
[jump target=*tutorial_event2]
[endif]

*tutorial_event2
;ぬかるみ（＋鈍足）
[call storage="data_Quest/comon_event.ks" target="*muddy_swanp"]
イベントには良いものもあれば、状態異常などを招く悪いイベントもあります[p]
状態異常は道具を使用すれば回復することができます[p]
道具は画面下部の道具アイコンを押して下さい[p]

*ready3
[progressbar]
[glink color="black" target="*goahead3" x="400" y="250" width="" height="" text="先へ進む" ]
[glink color="black" target="*ready3" x="400" y="350" width="" height="" text="メニュー" ]
[glink color="black" target="*ready3" x="400" y="450" width="" height="" text="撤退する" ]
[s]

*goahead3
[cm]
#
@layopt layer=message0 visible=true
@current layer="message0"
[call storage="routin/Rt_progress.ks"]
[if exp="f.progress >= f.goal"]
[jump target=*goal]
[else]
[jump target=*tutorial_event3]
[endif]

*tutorial_event3
;エネミー
野盗が現れた[p]
道中で敵と遭遇すると、戦闘になります[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '野盗'"]
[eval exp="f.Lv = 15 + (f.security * 10) , f.en_HP = 150 + (f.security * 10)"]
[eval exp="f.GRB = 90 + (f.security * 10), f.EN_SEX = 90 + (f.security * 10) "]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.en_DEX = 21 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/EN_comon_yatou.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*tutorial_battle_end1" cond="f.en_HP < 1"]
[s]

*tutorial_battle_end1
[call storage="battle/Rt_battle_end.ks"]

*ready4
[progressbar]
[glink color="black" target="*goahead4" x="400" y="250" width="" height="" text="先へ進む" ]
[glink color="black" target="*ready4" x="400" y="350" width="" height="" text="メニュー" ]
[glink color="black" target="*ready4" x="400" y="450" width="" height="" text="撤退する" ]
[s]

*goahead4
[cm]
#
@layopt layer=message0 visible=true
@current layer="message0"
[call storage="routin/Rt_progress.ks"]
[if exp="f.progress >= f.goal"]
[jump target=*goal]
[else]
[jump target=*tutorial_event4]
[endif]

*tutorial_event4
すらいむ（水蛭子）が現れた[p]
#鈴耶
妖怪！？[p]
[eval exp="f.en_Name = 'すらいむ'"]
#
妖怪系の敵に遭遇すると妖怪の瘴気に当てられた鈴耶の淫気が上昇します[p]
淫気が上昇すると敵やイベントで受ける快感が増加します[p]
[eval exp="f.CURSE = f.CURSE + 20"][WSs]
[eval exp="f.en_DEX = 30, f.en_HP = 135 , f.type = 2, f.Round = 0"]
[eval exp="f.EN_SAN= 0 "]
[WriteEnemy]
[call storage="data_enemy/Mo_suraimu.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[jump target="*no_goal"]

*tutorial_battle_end2
[call storage="battle/Rt_battle_end.ks"]
#鈴耶
（山奥でも妖怪と出会うことなんてほとんどなかったのに・・・）[p]
（世の乱れが、人々の負の心が妖怪たちを生み出しているのね・・・）[p]
殿・・・。鈴耶は必ず忍務を果たしてみせます！[p]
[cm]
;-------------------------------------------------------------------------------

*ready
[progressbar]
[glink color="black" target="*goahead" x="400" y="150" width="" height="" text="先へ進む" ]
[glink color="black" target="*useitem" x="400" y="250" width="" height="" text="道具使用" ]
[glink color="black" target="*menu" x="400" y="350" width="" height="" text="状態確認" ]
;[glink color="black" target="*exit" x="400" y="450" width="" height="" text="撤退する" ]
[s]
;-------------------------------------------------------------------------------

*useitem
[cm]
;@layopt layer=message0 visible=true
;@current layer="message0"
[call storage="routin/Rt_useitem.ks"]
[jump target="*ready"]
[s]

;-------------------------------------------------------------------------------

*menu
[cm]
@layopt layer=message0 visible=true
@current layer="message0"
[call storage="routin/Rt_showmenu.ks"]
[jump target="*ready"]
[s]
;-------------------------------------------------------------------------------

*exit
[cm]
#
忍務から撤退しますか？[p]
[glink color="black" target="*result" x="400" y="250" width="" height="" text="はい" ]
[glink color="black" target="*ready" x="400" y="350" width="" height="" text="いいえ" ]
[s]

;-------------------------------------------------------------------------------

*goahead
[cm]
@layopt layer=message0 visible=true
@current layer="message0"
[call storage="routin/Rt_progress.ks"]

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
[getrand min="1" max="100" var="f.event"]

[if exp="f.event<=30"]
野犬が現れた[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '野犬'"]
[eval exp="f.Lv = 10 + (f.security * 10), f.en_HP = 110 + (f.security * 10) , f.GRB = 70 + (f.security * 10)"]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.en_DEX = 31 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/EN_comon_yaken.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=60"]
野盗が現れた[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '野盗'"]
[eval exp="f.Lv = 20 + (f.security * 10) , f.en_HP = 150 + (f.security * 10)"]
[eval exp="f.GRB = 90 + (f.security * 10), f.EN_SEX = 90 + (f.security * 10) "]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.en_DEX = 21 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/EN_comon_yatou.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=80"]
野武士が現れた[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '野武士'"]
[eval exp="f.Lv = 20 + (f.security * 10) , f.en_HP = 240 + (f.security * 10)"]
[eval exp="f.GRB = 100 + (f.security * 10), f.EN_SEX = 110 + (f.security * 10) "]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.en_DEX = 24 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/EN_comon_otimusha.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[else]
忍者が現れた[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '忍者'"]
[eval exp="f.Lv = 20 + (f.security * 10) , f.en_HP = 180 + (f.security * 10)"]
[eval exp="f.GRB = 90 + (f.security * 10), f.EN_SEX = 140 + (f.security * 10) "]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.EN_POW = 9 + f.security, f.en_DEX = 27 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
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
[eval exp="f.en_Name = 'すらいむ'"]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 20"][WSs]
[eval exp="f.en_DEX = 30, f.en_HP = 135 , f.type = 2, f.Round = 0"]
[eval exp="f.EN_SAN= 0 "]
[WriteEnemy]
[call storage="data_enemy/Mo_suraimu.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[jump target="*no_goal"]

[elsif exp="f.event<70"]
ひとだまが現れた[p]
[eval exp="f.en_Name = 'ひとだま'"]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 30"][WSs]
[eval exp="f.en_DEX = 30, f.en_HP = 105 , f.type = 2, f.Round = 0"]
[eval exp="f.EN_SAN= 0 "]
[WriteEnemy]
[call storage="data_enemy/Mo_hitodama.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[jump target="*no_goal"]

[else]
触手塊が現れた[p]
[eval exp="f.en_Name = '触手塊'"]
妖怪に遭遇したことで鈴耶の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 50"][WSs]
[eval exp="f.en_DEX = 30, f.en_HP = 200 , f.type = 2, f.Round = 0"]
[eval exp="f.EN_SAN= 0 "]
[WriteEnemy]
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
[call storage="data_Quest/comon_event.ks" target="*healing_herbs"]
[jump target="*no_goal"]
[s]

*fortune_02
;お地蔵様（気力＋）
[call storage="data_Quest/comon_event.ks" target="*stone_statue"]
[jump target="*no_goal"]
[s]

*fortune_03
;湧き水（集中力＋）
[call storage="data_Quest/comon_event.ks" target="*spring_water"]
[jump target="*no_goal"]
[s]

*fortune_04
;抜け道
[call storage="data_Quest/comon_event.ks" target="*forest_shortcut"]
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
[call storage="data_Quest/comon_event.ks" target="*watch_ghost"]
[jump target="*no_goal"]
[s]

*accident_04
;地すべり迂回（後退）
[call storage="data_Quest/comon_event.ks" target="*landslide_roundabout"]
[jump target="*no_goal"]
[s]

*accident_05
;ぬかるみ（＋鈍足）
[call storage="data_Quest/comon_event.ks" target="*muddy_swanp"]
[jump target="*no_goal"]
[s]

*accident_06
;毒蜘蛛（＋毒）
[call storage="data_Quest/comon_event.ks" target="*poison_spider"]
[jump target="*no_goal"]
[s]

*accident_07
;怪しげな花粉（＋興奮）
[call storage="data_Quest/comon_event.ks" target="*strange_flower"]
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
[getrand min="1" max="100" var="f.rand"]
[eval exp="tf.tag = f.MND * 10 + 49"]
[if exp="f.rand <= tf.tag && f.MND >= 1"]
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
[getrand min="1" max="100" var="f.rand"]
[eval exp="tf.tag = f.MND * 10 + 70"]
[if exp="f.rand <= tf.tag "]
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
[getrand min="1" max="100" var="f.rand"]
[eval exp="tf.tag = f.MND * 10 + 49"]
[if exp="f.rand <= tf.tag && f.MND >= 1"]
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
[getrand min="1" max="100" var="f.rand"]
[eval exp="tf.tag = f.MND * 10 + 70"]
[if exp="f.rand <= tf.tag "]
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
[call storage="battle/Rt_escape.ks"]
[jump target="*no_goal"]
[s]

;-------------------------------------------------------------------------------
*battle_end
[call storage="battle/Rt_battle_end.ks"]

[jump target="*no_goal"]
[s]

;-------------------------------------------------------------------------------
*no_goal
#
[call storage="routin/Rt_nogoal.ks"]

[jump target="*ready"]
[s]

;-------------------------------------------------------------------------------
*defeat
#鈴耶
そ、そんな・・・[p]
#
鈴耶は気を失った[p]
[chara_hide name="suzune" time=500]
[freeimage layer="base" ]
[wait time=1000]
[call storage="routin/Rt_setStatus.ks"]
[call storage="battle/Rt_battle_end.ks"]
[call storage="asset/As_result.ks"]
[jump storage="data_prison/comon_torture01.ks"]
[s]

;-------------------------------------------------------------------------------
*goal
#鈴耶
[chara_mod name="suzune" face="柔らか" ]
無事到着っと[p]
[call storage="routin/Rt_setStatus.ks"][eval exp="f.dress=1"]

[if exp="f.Qt_n_expr01 != 1"]
#
初回クリア[p]
[eval exp="f.Reward = 100"]
[eval exp="f.Qt_n_expr01 = 1"]
[else]
[eval exp="f.Reward = 50"]
[endif]

[eval exp="f.rootA += f.Reward"]
#
無事、密書を届けることが出来た[p]北條家との友好度が上昇した[p]
[WSs]

;-------------------------------------------------------------------------------
*result
[freeimage layer="0" ]
[call storage="asset/As_result.ks"]
[jump storage="home.ks" target="*home_start"]
[s]
