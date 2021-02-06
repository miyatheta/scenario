*mission_start
[eval exp="f.Quest_name='intrude_ushi01.ks' , f.Quest_type=2"]
[eval exp="f.goal=200 , f.progress=0 , f.Cleared=0 , f.Achievement=0"]
[eval exp="f.security=1 , f.security_MAX=6 , f.warning=0 , f.turn=1"]
[eval exp="f.trap_04 = 0 , f.trap_02 = 0 , f.trap_03 = 0 , f.trapper = 0 "]

;暫定ステータス
[call storage="routin/Rt_setStatus.ks"]
[WSs]
[chara_show name="suzune" face="普通" left="-100" top="-20"]
;-------------------------------------------------------------------------------

*ready
[securitybar]
[progressbar]
[glink color="black" target="*goahead" x="400" y="250" width="" height="" text="先へ進む" ]
[glink color="black" target="*menu" x="400" y="350" width="" height="" text="メニュー" ]
[glink color="black" target="*exit" x="400" y="450" width="" height="" text="撤退する" ]
[s]
;-------------------------------------------------------------------------------

*menu
[cm]
@layopt layer=message0 visible=true
@current layer="message0"
[call storage="routin/Rt_showmenu.ks"]
[jump target="*ready"]

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
[endif]

;-------------------------------------------------------------------------------

*select_event
[getrand min="1" max="60" var="f.event"]
[if exp="f.event<=20 && f.Pre_event != 1"]
[eval exp="f.Pre_event = 1"][jump target=*select_enemy]

[elsif exp="f.event<=40 && f.Pre_event != 2"]
[eval exp="f.Pre_event = 2"][jump target=*select_trap]

[elsif exp="f.event<=60 && f.Pre_event != 3"]
[eval exp="f.Pre_event = 3"][jump target=*select_incident]

[else]
[jump target=*select_incident]
[endif]
[s]

;-------------------------------------------------------------------------------
*select_enemy
#
[call storage="battle/Rt_battle_start.ks"]
[getrand min="1" max="120" var="f.event"]

[if exp="f.event<=30"]
番犬が現れた[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '番犬'"]
[eval exp="f.Lv = 30 + (f.security * 10) , f.en_HP = 130 + (f.security * 10)"]
[eval exp="f.GRB = 70 + (f.security * 10), f.EN_SEX = 100 + (f.security * 10) "]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.EN_POW = 9 + f.security, f.en_DEX = 31 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/En_ushi_banken01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=60"]
見廻り兵卒（丑）が現れた[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '見廻り兵卒（丑）'"]
[eval exp="f.Lv = 30 + (f.security * 10) , f.en_HP = 170 + (f.security * 10)"]
[eval exp="f.GRB = 90 + (f.security * 10), f.EN_SEX = 90 + (f.security * 10) "]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.EN_POW = 9 + f.security, f.en_DEX = 22 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/En_ushi_heishi01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=80"]
武士（丑）が現れた[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '武士（丑）'"]
[eval exp="f.Lv = 30 + (f.security * 10) , f.en_HP = 290 + (f.security * 10)"]
[eval exp="f.GRB = 110 + (f.security * 10), f.EN_SEX = 110 + (f.security * 10) "]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.EN_POW = 9 + f.security, f.en_DEX = 24 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/En_ushi_bushi01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=100"]
下忍（丑）が現れた[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '下忍（丑）'"]
[eval exp="f.Lv = 30 + (f.security * 10) , f.en_HP = 190 + (f.security * 10)"]
[eval exp="f.GRB = 100 + (f.security * 10), f.EN_SEX = 140 + (f.security * 10) "]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.EN_POW = 9 + f.security, f.en_DEX = 27 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/En_ushi_ninja01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=110"]
侍（丑）が現れた[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '侍（丑）'"]
[eval exp="f.Lv = 40 + (f.security * 10) , f.en_HP = 400 + (f.security * 10)"]
[eval exp="f.GRB = 110 + (f.security * 10), f.EN_SEX = 110 + (f.security * 10) "]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 14 + f.security, f.EN_POW = 9 + f.security, f.en_DEX = 27 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/En_ushi_samurai01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[else]
中忍（丑）が現れた[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '中忍（丑）'"]
[eval exp="f.Lv = 40 + (f.security * 10) , f.en_HP = 180 + (f.security * 10)"]
[eval exp="f.GRB = 100 + (f.security * 10), f.EN_SEX = 140 + (f.security * 10) "]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.EN_POW = 9 + f.security, f.en_DEX = 29 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/En_ushi_ninja02.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[endif]
[s]
;--------------------------------------------
*trapper
酔漢が現れた[p]
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '酔漢'"]
[eval exp="f.Lv = 40 + (f.security * 10) , f.en_HP = 100 + (f.security * 10)"]
[eval exp="f.GRB = 120 + (f.security * 10), f.EN_SEX = 120 + (f.security * 10) "]
[eval exp="f.EN_SAN= 50 + (f.security * 10) "]
[eval exp="f.EN_STR = 5 + f.security, f.en_DEX = 25 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/En_ushi_trapper.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]
;-------------------------------------------------------------------------------
*select_trap
#
[getrand min="1" max="125" var="f.trap"]
[if exp="f.trap <= 25 && f.Pre_trap != 1"]
[eval exp="f.Pre_trap = 1"]
[jump target=*trap_01]
[elsif exp="f.trap <= 50 && f.Pre_trap != 2"]
[eval exp="f.Pre_trap = 2"]
[jump target=*trap_02]
[elsif exp="f.trap <= 75 && f.Pre_trap != 3"]
[eval exp="f.Pre_trap = 3"]
[jump target=*trap_03]
[elsif exp="f.trap <= 100 && f.Pre_trap != 4"]
[eval exp="f.Pre_trap = 4"]
[jump target=*trap_04]
[elsif exp="f.trap <= 125 && f.Pre_trap != 4"]
[eval exp="f.Pre_trap = 5"]
[jump target=*trap_05]
[else]
[eval exp="f.Pre_trap = 0"]
[jump target=*select_trap]
[endif]
[s]

;--------------------------------------------
*trap_01
#
[call storage="data_trap/comon01.ks"]
[jump target="*no_goal"]
[s]
;--------------------------------------------
*trap_02
#
[call storage="data_trap/rope01.ks"]
[jump target="*trapper" cond="f.trapper > 0"]
[jump target="*no_goal"]
[s]
;--------------------------------------------
*trap_03
#
[call storage="data_trap/cage01.ks"]
[jump target="*trapper" cond="f.trapper > 0"]
[jump target="*no_goal"]
[s]
;--------------------------------------------
*trap_04
#
[call storage="data_trap/suraimu01.ks"]
[jump target="*trapper" cond="f.trapper > 0"]
[jump target="*no_goal"]
[s]
;--------------------------------------------
*trap_05
#
[call storage="data_trap/comon02.ks"]
[jump target="*no_goal"]
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
;回復薬
[call storage="data_Quest/comon_event.ks" target="*heal_potion"]
[jump target="*no_goal"]
[s]
*fortune_02
;密会を目撃（集中＋）
[call storage="data_Quest/comon_event.ks" target="*Witness_meating"]
[jump target="*no_goal"]
[s]
*fortune_03
;果物を発見(気力＋)
[call storage="data_Quest/comon_event.ks" target="*get_fruits"]
[jump target="*no_goal"]
[s]
*fortune_04
;見回りが居眠り
[call storage="data_Quest/comon_event.ks" target="*sleeping_guard"]
[jump target="*goal" cond="f.progress >= f.goal"]
[jump target="*no_goal"][s]

;-------------------------------------------------------------------------------

*select_accident
[getrand min="1" max="70" var="f.accident"]
[if exp="f.accident <= 10 && f.Pre_accident != 1"]
[eval exp="f.Pre_accident = 1"]
[jump target=*accident_01]
[elsif exp="f.accident <= 20 && f.Pre_accident != 2"]
[eval exp="f.Pre_accident = 2"]
[jump target=*accident_01]
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
;-------------------------------------------------------------------------------

*accident_03
;幽霊部屋（気力ー）
[call storage="data_Quest/comon_event.ks" target="*ghost_room"]
[jump target="*no_goal"]
[s]

*accident_04
;見回りが立っている(後退)
[call storage="data_Quest/comon_event.ks" target="*standing_guard"]
[jump target="*no_goal"]
[s]

*accident_05
;トリモチ（＋鈍足）
[call storage="data_Quest/comon_event.ks" target="*torimochi"]
[jump target="*no_goal"]
[s]

*accident_06
;猫の悲鳴（警戒＋）
[call storage="data_Quest/comon_event.ks" target="*torimochi"]
[jump target="*no_goal"]
[s]

*accident_07
;逢い引きを目撃（興奮＋）
[call storage="data_Quest/comon_event.ks" target="*romance_room"]
[jump target="*no_goal"]
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

[call storage="routin/Rt_warning.ks"]
[if exp="f.security >= f.security_MAX"]
[jump target="*event_executioner"]
[endif]

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
[call storage="battle/Rt_battle_end.ks"]
[call storage="routin/Rt_setStatus.ks"]
[call storage="asset/As_result.ks" target="*failed"]
[jump storage="data_prison/ushi_torture01.ks"]
[s]

;-------------------------------------------------------------------------------
*goal
#鈴耶
[chara_mod name="suzune" face="柔らか" ]
無事到着っと[p]
[call storage="routin/Rt_setStatus.ks"][eval exp="f.dress=1"]

[if exp="f.Qt_n_intrude01 != 1"]
[eval exp="f.Reward = 100"]
[else]
[eval exp="f.Reward = 50"]
[endif]

[eval exp="f.rootA += f.Reward"]
#
無事、玄部家から機密文書を盗むことが出来た[p]北條家との友好度が上昇した[p]
[jump storage="home.ks" target="*home_start"]

[WSs]

;-------------------------------------------------------------------------------
*result
[freeimage layer="0" ]
[call storage="asset/As_result.ks"]

[s]

;-------------------------------------------------------------------------------
*event_executioner
#
警戒度が最高潮に到達した[p]
「曲者だ！！！」[r]
「であえー！！であえー！！」[p]
#鈴耶
しまった！気づかれたか！！[p]
#？？
ほほう？逃げる気か？[p]
#鈴耶
！！[p]
#
背後からの声に振り返ると一人の忍者が立っていた[p]
#？？
逃がすと思うてか？[p]
#鈴耶
くっ！！押し通る！！[p]
;特殊演出--------
;牛鬼

;---------------
[call storage="battle/Rt_battle_start.ks"]
[eval exp="f.en_Name = '牛鬼'"]
[eval exp="f.Lv = 100, f.en_HP = 10000 "]
[eval exp="f.EN_STR = 20, f.EN_POW = 20, f.en_DEX=30 "]
[eval exp="f.GRB=200, f.EN_SEX=200 "]
[eval exp="f.EN_SAN= 100 + (f.security * 10) "]
[eval exp="f.type = 1, f.Round = 0"]
[WriteEnemy]
[call storage="data_enemy/EN_ushi_Executioner01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]
