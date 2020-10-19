*mission_start
@layopt layer=message0 visible=true
#鈴猫
それじゃあ、鈴猫[r]
忍務行ってまいりまーす！[p]
[cm]
@layopt layer=message0 visible=false
[chara_hide name="suzune" time=500]
[freeimage layer="base" ]

[wait time=1000]
[bg storage="mori_yoru.jpg" time="500"]
[chara_show name="suzune" left="-100" top="-50"]
[eval exp="f.goal=200 , f.progress=0 , f.Achievement=0"]

;暫定ステータス
[eval exp="f.HP = 1000, f.SPD = 15, f.SAN = 60, f.CURSE=0, f.ERO=0, f.PL_MOVE = 10"]
[eval exp="f.STR = 100 , f.POW=60"]
[eval exp="f.ANAL = 100, f.VGNA = 100, f.BOOB = 100"]
[WSs]

;-------------------------------------------------------------------------------

*ready
[progressbar]
[glink color="black" target="*goahead" x="350" y="250" width="" height="" text="先へ進む" ]
[glink color="black" target="*menu" x="350" y="350" width="" height="" text="メニュー" ]
[glink color="black" target="*menu" x="350" y="450" width="" height="" text="撤退する" ]
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
[eval exp="f.en_DEX = 6, f.en_HP = 105"]
[jump target=*enemy_01]

[elsif exp="f.event<60"]
野盗が現れた[p]
[eval exp="f.en_DEX=8, f.en_HP = 110"]
[jump target=*enemy_02]

[elsif exp="f.event<80"]
落ち武者が現れた[p]
[eval exp="f.en_DEX=8, f.en_HP = 120"]
[jump target=*enemy_03]

[else]
忍者が現れた[p]
[eval exp="f.en_DEX=10, f.en_HP = 110"]
[jump target=*enemy_04]

[endif]
[s]

;-------------------------------------------------------------------------------
*enemy_01
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.ATP = f.STR + f.rand"]
鈴猫の攻撃[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[if exp="f.en_HP < 1"]
荒くれ者を倒した[p]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 80"]
[jump target="*enemy_01_attack"]
[else]
[jump target="*enemy_01_sexhara"]
[endif]

*enemy_01_attack
荒くれ者の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
100のダメージ[p]
[eval exp="f.HP = f.HP - 100"][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*enemy_01"][s]

*enemy_01_sexhara
荒くれ者は鈴猫の胸に吸い付いた[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.BOOB / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][WSs]
[if exp="f.ERO >= 1000 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[endif]
[jump target="*enemy_01"][s]

;-------------------------------------------------------------------------------
*enemy_02
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.ATP = f.STR + f.rand"]
鈴猫の攻撃[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[if exp="f.en_HP < 1"]
野盗を倒した[p]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 80"]
[jump target="*enemy_02_attack"]
[else]
[jump target="*enemy_02_sexhara"]
[endif]

*enemy_02_attack
野盗の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
100のダメージ[p]
[eval exp="f.HP = f.HP - 100"][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*enemy_02"][s]

*enemy_02_sexhara
野盗は鈴猫の尻を撫で回した[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.ANAL / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][WSs]
[if exp="f.ERO >= 1000 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[endif]
[jump target="*enemy_02"][s]

;-------------------------------------------------------------------------------
*enemy_03
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.ATP = f.STR + f.rand"]
鈴猫の攻撃[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[if exp="f.en_HP < 1"]
落ち武者を倒した[p]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 80"]
[jump target="*enemy_03_attack"]
[else]
[jump target="*enemy_03_sexhara"]
[endif]

*enemy_03_attack
落ち武者の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
200のダメージ[p]
[eval exp="f.HP = f.HP - 200"][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*enemy_03"][s]

*enemy_03_sexhara
落ち武者は鈴猫の胸に揉みしだいた[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.BOOB / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][WSs]
[if exp="f.ERO >= 1000 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[endif]
[jump target="*enemy_03"][s]

;-------------------------------------------------------------------------------
*enemy_04
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.ATP = f.STR + f.rand"]
鈴猫の攻撃[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[if exp="f.en_HP < 1"]
忍者を倒した[p]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 80"]
[jump target="*enemy_04_attack"]
[else]
[jump target="*enemy_04_sexhara"]
[endif]

*enemy_04_attack
忍者の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
200のダメージ[p]
[eval exp="f.HP = f.HP - 200"][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*enemy_04"][s]

*enemy_04_sexhara
忍者は鈴猫の女陰をまさぐった[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.VGNA / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][WSs]
[if exp="f.ERO >= 1000 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[endif]
[jump target="*enemy_04"][s]

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
妖怪に遭遇したことで鈴猫の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 20"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 105"]
[jump target=*youkai_01]

[elsif exp="f.event<60"]
ひとだまが現れた[p]
妖怪に遭遇したことで鈴猫の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 30"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 105"]
[jump target=*youkai_02]

[elsif exp="f.event<80"]
一反木綿が現れた[p]
妖怪に遭遇したことで鈴猫の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 20"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 105"]
[jump target=*youkai_03]

[else]
触手塊が現れた[p]
妖怪に遭遇したことで鈴猫の淫気が上昇[p]
[eval exp="f.CURSE = f.CURSE + 50"][WSs]
[eval exp="f.en_DEX = 50, f.en_HP = 120"]
[jump target=*youkai_04]
[endif]
[s]

;-------------------------------------------------------------------------------
*youkai_01
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.ATP = f.POW + f.rand"]
鈴猫の攻撃[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[if exp="f.en_HP < 1"]
すらいむを倒した[p]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_01_attack"]
[else]
[jump target="*youkai_01_sexhara"]
[endif]

*youkai_01_attack
すらいむの攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
鈴猫のすばやさが3減少[p]
[eval exp="f.SPD = f.SPD - 3"][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*youkai_01"][s]

*youkai_01_sexhara
すらいむは鈴猫にまとわりついた[p]
すらいむは鈴猫の尻穴に潜り込んだ[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.ANAL / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][WSs]
[if exp="f.ERO >= 1000 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[endif]
;すらいむは地面に吸い込まれるように消えた[p]
[jump target="*youkai_01"][s]

;-------------------------------------------------------------------------------
*youkai_02
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.ATP = f.POW + f.rand"]
鈴猫の攻撃[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[if exp="f.en_HP < 1"]
ひとだまを倒した[p]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_02_attack"]
[else]
[jump target="*youkai_02_sexhara"]
[endif]

*youkai_02_attack
ひとだまの攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
鈴猫の精神力が１減少[p]
[eval exp="f.POW = f.POW - 1"][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*youkai_02"][s]

*youkai_02_sexhara
ひとだまは鈴猫に取りついた[p]
ひとだまは鈴猫の胸に吸い付いた[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 50 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.BOOB / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][WSs]
[if exp="f.ERO >= 1000 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[endif]
;ひとだまは虚空に溶けるように消えた[p]
[jump target="*youkai_02"][s]

;-------------------------------------------------------------------------------
*youkai_03
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.ATP = f.POW + f.rand"]
鈴猫の攻撃[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[if exp="f.en_HP < 1"]
一反もめんを倒した[p]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_03_attack"]
[else]
[jump target="*youkai_03_sexhara"]
[endif]

*youkai_03_attack
一反もめんの攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
鈴猫の腕力が１減少[p]
[eval exp="f.STR = f.STR - 1"][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*youkai_03"][s]

*youkai_03_sexhara
一反もめんは鈴猫を縛り上げた[p]
一反もめんが鈴猫の股間に食い込む[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 50 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.VGNA / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][WSs]
[if exp="f.ERO >= 1000 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[endif]
;一反もめんは空へ舞い上がり姿を消した[p]
[jump target="*youkai_03"][s]

;-------------------------------------------------------------------------------
*youkai_04
[getrand min="1" max="20" var="f.rand"]
[eval exp="tf.ATP = f.POW + f.rand"]
鈴猫の攻撃[r]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.en_HP = f.en_HP - tf.ATP"]
[if exp="f.en_HP < 1"]
触手塊を倒した[p]
[jump target="*no_goal"][s]
[endif]

[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
[jump target="*youkai_04_attack"]
[else]
[jump target="*youkai_04_sexhara"]
[endif]

*youkai_04_attack
触手塊の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50"]
[if exp="f.hit > f.rand"]
鈴猫は敵の攻撃を回避した[p]
[else]
鈴猫のすばやさが５減少[p]
[eval exp="f.SPD = f.SPD - 5"][WSs]
[endif]
[if exp="f.HP < 1"][jump target="*defeat"][endif]
[jump target="*youkai_04"][s]

*youkai_04_sexhara
触手塊は鈴猫に取りついた[p]
触手塊は鈴猫の胸に吸い付いた[p]
#鈴猫
ひっ！！[p]
[eval exp="tf.tmp = 200 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.round = tf.tmp * f.BOOB / 100 "]
[getMathRound var="tf.tmp"]
鈴猫は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][WSs]
[if exp="f.ERO >= 1000 "]
鈴猫は絶頂した[p]
鈴猫の理性が１減少した[p]
[eval exp="f.SAN -= 1"]
[eval exp="f.ERO = 0"]
[endif]
;触手塊は茂みへと姿を消した[p]
[jump target="*youkai_04"][s]


;-------------------------------------------------------------------------------
;-------------------------------------------------------------------------------
*event_trouble





;-------------------------------------------------------------------------------
*no_goal
#鈴猫
[chara_mod name="suzune" face="happy" cross="true" ]
[eval exp="f.ERO = f.ERO - f.SAN"]
[eval exp="f.ERO = 0" cond="f.ERO < 1"][WSs]
まだまだ行くよー[cm]
[chara_mod name="suzune" face="default" cross="false" ]
[jump target="*ready"]
[s]

;-------------------------------------------------------------------------------
*goal
#鈴猫
[chara_mod name="suzune" face="happy" ]
無事とおちゃく、っと！[p]

*result
[cm][clearfix][freeimage layer=1]
#鈴猫
Homeに戻るよ！[p]
[jump storage="home.ks" target="*home_start"]
[s]
