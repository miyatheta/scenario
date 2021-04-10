*start
[bg storage="japanese04_morning.jpg" time="500"]


*select_event
[getrand min="1" max="7" var="f.event"]
[if exp="f.event<=1"]
[jump target=*talk01]
[elsif exp="f.event<=2"]
[jump target=*talk02]
[elsif exp="f.event<=3"]
[jump target=*talk03]
[elsif exp="f.event<=4"]
[jump target=*talk04]
[elsif exp="f.event<=5"]
[jump target=*talk05]
[elsif exp="f.event<=6"]
[jump target=*talk06]
[else][jump target=*talk07]
[endif]

[s]
*talk_end
[jump storage="home.ks"]
[s]


*talk01
[chara_show name="suzune" face="普通" left="-100" top="-20"]
[chara_show name="shogun" x="815" y="0" layer="0"]
#善照
忍術を使うのには気力が必要[p]
気力は攻撃を敵に当てるか[r]
攻撃を敵に受けることで獲得できる[r]
・・・らしい。[r]
儂にはピンとこないのだがな[p]
ところで、忍術で炎を出したりはできぬのか？[p]
#鈴猫
う〜ん。そういう術もありますけど・・・[p]
私は隠密仕事のほうが多いので使わないですね[r]
目立つじゃないですかアレ[p]
#善照
そ、そうか・・・（ガッカリ）[p]
[cm][chara_hide_all]
[jump target="*talk_end"]
[s]

*talk02
#鈴猫
殿？何を見てらっしゃるのですか？[p]
#善照
おお、鈴猫[r]
これは海鹿家の家系図じゃ[p]
#鈴猫
また随分と古めかしい…[p]
#善照
そうだ！！これこそ海鹿家400年の歴史の証よ！[p]
#鈴猫
よ、よんひゃくねん！？[p]
#善照
200年ほど前に帝を蔑ろにした当時の幕府を打ち倒し、この都に新しい幕府を開いたのじゃ[p]
#鈴猫
はえーーー。凄いですね[r]
ちなみに殿様のお名前は・・・？[p]
#善照
ここだな。[l]将軍は儂で１５代目になる[p]
#
[cm][chara_hide_all]
[jump target="*talk_end"]
[s]


*talk03
#鈴猫
殿？どうしたのですか？渋い顔をして[p]
#善照
鈴猫か…。[p]
検非違使からの報告を読んでおったのだ[p]
近頃は都の中まで魑魅魍魎の目撃が絶えん[p]
#鈴猫
都は昔の陰陽師の人が張った結界があるはずですけど[p]
#善照
天下の荒れようが許容の域をこえておるのだ[p]
#
[cm][chara_hide_all]
[jump target="*talk_end"]
[s]


*talk04
#善照
会話４[p]
#
[cm][chara_hide_all]
[jump target="*talk_end"]
[s]

*talk05
#善照
会話５[p]
#
[cm][chara_hide_all]
[jump target="*talk_end"]
[s]

*talk06
#善照
会話６[p]
#
[cm][chara_hide_all]
[jump target="*talk_end"]
[s]

*talk07
#善照
会話７[p]
#
[cm][chara_hide_all]
[jump target="*talk_end"]
[s]
