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
[bg storage="japanese04_night_dark.jpg" time="500"]
[chara_show name="suzune" left="-100" top="-20"]
[eval exp="f.goal=200 , f.progress=0 , f.Achievement=0"]
[eval exp="f.NOISE = f.NOZ + f.arms_noz + f.acceA_noz + f.acceB_noz"]
[eval exp="f.security=1 , f.security_MAX=6 , f.warning=0"]
[eval exp="f.trap_04 = 0 , f.trap_02 = 0 , f.trap_03 = 0 , f.trapper = 0 "]
;暫定ステータス
[SetStatus]
[WSs]

;-------------------------------------------------------------------------------

*ready
[securitybar]
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

[eval exp="f.warning += f.NOISE"]
[eval exp="f.warning = 100" cond="f.warning > 100"]
[if exp="f.warning >= 100"]
#
警戒度が上昇。警備態勢が強化された。[p]
[eval exp="f.security += 1" cond="f.security_MAX > f.security"]
[eval exp="f.warning = 0" cond="f.security_MAX > f.security"]
[endif]
[if exp="f.security >= f.security_MAX"]
[jump target="*event_executioner"]
[endif]

[progressbar][securitybar]

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
[eval exp="f.Pre_event = 2"][jump target=*event_trap]

[elsif exp="f.event<=60 && f.Pre_event != 3"]
[eval exp="f.Pre_event = 3"][jump target=*event_trouble]

[else][jump target=*event_trouble]
[endif]

[s]

;-------------------------------------------------------------------------------
*event_enemy
#
[eval exp="f.En_Raptured = 0 , f.En_Wiseman_time = 0"]

[getrand min="1" max="120" var="f.event"]

[if exp="f.event<=30"]
番犬が現れた[p]
[eval exp="f.en_Name = '番犬'"][WriteEnemy]
[eval exp="f.Lv = 30 + (f.security * 10) , f.en_HP = 130 + (f.security * 10)"]
[eval exp="f.GRB = 70 + (f.security * 10), f.SEX = 100 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.en_DEX = 31 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_banken01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=60"]
見廻り兵卒（丑）が現れた[p]
[eval exp="f.en_Name = '見廻り兵卒（丑）'"][WriteEnemy]
[eval exp="f.Lv = 30 + (f.security * 10) , f.en_HP = 170 + (f.security * 10)"]
[eval exp="f.GRB = 90 + (f.security * 10), f.SEX = 90 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.en_DEX = 22 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_heishi01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=80"]
武士（丑）が現れた[p]
[eval exp="f.en_Name = '武士（丑）'"][WriteEnemy]
[eval exp="f.Lv = 30 + (f.security * 10) , f.en_HP = 290 + (f.security * 10)"]
[eval exp="f.GRB = 110 + (f.security * 10), f.SEX = 110 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.en_DEX = 24 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_bushi01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=100"]
下忍（丑）が現れた[p]
[eval exp="f.en_Name = '下忍（丑）'"][WriteEnemy]
[eval exp="f.Lv = 30 + (f.security * 10) , f.en_HP = 190 + (f.security * 10)"]
[eval exp="f.GRB = 100 + (f.security * 10), f.SEX = 140 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.en_DEX = 27 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_ninja01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=110"]
侍（丑）が現れた[p]
[eval exp="f.en_Name = '侍（丑）'"][WriteEnemy]
[eval exp="f.Lv = 40 + (f.security * 10) , f.en_HP = 400 + (f.security * 10)"]
[eval exp="f.GRB = 110 + (f.security * 10), f.SEX = 110 + (f.security * 10) "]
[eval exp="f.EN_STR = 14 + f.security, f.EN_POW = 9 + f.security, f.en_DEX = 27 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_samurai01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[else]
中忍（丑）が現れた[p]
[eval exp="f.en_Name = '中忍（丑）'"][WriteEnemy]
[eval exp="f.Lv = 40 + (f.security * 10) , f.en_HP = 180 + (f.security * 10)"]
[eval exp="f.GRB = 100 + (f.security * 10), f.SEX = 140 + (f.security * 10) "]
[eval exp="f.EN_STR = 9 + f.security, f.EN_POW = 9 + f.security, f.en_DEX = 29 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_ninja02.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[endif]
[s]

;-------------------------------------------------------------------------------
*event_trap
#
[getrand min="1" max="100" var="f.trap"]
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
[else]
[eval exp="f.Pre_trap = 0"]
[jump target=*event_trap]
[endif]
[s]

;--------------------------------------------
*trap_01
[call storage="data_trapp/comon01.ks"]
[jump target="*no_goal"]
[s]
;--------------------------------------------
*trap_02
#
[call storage="data_trapp/rope01.ks"]
[jump target="*trapper" cond="f.trapper > 0"]
[jump target="*no_goal"]
[s]
;--------------------------------------------
*trap_03
#
[call storage="data_trapp/cage01.ks"]
[jump target="*trapper" cond="f.trapper > 0"]
[jump target="*no_goal"]
[s]
;--------------------------------------------
*trap_04
#
[call storage="data_trapp/suraimu01.ks"]
[jump target="*trapper" cond="f.trapper > 0"]
[jump target="*no_goal"]
[s]
;--------------------------------------------
*trapper
酔漢が現れた[p]
[eval exp="f.en_Name = '酔漢'"][WriteEnemy]
[eval exp="f.Lv = 40 + (f.security * 10) , f.en_HP = 100 + (f.security * 10)"]
[eval exp="f.GRB = 120 + (f.security * 10), f.SEX = 120 + (f.security * 10) "]
[eval exp="f.EN_STR = 5 + f.security, f.en_DEX = 25 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_trapper.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]
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
;-------------------------------------------------------------------------------

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

*trouble_good_01
#
回復薬を見つけた[r]
鈴耶の体力が回復した[p]
[eval exp="f.HP += 100" ][eval exp="f.HP = 1000" cond="f.HP > 1000"]
[jump target="*no_goal"][s]

*trouble_good_02
#
通りがかった部屋の中から声がするので覗いてみた[p]
どうやら重要な話し合いのようだ[r]
念の為に内容と人相を覚えておくことにした[p]
鈴耶の集中力が増加した[p]
[eval exp="f.MND += 1" ][eval exp="f.MND = 5" cond="f.MND > 5"]
[jump target="*no_goal"][s]

*trouble_good_03
#
果物を見つけた[r]
鈴耶の気力が増加した[p]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[jump target="*no_goal"][s]

*trouble_good_04
#
見回りが居眠りをしている[r]
進行度が上昇した[p]
[eval exp="f.progress += 10"][eval exp="f.progress = f.goal" cond="f.progress > f.goal"]
[jump target="*goal" cond="f.progress >= f.goal"]
[jump target="*no_goal"][s]

;-------------------------------------------------------------------------------

*trouble_bad
[getrand min="1" max="70" var="f.trouble"]
[if exp="f.trouble <= 10 && f.Pre_trouble_b != 1"]
[eval exp="f.Pre_trouble_b = 1"]
[jump target=*trouble_bad_01]
[elsif exp="f.trouble <= 20 && f.Pre_trouble_b != 2"]
[eval exp="f.Pre_trouble_b = 2"]
[jump target=*trouble_bad_01]
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
不意打ち成功!![p]
[eval exp="f.ambush = 1"]
[else]
#敵
そこにいるのは何者だ！！[p]
#
不意打ちに失敗した[p]
[endif]
[jump target="*event_enemy"]
[s]

*trouble_bad_03
#
[getrand min="1" max="100" var="tf.rand"]
[if exp="tf.rand <= 70 "]
通りがかった部屋の中から声がするので覗いてみた[p]
荒縄で縛られた全裸の男が女中に踏まれている[p]
鈴耶の気力が減少した[p]
[eval exp="f.MP -= 10" ][eval exp="f.MP = 0" cond="f.MP < 0"]
[jump target="*no_goal"][s]
[else]
通りがかった部屋の中から声がするので覗いてみた[p]
しかし、誰もいなかった[r]背筋がゾクッとした[p]
鈴耶の気力が減少した[p]
[eval exp="f.MP -= 10" ][eval exp="f.MP = 0" cond="f.MP < 0"]
[jump target="*no_goal"][s]
[endif]

*trouble_bad_04
#
見廻りが立っている[p]
仕方がないので迂回することにした[p]
[eval exp="f.progress -= 10"][eval exp="f.progress = 0" cond="f.progress < 0"]
[jump target="*no_goal"][s]

*trouble_bad_05
#
トリモチに足を取られた[p]
鈴耶は鈍足状態になった[r]一時的に移動力が低下した[p]
[eval exp="f.slowly = 5" ][eval exp="f.slowly = 5" cond="f.slowly > 5"]
[jump target="*no_goal"][s]

*trouble_bad_06
#
うっかり猫の尾を踏んだ[p]
猫が悲鳴を上げた[r]周囲の警戒度が上昇した[p]
[eval exp="f.warning += 10" ]
[jump target="*no_goal"][s]

*trouble_bad_07
#
[getrand min="1" max="100" var="tf.rand"]
[if exp="tf.rand <= 70 "]
通りがかった部屋の中から声がするので覗いてみた[p]
女中と侍が情事の最中だった[p]
鈴耶は興奮状態になった[r]一時的に快感が減少しなくなった[p]
[eval exp="f.excite = 5" ][eval exp="f.excite = 5" cond="f.excite > 5"]
[jump target="*no_goal"][s]
[else]
通りがかった部屋の中から声がするので覗いてみた[p]
荒縄で縛りあげた女中を全裸の男が嬲っている[p]
鈴耶は興奮状態になった[r]一時的に快感が減少しなくなった[p]
[eval exp="f.excite = 5" ][eval exp="f.excite = 5" cond="f.excite > 5"]
[jump target="*no_goal"][s]
[endif]


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
牛王
[iscript]
tf.subtitle = "丑の国・筆頭牛王";
tf.title = "「剛力無敵」牛王" ;
[endscript]
[ptext layer="3" x="400" y="200" text=&tf.subtitle size="30" color="red" bold="bold" align="left"]
[ptext layer="3" x="450" y="300" text=&tf.title size="60" color="red" bold="bold" align="left"]
[wait time=1000]
[freeimage layer=3]
;---------------
[eval exp="f.en_Name = '牛王'"][WriteEnemy]
[eval exp="f.Lv = 100, f.en_HP = 10000 "]
[eval exp="f.EN_STR = 20, f.EN_POW = 20, f.en_DEX=30 "]
[eval exp="f.GRB=200, f.SEX=200 "]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/EN_ushi_Executioner.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
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
