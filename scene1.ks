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
[bg storage="japanese04_night_dark.jpg" time="100"]
[eval exp="f.dress=1"][call storage="asset/As_face.ks"]
[chara_mod name="suzune" face="柔らか" ]
[chara_show name="suzune" left="-100" top="-20"]
@layopt layer=message0 visible=true
@layopt layer=2 visible=true

#鈴猫
鈴猫、只今参りました[r]
千草様、お呼びでしょうか?[p]

[chara_show name="chikusa" left="200" top="-600" height=1600 width=1600]

#千草
鈴猫、お館様がお亡くなりになりました[p]

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
