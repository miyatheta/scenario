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
[bg storage="japanese04_night_dark.jpg" time="500"]
[eval exp="f.Quest_name='guard_ushi01.ks' , f.Quest_type=3"]
[eval exp="f.goal=200 , f.progress=0 , f.Cleared=0 , f.Achievement=0"]
[eval exp="f.security=1 , f.security_MAX=6 , f.warning=0 , f.turn=1"]
[eval exp="f.trap_04 = 0 , f.trap_02 = 0 , f.trap_03 = 0 , f.trapper = 0 "]
;護衛対象のスペック
[eval exp="f.Gd_MOVE=5 , f.Gd_MOVE_MAX=5 , f.Gd_slowly=0"]

;暫定ステータス
[SetStatus]
[WSs]
[chara_show name="suzune" left="-100" top="-20"]
;-------------------------------------------------------------------------------
シナリオが入ります[p]
敵の襲撃だ！[p]
護衛対象が逃げる時間を稼げ[p]
護衛対象が規定距離を移動したら忍務達成[p]
;-------------------------------------------------------------------------------

*ready
;[securitybar]
;[progressbar]
[glink color="black" target="*goahead" x="400" y="250" width="" height="" text="先へ進む" ]
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

*select_enemy
#

*enemy01
[call storage="process_initialize_enemy.ks"]
下忍（丑）が現れた[p]
[eval exp="f.en_Name = '下忍（丑）'"][WriteEnemy]
[eval exp="f.Lv = 30 + (f.security * 10) , f.en_HP = 190 + (f.security * 10)"]
[eval exp="f.GRB = 100 + (f.security * 10), f.SEX = 140 + (f.security * 10) "]
[eval exp="f.EN_STR = 8 + f.security, f.EN_POW = 8 + f.security, f.en_DEX = 27 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_ninja01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
;[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

*enemy02
[call storage="process_initialize_enemy.ks"]
侍（丑）が現れた[p]
[eval exp="f.en_Name = '侍（丑）'"][WriteEnemy]
[eval exp="f.Lv = 40 + (f.security * 10) , f.en_HP = 400 + (f.security * 10)"]
[eval exp="f.GRB = 110 + (f.security * 10) , f.SEX = 110 + (f.security * 10) "]
[eval exp="f.EN_STR = 13 + f.security, f.EN_POW = 8 + f.security, f.en_DEX = 27 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_samurai01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
;[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

*enemy03
中忍（丑）が現れた[p]
[eval exp="f.en_Name = '中忍（丑）'"][WriteEnemy]
[eval exp="f.Lv = 40 + (f.security * 10) , f.en_HP = 180 + (f.security * 10)"]
[eval exp="f.GRB = 100 + (f.security * 10), f.SEX = 140 + (f.security * 10) "]
[eval exp="f.EN_STR = 8 + f.security, f.EN_POW = 8 + f.security, f.en_DEX = 29 + f.security"]
[eval exp="f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_ninja02.ks"]
[jump target="*defeat" cond="f.HP < 1"]
;[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[endif]
[s]

;-------------------------------------------------------------------------------

*goahead
[cm]
@layopt layer=message0 visible=true
[current layer="message0"]
[call storage="routin_progress.ks" target="*guard"]

[if exp="f.progress >= f.goal"]
[jump target=*goal]

[else]
[endif]

;-------------------------------------------------------------------------------

*select_event
[eval exp="f.Pre_event = 0"]
[getrand min="1" max="90" var="f.event"]

[if exp="f.event<=50 && f.Pre_event != 1"]
[eval exp="f.Pre_event = 1"][return]

[elsif exp="f.event<=20 && f.Pre_event != 2"]
[eval exp="f.Pre_event = 2"][return]

[elsif exp="f.event<=20 && f.Pre_event != 3"]
[eval exp="f.Pre_event = 3"][return]

[else]
[jump target=*select_incident]
[endif]
[s]

;-------------------------------------------------------------------------------

*select_normal

[return]
