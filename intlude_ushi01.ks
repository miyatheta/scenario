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
[eval exp="f.security=0 , f.security_MAX=5 , f.warning=0"]
[eval exp="f.trap_04 = 0 , f.trap_02 = 0 , f.trap_03 = 0"]
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
[eval exp="f.Lv = 40, f.EN_STR = 10, f.EN_POW = 10, f.en_DEX = 32, f.GRB=80, f.en_HP = 120 , f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_banken01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=60"]
見廻り兵卒（丑）が現れた[p]
[eval exp="f.en_Name = '見廻り兵卒（丑）'"][WriteEnemy]
[eval exp="f.Lv = 40, f.EN_STR = 10, f.EN_POW = 10, f.en_DEX=23, f.GRB=100, f.SEX=100 , f.en_HP = 180 , f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_heishi01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=80"]
武士（丑）が現れた[p]
[eval exp="f.en_Name = '武士（丑）'"][WriteEnemy]
[eval exp="f.Lv = 40, f.EN_STR = 10, f.EN_POW = 10, f.en_DEX=25, f.GRB=120, f.SEX=120, f.en_HP = 300 , f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_bushi01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=100"]
下忍（丑）が現れた[p]
[eval exp="f.en_Name = '下忍（丑）'"][WriteEnemy]
[eval exp="f.Lv = 40, f.EN_STR = 10, f.EN_POW = 10, f.en_DEX=28, f.GRB=110, f.SEX=150 , f.en_HP = 200 , f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_ninja01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[elsif exp="f.event<=110"]
侍（丑）が現れた[p]
[eval exp="f.en_Name = '侍（丑）'"][WriteEnemy]
[eval exp="f.Lv = 50, f.EN_STR = 15, f.EN_POW = 10, f.en_DEX=28, f.GRB=120, f.SEX=120, f.en_HP = 400 , f.type = 1, f.Round = 0"]
[call storage="data_enemy/En_ushi_samurai01.ks"]
[jump target="*defeat" cond="f.HP < 1"]
[jump target="*escape" cond="f.escape > 0"]
[jump target="*battle_end" cond="f.en_HP < 1"]
[s]

[else]
中忍（丑）が現れた[p]
[eval exp="f.en_Name = '中忍（丑）'"][WriteEnemy]
[eval exp="f.Lv = 50, f.EN_STR = 10, f.EN_POW = 10, f.en_DEX=30, f.GRB=100, f.SEX=150 , f.en_HP = 190 , f.type = 1, f.Round = 0"]
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
[jump target=*trap]
[endif]
[s]

;--------------------------------------------
*trap_01
#
踏んだ床板から作動音がした[r]罠だ！！[p]
[glink color="black" target="*trap_01try" x="400" y="250" width="" height="" text="気力を使って回避に挑む" ]
[glink color="black" target="*trapped_01" x="400" y="350" width="" height="" text="おとなしく罠にかかる" ]
[s]
*trap_01try
[if exp="f.MP < 10"]
#
気力が足りない！！[p]
[jump target="*trapped_01"]
[endif]
[eval exp="f.MP -= 10"]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand > 50"]
鈴耶は罠を回避することに成功した！！[p]
[jump target="*no_goal"][s]
[else]
鈴耶は罠を回避できなかった！！[p]
[endif]
*trapped_01
壁に空いた穴から矢が飛んできた！！[p]
直撃は避けたがかすめた傷口が痺れる[r]
どうやら毒矢のようだ[p]
毒状態になった[p]一時的に行動のたびにダメージを受ける[p]
[eval exp="f.poison = 5" ][eval exp="f.poison = 5" cond="f.poison > 5"]
[jump target="*no_goal"][s]

;--------------------------------------------

*trap_02
#
踏んだ床板から作動音がした[r]罠だ！！[p]
[glink color="black" target="*trap_02try" x="400" y="250" width="" height="" text="気力を使って回避に挑む" ]
[glink color="black" target="*trapped_02" x="400" y="350" width="" height="" text="おとなしく罠にかかる" ]
[s]
*trap_02try
[if exp="f.MP < 10"]
#
気力が足りない！！[p]
[jump target="*trapped_02"]
[endif]
[eval exp="f.MP -= 10"]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand > 50"]
鈴耶は罠を回避することに成功した！！[p]
[jump target="*no_goal"][s]
[else]
鈴耶は罠を回避できなかった！！[p]
[endif]
*trapped_02
#
四方と床から鈎付きの縄が射出された[r]捕縛の罠だ！！[p]
絡め取られた鈴耶の大きく開いた股の間に縄が打たれた[p]
#鈴耶
ちょっ！！イヤっ！！何これ！！[p]
#
縄の端が天井に向けて引き上げられ、鈴耶の股座に縄が容赦なく食い込む[p]
#鈴耶
ふぎっ！！[p]
#
何とか縄を逃れようとするものの既に足先が床を離れており、もがけばもがくほど秘部を縄に擦り付ける結果になってしまう[p]
さらに絡繰の作動音と共に股座の縄が巻き上げられ始めた[p]
#鈴耶
ひぎっ！！あっ！！ひあっ！！[p]
#
股の間を、前から後ろに縄が巻き上げられていく[p]
引き上げるのが目的ではないらしく、巻き上げられたのと同じだけの縄が新たに供給されてくる[p]
が、新たに送られて来る縄には無数の結び目が作られていた[p]
#鈴耶
あんっ！！ひんっ！！いやっ！止め、てぇっ！！[p]
#
結び目が股座を通過するたびに、女陰を刺激された鈴耶の悲鳴が上がる[p]
縛り上げられ自由の利かない手足の先がびくびくと痙攣を繰り返す[p]
;快感ダメージ
[eval exp="tf.fack = 100 "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.VGNA / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"][SKEBE][WSs]
;絶頂
[if exp="f.ERO >= 1000"]
#鈴耶
（いやっ！！こんな仕掛けでぇ！！）[p]
イクイクイク、イクーーーーーーー！！！[p]
#
鈴耶は絶頂した[p]
[orgasm]
[endif]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand > 90"]
・・・・・・・・・・・・・・・・・・・・・・・・[p]
#鈴耶
や、やっと、止まった？[p]
#
ようやく絡繰が止まり、鈴耶は息も絶え絶えに顔を上げた[p]
荒縄によって虐められた女陰は愛液にぬれそぼち、太股はもちろん、床にまで染みを作っていた[p]
#鈴耶
(は、早く縄を解かないと)[p]
#
こんなところを敵に見つかっては堪ったものではない[p]
しかし・・・[p]
#？？
おやぁ？間抜けな雌猫が罠にかかってやがるぞ！！[p]
#
突然かけられた男の声に鈴耶の顔から血の毛が引いた[p]
[jump target="*trappman"]
[else]
・・・・・・・・・・・・・・・・・・・・・・・・[p]
絡繰が止まってから、ようやく鈴耶は縄を解いて自由になることができた[p]
その間、鈴耶の秘部を嬲り続けていた縄はすっかり愛液で濡れそぼっていた[p]
#鈴耶
(て、敵が通りかからなくて良かったわ・・・)
#
[jump target="*no_goal"][s]
[endif]

;--------------------------------------------

*trap_03
#
踏んだ床板から作動音がした[r]罠だ！！[p]
[glink color="black" target="*trap_03try" x="400" y="250" width="" height="" text="気力を使って回避に挑む" ]
[glink color="black" target="*trapped_03" x="400" y="350" width="" height="" text="おとなしく罠にかかる" ]
[s]
*trap_03try
[if exp="f.MP < 10"]
#
気力が足りない！！[p]
[jump target="*trapped_03"]
[endif]
[eval exp="f.MP -= 10"]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand > 50"]
鈴耶は罠を回避することに成功した！！[p]
[jump target="*no_goal"][s]
[else]
鈴耶は罠を回避できなかった！！[p]
[endif]

*trapped_03
#
天井に穴が空き、無数の鉄の輪が落ちてきた[r]拘束の罠だ[p]
[eval exp="f.trap_03 = 1" cond="f.trap_03 != 1"]
[if exp="f.trap_03 == 1 "]
円筒状に鋼線で連なった鉄の輪はすぼまるように径を縮め、
胸の上、胸の下、腰の高さ、腿の４箇所で鈴耶を拘束してしまった[p]
腕を体の両脇にぴったりとくっつけ、まるで杭のように直立した格好になった鈴耶の頬に冷や汗が浮かぶ[p]
#鈴耶
（まずいわ。こんなところに敵が来たら）[p]
#
「お、なんだ？なんだ？」[p]
悪い想像はすぐに現実に変わる[p]
通りがかりの武士が直立不動になっている鈴耶を見つけてしまった[p]
#鈴耶
(あちゃああああ！！)[p]
#
絶望的な表情を浮かべた鈴耶の元に武士が近寄ってくる[p]
#武士
おおう！！これはこれは！！スケベな格好の嬢ちゃんが罠にかかってるぜ！！[p]
#
武士は扇情的な鈴耶の格好を見て鼻息を荒くして顔を近づけた[p]
その息は・・・・・とてつもなく酒臭い[p]
#鈴耶
（しめた！！この分だとマトモな判断力はなさそうね！！）[p]
#
何とか言いくるめられないかと考えを巡らす鈴耶だが、考えなしの酔っぱらいはそれより先に暴挙に及んだ[p]
[else]
鉄の輪によって直立不動に固められた鈴耶の元に酔っ払いが近づいてきた[p]
#鈴耶
い、いや、来ないでーー！！[p]
#
[endif]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand > 50"]
酔っぱらいは身動き取れない鈴耶の胸を鷲掴みにすると、もにゅもにゅと揉みしだいた[p]
#鈴耶
ひっ！！[p]
#
酔っ払いはその感触を気に入ったのか、２度３度と揉みしだくと鈴耶の装束の合わせを割り開いた[p]
その途端、鉄帯によって上下を締め上げられていた鈴耶の胸はまるで弾けるようにまろびでた[p]
#酔っぱらい
ひょおおおおおお！！おっぱああああああ！！[p]
#鈴耶
（ちょっ！！声が大きいいーーー！！）[p]
#
歓声を上げた酔っ払いは辛抱堪らんとばかりに、震える乳果実の先端[p]
ピンク色の先端部にむしゃぶりついた[p]
#鈴耶
ひいいいっ！！[p]
#
鈴耶の爆乳に顔を埋めるようにしてしゃぶり、舐め回し、吸い付き、舌で転がす[p]
その間も、もう一方の乳房は鷲掴みにしたまま揉みしごきこねくり回している[p]
余ったもう一本の腕は逃げようとする鈴耶を抑え込むべく腰に回され、尻肉を撫で回していた[p]
#鈴耶
あんっ！もうっ！ちょっ！！落ち着いんんっ！！[p]
#
男のギラつく瞳と異様な熱気に当てられたのか、最初は怯え気味だった鈴耶も徐々に上ずった声を上げ始めていた[p]
相当な女日照りだったのか。酔っぱらいは貪るように鈴耶の体を弄び尽くした[p]
#鈴耶
あんっ！あうっ！おっぱい取れちゃううう！！いやあああっ！！[p]
#
;快感ダメージ
[eval exp="tf.fack = 100 "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.BOOB / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"][SKEBE][WSs]

[else]
酔っぱらいは身動き取れない鈴耶の背後に回ると、ぴったりと合わさった太股に取り出した魔羅を挿し込んだ[p]
#鈴耶
ひいっ！！[p]
#
酔っ払いはそのままずりずりと鈴耶の太股の間に肉棒を抽挿しはじめた[p]
鍛え上げられた筋肉によるハリと、その上にしっかりと乗った脂肪の柔らかさと、女らしい滑らかな肌[p]
#酔っぱらい
まるでマンコ！！いや嬢ちゃんの腿はマンコ以上や！！！[p]
#鈴耶
（ちょっ！！声が大きいいーーー！！）[p]
#
訳のわからないことを妙な口調で喚く男はすっかり鈴耶の強制素股の虜になったようだ[p]
拘束により膣への挿入こそ出来ないが、股布１枚を隔てた女唇を男の肉棒が幾度も擦り、刺激してくる[p]
#鈴耶
あんっ！いやんっ！！止め、てぇっ！！[p]
#
敵地での異常な状況、男のギラつく瞳と異様な熱気。最初は怯え気味だった鈴耶も徐々に上ずった声を上げ始めた[p]
男は鈴耶の柔腰を両手でしっかりと掴むと、今や本当の性交さながらに激しく腰を振っていた[p]
男が腰を打ち付けるたび鈴耶の尻が乾いた音を、抜き差しのたびに秘部は湿った音が響かせる[p]
#鈴耶
ああっ！！もうっ！！こんなの、いっ！！やぁっ！！[p]
#酔っぱらい
うおおおお！！極上！！極上ッ！！うっ！！・・・・[p]
#
男の陰茎がひときわ大きく膨らんだと思うと、鈴耶の股座の中に劣情を弾けさせた[p]
#鈴耶
んひいいいいいいいいいいっ！！[p]
#
密着した太股の中でぶちまけられた精液は出口を求め、圧力に押される形で股座の前後から飛沫となって噴出した[p]
;快感ダメージ
[eval exp="tf.fack = 100 "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.VGNA / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"][SKEBE][WSs]
[endif]

;絶頂
[if exp="f.ERO >= 1000"]
#鈴耶
（いやあっ！！こんな変態なんかにぃ！！イかされたくないのにぃぃぃ！！！）[p]
だめぇ！！！イクっイクイクイクーーーーーーーっ！！！[p]
#
鈴耶は絶頂した[p]
[orgasm]
[endif]
[getrand min="1" max="100" var="f.rand"]

[if exp="f.rand > 90"]

・・・・・・・・・・・・・・・・・・・・・・・・[p]
#鈴耶
や、やっと、終わり？[p]
#
ようやく男が止まり鈴耶は上気した顔を上げた[p]
#鈴耶
(は、早く罠を解除しないと)[p]
#
男の狼藉のおかげで若干緩んだらしい、罠を何とか解除していく[p]
しかし・・・[p]
#酔っぱらい
だめだぁ！！やっぱ本番もやらせろおおおおぉっ！！！[p]
#
寝落ちたと思っていた男が跳ね起きると、鈴耶に再び飛びかかってきた[p]
#鈴耶
ひいいいいいいいいいいいっ！！！[p]
#
[jump target="*trappman"]
[else]
#
・・・・・・・・・・・・・・・・・・・・・・・・[p]
狼藉に疲れた男が止まって（なんと寝落ちた）ようやく鈴耶は罠を解いて自由になることができた[p]
男の股間を踏み潰してやりたい欲求を何とか押さえつけ、鈴耶はその場を立ち去った[p]
#鈴耶
(酷い目にあったわ。早く忍務にもどらないと・・・)
#
[jump target="*no_goal"][s]
[endif]

;--------------------------------------------

*trap_04
踏んだ床板から作動音がした[r]罠だ！！[p]
[glink color="black" target="*trap_04try" x="400" y="250" width="" height="" text="気力を使って回避に挑む" ]
[glink color="black" target="*trapped_04" x="400" y="350" width="" height="" text="おとなしく罠にかかる" ]
[s]
*trap_04try
[if exp="f.MP < 10"]
#
気力が足りない！！[p]
[jump target="*trapped_04"]
[endif]
[eval exp="f.MP -= 10"]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand > 50"]
鈴耶は罠を回避することに成功した！！[p]
[jump target="*no_goal"][s]
[else]
鈴耶は罠を回避できなかった！！[p]
[endif]
*trapped_04
足元の床がばくりと口を開き、鈴耶は落下した[r]落とし穴だ！！[p]
[eval exp="f.trap_04 = 1" cond="f.trap_04 != 1"]
[if exp="f.trap_04 == 1 "]
落とし穴の底に待つのは槍の山か剣の山か？と身構えた鈴耶だったが、その身を包んだのは盛大な水飛沫だった[p]
#鈴耶
いたっ！！み！？水？[p]
#
落とし穴の先はなにかの液体が注がれた大きな桶のようだった[p]
水量はさして多いものではない。せいぜい膝の高さ程度だ[p]
元は薄い板で蓋がしてあったようだが、鈴耶の落下で見事に砕け散っている[p]
その時の衝撃で頭から全身くまなく液体を被ってしまったが、特に危険な刺激や匂いは感じない[p]
#鈴耶
何だか分からないけど早く脱出しないと・・・[p]
#
落下した高さは2.5メートルほど。落とし穴の内壁も使えば脱出は難しくないはずだ[p]
そう考えて鈴耶は跳躍しようと身を屈め[l]たところで足を取られてひっくり返った。再び水しぶきが上がる[p]
#鈴耶
うう・・・何なのよぉ[p]
#
尻もちをついたまま何に足を取られたのかと水中を探ると蓋の残骸が手に触れた[p]
拾い上げて目を凝らしてみて、[l]そして気が付く[l]蓋に貼られていた封魔の札に[p]
半身が浸かっている「液体」がぞわりと蠢いた[p]
#鈴耶
これ！？まさか妖怪！！[p]
#
水妖を封印した桶を落とし穴の底に設置しておく[p]
人間が罠に落ちると封印が解け妖怪が対象を無力化する[p]
#鈴耶
（なんてこと考えるのよ！！）[p]
#
妖怪を人の住まいの近く置いておくなど正気の沙汰ではない[p]
鈴耶は慌てて立ち上がろうとしたが、水妖がそれを許さなかった[p]
全身を覆う液体が瞬時に強い粘性を持った粘液へと変じて鈴耶の動きを封じる[p]
#鈴耶
くううっ！？[p]
#
先程までただの水と思っていたものは、いまやおぞましい粘性と瘴気を纏った水妖の身体となっていた[p]
そして、獲物を捕らえた妖怪の行うことは唯一つ、汚染と陵辱である[p]
[else]
#
落とし穴の底には水妖が封印されていた[p]
鈴耶の落下によって封印を解かれた水妖は罠に落ちた哀れな獲物に牙を剥いた[p]
[endif]
水妖は鈴耶に纏わり付くと、全身を舐り始めた[p]
#鈴耶
んっ！？あっ！！ううん！！[p]
#
胸を覆い、乳首を吸い、脇を舐め、耳をくすぐる[p]
#鈴耶
あっ！！んんっ！！ひゃっ！！ふっ！！[p]
#
臍をほじり、腿を這い回り、足の裏をねぶる[p]
#鈴耶
ひっ！！はあっ！！ああっ！！んあああああああっ！？[p]
#
菊座に流れ込み、その皺を広げ、穴の上でとぐろを巻くに至り、鈴耶は身を反らして悲鳴を上げた[p]
#鈴耶
しょ、しょこはあああああ・・・[p]
#
菊門の入り口で渦を巻く水妖。尻臀が広げられ、渦の中心の穴から外気が尻穴の中にまで流れ込む[p]
異様な感触に鈴耶は目を見開く。歯の根が合わずがちがちと音を立てる。そして[p]
その身を螺旋状の錐へと変えた水妖は鈴耶の体内へと一気に流れ込んだ[p]
#鈴耶
ひっぎいいいいいいいい！！！[p]
#
まるで桶の底に穴を開けたかのように、渦を巻きながら水妖の身体が鈴耶の尻穴の中へと吸い込まれて行く[p]
それに伴い鈴耶の下腹部がみるみるうちに膨らんでいく[p]
#鈴耶
おっ！おっ！おううっ！？？[p]
#
あまりの衝撃に上体が崩れ、鈴耶は顔から桶の内壁に凭れ掛かった[p]
#鈴耶
はあっ！はあっ！はっふうううううう・・・・・[p]
#
体内への粘液注入が収まり、深い息を吐く鈴耶[p]
だが、水妖による肛姦はこれで終わったわけではない[p]
ぐるるるるるる、と鈴耶の下腹部から不吉な音が響く[p]
#鈴耶
ひっ！！！[p]
#
尻穴から潜り込んだ水妖は体内の老廃物を吸収する。そして用事を済ませれば後は当然[p]
#鈴耶
らめっ！漏れっ！漏れちゃううううう！！！[p]
#
鈴耶はいやいやをするように突き出した尻を左右に振った[p]
体内を漱ぎながら水妖が「逆流」する。菊座が盛り上がり、めくり上がる、そして[p]
#鈴耶
はひゃああああああああっ！！！[p]
#
怒涛の勢いで水妖が鈴耶の尻から噴き出した[p]
それだけでも恐ろしい衝撃だったが、おまけに下半身を固定していた粘液までもが本流と合流すべく蠢き出したのだ[p]
#鈴耶
いっ！ひいいいいいいいっ！！[p]
#
その途中に行きがけの駄賃とばかりに陰核を、小陰唇を、陰唇を、舐り潰しながら粘液が流動する[p]
水妖により鈴耶の淫気が上昇[p]
[eval exp="f.CURSE += 100"][WSs]
;快感ダメージ
[eval exp="tf.fack = 250 "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.ANAL / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"][SKEBE][WSs]
;絶頂
[if exp="f.ERO >= 1000"]
#鈴耶
だめぇ！！！すずやぁ妖怪うんちでイクっ！！！イクイクイクーーーーーーーっ！！！[p]
#
鈴耶は絶頂した[p]
[orgasm]
[endif]
・・・・・・・・・・・・・・・・・・・・・・・・[p]
落とし穴の底で鈴耶はふらつきながら立ち上がった[p]
しばし自失している間に水妖の姿は消えていた[p]
だが、いつまでもここに留まっている訳にはいかない[p]
#鈴耶
（ここは敵地。敵が寄ってくる前に移動しないと！！）[p]
#
[jump target="*no_goal"][s]


;--------------------------------------------
*trappman
酔漢が現れた[p]
[eval exp="f.en_Name = '酔漢'"][WriteEnemy]
[eval exp="f.Lv = 20, f.EN_STR = 5, f.EN_POW = 5, f.en_DEX=25, f.GRB=120, f.SEX=120, f.en_HP = 100 , f.type = 1, f.Round = 0"]
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
[eval exp="f.Lv = 100, f.EN_STR = 20, f.en_DEX=30, f.GRB=200, f.SEX=200 , f.en_HP = 10000 , f.type = 1, f.Round = 0"]
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
