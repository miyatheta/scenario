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
[bg storage="japanese02_evening.jpg" time="500"]
[bg storage="japanese02_night_dark.jpg" time="500"]
[eval exp="f.Quest_name='guard_ushi01.ks' , f.Quest_type=3"]
[eval exp="f.goal=100 , f.progress=0 , f.Cleared=0 , f.Achievement=0"]
[eval exp="f.security=1 , f.security_MAX=6 , f.warning=0 , f.turn=1"]
[eval exp="f.cantescape=1 "]
;護衛対象のスペック
[eval exp="f.Gd_MOVE=5 , f.Gd_MOVE_MAX=5 , f.Gd_slowly=0"]

;暫定ステータス
[SetStatus]
[WSs]
[chara_show name="suzune" left="-100" top="-20"]
;-------------------------------------------------------------------------------
@layopt layer=message0 visible=true
シナリオが入ります[p]
敵の襲撃だ！[p]
護衛対象が逃げる時間を稼げ[p]
護衛対象が規定距離を移動したら忍務達成[p]
;-------------------------------------------------------------------------------

*ready
;[securitybar]
[progressbar_guard]
[glink color="black" target="*goahead" x="400" y="250" width="" height="" text="迎え撃つ" ]
[glink color="black" target="*menu" x="400" y="350" width="" height="" text="メニュー" ]
;[glink color="black" target="*menu" x="400" y="450" width="" height="" text="撤退する" ]
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
;護衛任務用
[cm]
@layopt layer=message0 visible=true
[current layer="message0"]
[if exp="f.progress >= f.goal"]
[jump target=*goal]
[else]
[jump target=*select_enemy]
[endif]
[s]
;-------------------------------------------------------------------------------
*select_enemy
#
[if exp="f.turn >= 15 || f.progress >= 75"][jump target="*enemy_ex"]
[elsif exp="f.enemy == 1"][jump target="*enemy02"]
[elsif exp="f.enemy == 2"][jump target="*enemy03"]
[elsif exp="f.enemy == 3"][jump target="*enemy01"]
[else][jump target="*enemy01"]
？
[endif]

*enemy01
[eval exp="f.enemy = 1"]
下忍（丑）が現れた[p]
[call storage="process_initialize_enemy.ks"]
[eval exp="f.en_Name = '下忍（丑）'"][WriteEnemy]
[eval exp="f.Lv = 27 + (f.security * 10) , f.en_HP = 190 + (f.security * 10)"]
[eval exp="f.GRB = 100 + (f.security * 10), f.SEX = 140 + (f.security * 10) "]
[eval exp="f.EN_STR = 8 + f.security, f.EN_POW = 8 + f.security, f.en_DEX = 27 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_ninja01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
;[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

*enemy02
[eval exp="f.enemy = 2"]
暗殺者（丑）が現れた[p]
[call storage="process_initialize_enemy.ks"]
[eval exp="f.en_Name = '暗殺者（丑）'"][WriteEnemy]
[eval exp="f.Lv = 27 + (f.security * 10) , f.en_HP = 170 + (f.security * 10)"]
[eval exp="f.GRB = 90 + (f.security * 10), f.SEX = 90 + (f.security * 10) "]
[eval exp="f.EN_STR = 8 + f.security, f.EN_POW = 8 + f.security, f.en_DEX = 22 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_assasin01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

*enemy03
[eval exp="f.enemy = 3"]
中忍（丑）が現れた[p]
[call storage="process_initialize_enemy.ks"]
[eval exp="f.en_Name = '中忍（丑）'"][WriteEnemy]
[eval exp="f.Lv = 36 + (f.security * 10) , f.en_HP = 180 + (f.security * 10)"]
[eval exp="f.GRB = 100 + (f.security * 10), f.SEX = 140 + (f.security * 10) "]
[eval exp="f.EN_STR = 8 + f.security, f.EN_POW = 8 + f.security, f.en_DEX = 29 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_ninja02.ks"]
[jump target="*defeat" cond="f.HP < 1"]
;[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]


*enemy_ex
;特殊演出--------

;---------------
[call storage="process_initialize_enemy.ks"]
[eval exp="f.en_Name = '牛鬼'"][WriteEnemy]
[eval exp="f.Lv = 100, f.en_HP = 1000 "]
[eval exp="f.EN_STR = 20, f.EN_POW = 20, f.en_DEX=30 "]
[eval exp="f.GRB=200, f.SEX=200 "]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/EN_ushi_Executioner03.ks"]

[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
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
[call storage="routin/Rt_nogoal.ks"]

;[call storage="routin/Rt_warning.ks"]
;[if exp="f.security >= f.security_MAX"]
;[jump target="*event_executioner"]
;[endif]

[jump target="*ready"]
[s]

;-------------------------------------------------------------------------------
*defeat
#鈴耶
そ、そんな・・・[p]
#
鈴耶は気を失った[p]
[BattleFinsish]
[SetStatus]
[call storage="asset_result.ks"]
[jump storage="data_prison/ushi_torture01.ks"]
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

;-------------------------------------------------------------------------------
