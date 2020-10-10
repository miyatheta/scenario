*mission_start
@layopt layer=message0 visible=true
#鈴猫
それじゃあ、鈴猫[p]
忍務行ってまいりまーす！[p]
[cm]
@layopt layer=message0 visible=false
[chara_hide  name="suzune"  time=500]
[freeimage  layer="base"  ]

[wait time=1000]
[bg storage="mori_yoru.jpg" time="500"]
[chara_show  name="suzune"  left="-100" top="-50"]
[eval exp="f.goal=200 , f.progress=0 , f.Achievement=0"]

;-------------------------------------------------------------------------------

*ready
[progressbar]
[glink  color="black"  target="*goahead"  x="350"  y="250"  width=""  height=""  text="先へ進む" ]
[glink  color="black"  target="*menu"  x="350"  y="350"  width=""  height=""  text="メニュー" ]
[glink  color="black"  target="*menu"  x="350"  y="450"  width=""  height=""  text="撤退する" ]
[s]

*menu
#鈴猫
残念！！[r]
そいつは未実装なのさー[p]
[jump target="*goahead"]

*goahead
[cm]
[eval exp="f.ahead = f.PL_MOVE"]
[ptext  layer="0"  x="1240"  y="490"  text=&f.ahead  size="50"  color="red"  bold="bold"  name="movepower"  overwrite="true"  ]
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
[getrand min="1" max="110" var="f.event"]
[if exp="f.event<40"][jump target=*event_enemy]

[elsif exp="f.event<60"][jump target=*event_trap]

[elsif exp="f.event<80"][jump target=*event_trouble]

[elsif exp="f.event<100"][jump target=*event_treasure]

[else][jump target=*event_none]
[endif]

[s]





;-------------------------------------------------------------------------------
*no_goal
#鈴猫
[chara_mod  name="suzune"  face="happy"  cross="true"  ]
まだまだ行くよー[cm]
[chara_mod  name="suzune"  face="default"  cross="false"  ]
[jump target="*ready"]
[s]

;-------------------------------------------------------------------------------
*goal
#鈴猫
[chara_mod  name="suzune" face="happy"  ]
無事とおちゃく、っと！[p]

*result
[cm][clearfix][freeimage layer=1]
#鈴猫
Homeに戻るよ！[p]
[jump storage="home.ks" target="*home_start"]
[s]
