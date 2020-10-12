*mission_start
@layopt layer=message0 visible=true
#鈴猫
それじゃあ、鈴猫[r]
忍務行ってまいりまーす！[p]
[cm]
@layopt layer=message0 visible=false
[chara_hide  name="suzune"  time=500]
[freeimage  layer="base"  ]

[wait time=1000]
[bg storage="mori_yoru.jpg" time="500"]
[chara_show  name="suzune"  left="-100" top="-50"]
[eval exp="f.goal=200 , f.progress=0 , f.Achievement=0"]

;暫定ステータス
[eval exp="f.HP = 100, f.SPD = 15, f.SAN = 100, f.Dirty=0, f.PL_MOVE = 10"]
[eval exp="f.ANAL = 100, f.VGNA = 100, f.BOOB = 100"]


;-------------------------------------------------------------------------------

*ready
[progressbar]
[glink  color="black"  target="*goahead"  x="350"  y="250"  width=""  height=""  text="先へ進む" ]
[glink  color="black"  target="*menu"  x="350"  y="350"  width=""  height=""  text="メニュー" ]
[glink  color="black"  target="*menu"  x="350"  y="450"  width=""  height=""  text="撤退する" ]
[s]

*menu
[cm]
@layopt layer=message1 visible=true
[current layer="message1"]
#鈴猫
残念！！[r]
そいつは未実装なのさー[p]
[jump target="*goahead"]

*goahead
[cm]
@layopt layer=message1 visible=true
[current layer="message1"]
[eval exp="f.ahead = f.PL_MOVE"]
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
[getrand min="1" max="110" var="f.event"]
[if exp="f.event<50"][jump target=*event_enemy]

[elsif exp="f.event<100"][jump target=*event_youkai]

;[elsif exp="f.event<80"][jump target=*event_trouble]

;[elsif exp="f.event<100"][jump target=*event_treasure]

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
*event_enemy
#
[getrand min="1" max="100" var="f.event"]
[if exp="f.event<40"]
荒くれ者が現れた[p]
[jump target=*enemy_01]
[elsif exp="f.event<60"]
野盗が現れた[p]
[jump target=*enemy_02]
[elsif exp="f.event<80"]
落ち武者が現れた[p]
[jump target=*enemy_03]
[else]
忍者が現れた[p]
[jump target=*enemy_04]
[endif]
[s]

;-------------------------------------------------------------------------------
*enemy_01
[eval exp="f.en_DEX=6"]
荒くれ者の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
10のダメージ[p]
[eval exp="f.HP = f.HP - 10"]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*no_goal"][s]

;-------------------------------------------------------------------------------
*enemy_02
[eval exp="f.en_DEX=8"]
野盗の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
10のダメージ[p]
[eval exp="f.HP = f.HP - 10"]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*no_goal"][s]

;-------------------------------------------------------------------------------
*enemy_03
[eval exp="f.en_DEX=8"]
落ち武者の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
10のダメージ[p]
[eval exp="f.HP = f.HP - 20"]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*no_goal"][s]

;-------------------------------------------------------------------------------
*enemy_04
[eval exp="f.en_DEX=10"]
忍者の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
10のダメージ[p]
[eval exp="f.HP = f.HP - 20"]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*no_goal"][s]

;-------------------------------------------------------------------------------
*defeat
#鈴猫
そ、そんな・・・[p]
#
鈴猫は気を失った[p]
[s]

;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
*event_youkai
#
[getrand min="1" max="100" var="f.event"]
[if exp="f.event<40"]
すらいむが現れた[p]
妖怪に遭遇したことで鈴猫の穢れが上昇[p]
[eval exp="f.Stain = f.Stain + 5"]
[jump target=*youkai_01]

[elsif exp="f.event<60"]
ひとだまが現れた[p]
妖怪に遭遇したことで鈴猫の穢れが上昇[p]
[eval exp="f.Stain = f.Stain + 5"]
[jump target=*youkai_02]

[elsif exp="f.event<80"]
一反木綿が現れた[p]
妖怪に遭遇したことで鈴猫の穢れが上昇[p]
[eval exp="f.Stain = f.Stain + 5"]
[jump target=*youkai_03]

[else]
大蛭が現れた[p]
妖怪に遭遇したことで鈴猫の穢れが上昇[p]
[eval exp="f.Dirty = f.Dirty + 5"]
[jump target=*youkai_04]
[endif]
[s]

;-------------------------------------------------------------------------------
*youkai_01
すらいむは鈴猫にまとわりついた[p]
すらいむは鈴猫の尻穴に潜り込んだ[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 10 "]
[eval exp="tf.tmp = tf.tmp * f.Dirty / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.ANAL / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[if exp="tf.tmp >= 100 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[endif]
すらいむは地面に吸い込まれるように消えた[p]
[jump target="*no_goal"][s]

;-------------------------------------------------------------------------------
*youkai_02
ひとだまは鈴猫に取りついた[p]
ひとだまは鈴猫の胸に吸い付いた[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 10 "]
[eval exp="tf.tmp = tf.tmp * f.Dirty / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.BOOB / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[if exp="tf.tmp >= 100 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[endif]
ひとだまは虚空に溶けるように消えた[p]
[jump target="*no_goal"][s]

;-------------------------------------------------------------------------------
*youkai_03
一反もめんは鈴猫を縛り上げた[p]
一反もめんが鈴猫の股間に食い込む[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 10 "]
[eval exp="tf.tmp = tf.tmp * f.Dirty / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.VGNA / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[if exp="tf.tmp >= 100 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[endif]
一反もめんは空へ舞い上がり姿を消した[p]
[jump target="*no_goal"][s]

;-------------------------------------------------------------------------------
*youkai_04
大蛭は鈴猫に取りついた[p]
大蛭は鈴猫の胸に吸い付いた[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 10 "]
[eval exp="tf.tmp = tf.tmp * f.Dirty / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.BOOB / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[if exp="tf.tmp >= 100 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[endif]
大蛭は茂みへと姿を消した[p]
[jump target="*no_goal"][s]


;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
*event_trouble





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
