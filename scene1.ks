*start

[cm ]
[clearfix]
[start_keyconfig]


;メニューボタンの表示
@showmenubutton

;メッセージウィンドウの設定
[position layer="message0" left=390 top=540 width=800 height=170 page=fore visible=false]
;文字が表示される領域を調整
[position layer=message0 page=fore margint="25" marginl="60" marginr="25" marginb="50"]

;メッセージウィンドウの表示
@layopt layer=message0 visible=false

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=400 y=540]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area" ]

[clearstack stack="call" ]
[freeimage layer="0" ]
[bg2 storage="japanese04_night_dark.jpg" time="100"]
[eval exp="f.dress=1"][call storage="As_face.ks"]
[chara_mod name="suzune" face="柔らか" ]
[chara_show name="suzune" left="-100" top="-20"]
@layopt layer=message0 visible=true
@layopt layer=2 visible=true

#
豊川のほとり、三河の属城が一つ野田城[p]
藪の中に埋もれるような小城は今、張り詰めた空気に満ちていた[p]
物見櫓の兵が見やる先には一面の夜営が広がっている[p]
篝火に無数の幟が翻り、飯を炊く煙が濛々と立ち昇る[p]
5百人足らずの野田城は今、3万からなる武田軍に完全包囲されていた[p]
小城ながらも地形を活かし、先年から増強を重ねた野田城は弱い砦ではない[p]
武田軍もそのことは承知しており、数日前から完全包囲の陣を敷いたまま力攻めしてこようとはしない[p]
持久戦、兵糧攻めが狙いだろうか[p]
幸いにして備蓄はゆうに1ヶ月分はある[p]
その間に三河の徳川本軍が救援に来てくれればよいのだが[p]
昨年末に大敗を喫して大将、命からがら逃げ帰ったばかりである[p]


#鈴猫
鈴猫、只今参りました[r]
千草様、お呼びでしょうか?[p]

[chara_show name="chikusa" left="200" top="-600" height=1600 width=1600]

#千草
鈴猫、よく来てくれました[p]
#


お館様がお亡くなりになりました[p]

[chara_mod name="suzune" face="厳しい" ]

#鈴猫
な、なんと！？[r]
それでは今回の戦は！？[p]

#千草
お館様のことはしばらく味方にも伏せて戦を続けます[p]
今すぐ兵を引けば京で挙兵した将軍様が危うくなります[p]
幸い今攻めている野田城は水攻めで落とすつもりでした[p]
工事には着手しており、お館様がいなくても作戦の続行に支障はありません[p]
我々はお館様の死を伏せて、このまま野田城攻めを続けます[p]
鈴猫。あなたはその間に将軍様にお館様の死と兵を引くように伝えなさい[p]

#鈴猫
はっ！！承知いたしました[p]

#千草
将軍様は今、近江石山城に詰めていらっしゃると聞きます[p]
織田・徳川の領地を抜けなければなりません[p]
敵の間諜、忍にはくれぐれも気をつけなさい[p]

#鈴猫
ありがとうございます！！[p]

[chara_hide  name="chikusa"]
[chara_hide  name="suzune"]
[cm][clearfix]
@freeimage layer="0"
@layopt layer=message0 visible=false
[jump storage="scene2.ks"]
[s]
