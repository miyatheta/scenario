*start
[bg storage="japanese04_morning.jpg" time="500"]


*select_event
[getrand min="1" max="100" var="f.event"]
[if exp="f.event<=20"]
[jump target=*talk01]

[elsif exp="f.event<=40"]
[jump target=*talk01]

[elsif exp="f.event<=60"]
[jump target=*talk01]

[else][jump target=*talk01]
[endif]

[s]
*talk_end
[jump storage="home.ks" target="*home_start"]
[s]


*talk01
[chara_show name="suzune" face="普通" left="-100" top="-20"]
[chara_show name="shogun" x="815" y="0" layer="0"]
#善照
忍術を使うのには気力が必要[p]
気力は攻撃を敵に当てるか[r]
攻撃を敵に受けることで獲得できる[r]
・・・らしい。[r]
余にはピンとこないのだがな[p]
ところで、忍術で炎を出したりはできぬのか？[p]
#鈴耶
う〜ん。そういう術もありますけど・・・[p]
私は隠密仕事のほうが多いので使わないですね[r]
目立つじゃないですかアレ[p]
#善照
そ、そうか・・・（ガッカリ）[p]
[chara_hide_all]
[jump target="*talk_end"]
[s]

*talk02
#善照
[jump target="*talk_end"]
[s]


*talk03
#善照
[jump target="*talk_end"]
[s]


*talk04
#善照
[jump target="*talk_end"]
[s]

*talk05
#善照
[jump target="*talk_end"]
[s]

*talk06
#善照
[jump target="*talk_end"]
[s]

*talk07
#善照
[jump target="*talk_end"]
[s]
