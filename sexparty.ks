*start
[bg storage="japanese02_evening.jpg" time="500"]
[bg storage="japanese02_night_dark.jpg" time="500"]
[eval exp="f.EN_SEX=130 , f.satisfy=0 , f.election=0"]
#犬童綱久
ひひっ。さあて楽しませてもらおうかね[p]
#
;----前戯-----------------------------------------------------------------------
*forejob1
#犬童綱久
ほおれ。まずは挨拶代わりの前戯じゃ[p]
儂の魔羅様に奉仕せい[p]
[glink  color="rosy"  target="*handjob"  x="450"  y="150"  width=""  height=""  text="手で奉仕する" ]
[glink  color="rosy"  target="*mouthjob"  x="450"  y="250"  width=""  height=""  text="口で奉仕する" ]
[glink  color="rosy"  target="*boobjob"  x="450"  y="350"  width=""  height=""  text="胸で奉仕する" ]
[s]
;------------------------------------------------------------------------------
*handjob
#
鈴耶は手で犬童の魔羅をしごき始めた[p]
#犬童綱久
おっと、まずは手で奉仕してくれるのかい？[p]
#
[eval exp="f.handjob = f.handjob * 0.95"]
[eval exp="f.election = f.handjob * 120"]

[if exp="f.election > 100"]
#
鈴耶の手淫で犬童の魔羅は屹立した[p]
#犬童綱久
ふふっ。もう良いぞ。今度は儂がお主を慰めてやろう[p]
#
[jump target="*forejob2"]
[else]
#
犬童の魔羅は固くなったが、まだ半勃ち止まりだった[p]
#犬童綱久
どうした？まだまだ足りんぞ？奉仕を続けてもらおうか？[p]
#
[jump target="*forejob1"]
[endif]
[s]
;------------------------------------------------------------------------------
*mouthjob
#
鈴耶は犬童の魔羅を口に含んだ[p]
#犬童綱久
おっと、まずは口で奉仕してくれるのかい？[p]
#
[eval exp="f.mouthjob = f.mouthjob * 0.95"]
[eval exp="f.election = f.mouthjob * 150"]

[if exp="f.election > 100"]
#
鈴耶の口淫で犬童の魔羅は屹立した[p]
#犬童綱久
ふふっ。もう良いぞ。今度は儂がお主を慰めてやろう[p]
#
[jump target="*forejob2"]
[else]
#
犬童の魔羅は固くなったが、まだ半勃ち止まりだった[p]
#犬童綱久
どうした？まだまだ足りんぞ？奉仕を続けてもらおうか？[p]
#
[jump target="*forejob1"]
[endif]
[s]
;------------------------------------------------------------------------------
*boobjob
#
鈴耶は犬童の魔羅を胸に挟んだ[p]
#犬童綱久
おっと、まずは胸で奉仕してくれるのかい？[p]
#
[eval exp="f.boobjob = f.boobjob * 0.95"]
[eval exp="f.election = f.boobjob * 150"]

[if exp="f.election > 100"]
#
鈴耶のパイズリで犬童の魔羅は屹立した[p]
#犬童綱久
ふふっ。もう良いぞ。今度は儂がお主を慰めてやろう[p]
#
[jump target="*forejob2"]
[else]
#
犬童の魔羅は固くなったが、まだ半勃ち止まりだった[p]
#犬童綱久
どうした？まだまだ足りんぞ？奉仕を続けてもらおうか？[p]
#
[jump target="*forejob1"]
[endif]
[s]
;------------------------------------------------------------------------------
*forejob2
#犬童綱久
さて、どうしてくれようか？[p]
[glink  color="rosy"  target="*thighjob"  x="450"  y="150"  width=""  height=""  text="素股" ]
[glink  color="rosy"  target="*fingerjob"  x="450"  y="250"  width=""  height=""  text="指マン" ]
[glink  color="rosy"  target="*boobrape"  x="450"  y="350"  width=""  height=""  text="乳揉" ]
[glink  color="rosy"  target="*analcunni"  x="450"  y="450"  width=""  height=""  text="菊座責め" ]
[s]
;------------------------------------------------------------------------------
*thighjob
#犬童綱久
おら、股を締めろ！儂のものを挟むんだ！！[p]
#
犬童は魔羅を鈴耶の腿に挿し込むと、腰を前後に振り始めた[p]
#
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*VGNA"]

;絶頂判定
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*thighjob淫乱絶頂"]
[elsif exp="f.orgasm > 0"][jump target="*thighjob通常絶頂"]
[elsif exp="f.nasty > 0"][jump target="*thighjob淫乱"]
[else][jump target="*thighjob通常"]
[endif]

*thighjob淫乱絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
秘裂を魔羅で擦られ鈴耶は大きな嬌声を上げながら絶頂した[p]
#犬童綱久
ふはははは！！前戯で絶頂するとは初いやつだわい！！[p]
[jump target="*sex1" ]
[s]

*thighjob通常絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸からの快感に鈴耶は体を震わせた[r]
#犬童綱久
おお！？今、イキおったな？前戯で絶頂するとは初いやつだわい！！[p]
[jump target="*sex1" ]
[s]

*thighjob淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声で犬童にしなだれかかった[p]
#犬童綱久
ふふ…。初いやつだわい。心配せんでも存分に可愛がってやるぞ[p]
[jump target="*sex1" ]
[s]

*thighjob通常
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
んうっ！擦りつけるなぁ！！[p]
#犬童綱久
ふっ。口では嫌がっておるが、濡れてきておるではないか[p]
[jump target="*sex1" ]
[s]
;------------------------------------------------------------------------------
*fingerjob
#犬童綱久
ほら、股を開けい。儂のものを入れる前にたっぷり濡らしてやるわい[p]
#
犬童は指を鈴耶の秘所に伸ばすと、蜜壺に差し入れた[p]
#
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*VGNA"]

;絶頂判定
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*thighjob淫乱絶頂"]
[elsif exp="f.orgasm > 0"][jump target="*thighjob通常絶頂"]
[elsif exp="f.nasty > 0"][jump target="*thighjob淫乱"]
[else][jump target="*thighjob通常"]
[endif]

*fingerjob淫乱絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
秘裂を指で弄ばれ鈴耶は大きな嬌声を上げながら絶頂した[p]
#犬童綱久
ふはははは！！前戯で絶頂するとは初いやつだわい！！[p]
[jump target="*sex1" ]
[s]

*fingerjob通常絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
蜜壺からの快感に鈴耶は体を震わせた[r]
#犬童綱久
おお！？今、イキおったな？前戯で絶頂するとは初いやつだわい！！[p]
[jump target="*sex1" ]
[s]

*fingerjob淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声で犬童にしなだれかかった[p]
#犬童綱久
ふふ…。初いやつだわい。心配せんでも存分に可愛がってやるぞ[p]
[jump target="*sex1" ]
[s]

*fingerjob通常
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
んうっ！やめてぇ！！[p]
#犬童綱久
ふっ。口では嫌がっておるが、濡れてきておるではないか[p]
[jump target="*sex1" ]
[s]
;------------------------------------------------------------------------------
*boobrape
#犬童綱久
ふふ、いつ見ても豊満な乳だわい。男の玩具になるために生まれてきたようだ[p]
#
犬童は鈴耶の双丘を鷲掴みにすると、揉みしだき始めた[p]
#
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*BOOB"]

;絶頂判定
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*thighjob淫乱絶頂"]
[elsif exp="f.orgasm > 0"][jump target="*thighjob通常絶頂"]
[elsif exp="f.nasty > 0"][jump target="*thighjob淫乱"]
[else][jump target="*thighjob通常"]
[endif]

*boobrape淫乱絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
秘裂を指で弄ばれ鈴耶は大きな嬌声を上げながら絶頂した[p]
#犬童綱久
ふはははは！！前戯で絶頂するとは初いやつだわい！！[p]
[jump target="*sex1" ]
[s]

*boobrape通常絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
蜜壺からの快感に鈴耶は体を震わせた[r]
#犬童綱久
おお！？今、イキおったな？前戯で絶頂するとは初いやつだわい！！[p]
[jump target="*sex1" ]
[s]

*boobrape淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声で犬童にしなだれかかった[p]
#犬童綱久
ふふ…。初いやつだわい。心配せんでも存分に可愛がってやるぞ[p]
[jump target="*sex1" ]
[s]

*boobrape通常
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
んうっ！やめてぇ。揉むなぁ！[p]
#犬童綱久
ふっ。口では嫌がっておるが、乳首はびんびんではないか！[p]
[jump target="*sex1" ]
[s]
;------------------------------------------------------------------------------
*analcunni
#犬童綱久
ほうれ、尻をこちらに向けて突きだせい[p]
#
犬童は鈴耶の尻たぶを割り開くと、その中央に顔を近づけ菊座に舌を伸ばした[p]
#
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*ANAL"]

;絶頂判定
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*thighjob淫乱絶頂"]
[elsif exp="f.orgasm > 0"][jump target="*thighjob通常絶頂"]
[elsif exp="f.nasty > 0"][jump target="*thighjob淫乱"]
[else][jump target="*thighjob通常"]
[endif]

*analcunni淫乱絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
菊座を舌で舐め回され鈴耶は大きな嬌声を上げながら絶頂した[p]
#犬童綱久
ふはははは！！前戯で絶頂するとは初いやつだわい！！[p]
[jump target="*sex1" ]
[s]

*analcunni通常絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
尻穴からの快感に鈴耶は体を震わせた[r]
#犬童綱久
おお！？今、イキおったな？前戯で絶頂するとは初いやつだわい！！[p]
[jump target="*sex1" ]
[s]

*analcunni淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声を上げ悶えた[p]
#犬童綱久
ふふ…。初いやつだわい。心配せんでも存分に可愛がってやるぞ[p]
[jump target="*sex1" ]
[s]

*analcunni通常
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
んうっ！やめてぇ。そんなところ舐めるなぁ！[p]
#犬童綱久
ふっ。口では嫌がっておるが、濡れてきておるではないか！[p]
[jump target="*sex1" ]
[s]
;------------------------------------------------------------------------------
*sex1
#犬童綱久
さあて、いよいよ本番じゃ[p]
[glink  color="rosy"  target="*normalsex"  x="450"  y="150"  width=""  height=""  text="通常" ]
[glink  color="rosy"  target="*analsex"  x="450"  y="250"  width=""  height=""  text="肛姦" ]
[s]

*normalsex
#
犬童はマラを鈴耶の秘裂に挿入した[p]
;快感ダメージ
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*VGNA"]
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*normal淫乱絶頂"]
[elsif exp="f.orgasm > 0"][jump target="*normal通常絶頂"]
[elsif exp="f.nasty > 0"][jump target="*normal淫乱"]
[else][jump target="*normal通常"]
[endif]
[s]


*analsex
#
犬童はマラを鈴耶の肛門に挿入した[p]
;快感ダメージ
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*VGNA"]
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*anal淫乱絶頂"]
[elsif exp="f.orgasm > 0"][jump target="*anal通常絶頂"]
[elsif exp="f.nasty > 0"][jump target="*anal淫乱"]
[else][jump target="*anal通常"]
[endif]
[s]
;-----------------------------------------

*normal淫乱絶頂
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[r]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴耶は挿入と同時に大きな嬌声を上げながら絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*normal気絶"][endif]
#犬童
へっ！まだ入れただけだぜ！！こっからが本番だ！！[p]
#鈴耶
あんっ！！もっとぉ！！めちゃくちゃにしてぇ！！[p]
#
犬童は鈴耶の痴態に鼻息を荒くした[p]
[jump target="*normalsex2"]
[s]
;-----------------------------------------

*normal通常絶頂
[chara_mod name="suzune" face="泣き"]
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に目を見開いた[p]
備えていたつもりだったが体は意思の手綱を離れ痙攣を始める[r]
そして[p]
[chara_mod name="suzune" face="絶頂"]
#鈴耶
いやあああっ！！らめぇぇぇぇっ！！[p]
#
;鈴耶は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*normal気絶"][endif]
#犬童
へっ！まだ入れただけだぜ？こっからが本番だ！！[p]
#鈴耶
ううっ！この調子にのんじゃないわよ！！[p]
[jump target="*normalsex2"]
[s]
;-----------------------------------------

*normal淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[r]
#
鈴耶は自ら腰を振り、膣でマラを締め付けた[p]
#犬童
おおう！！こいつはすげぇ名器だ！！[p]
#
犬童は快感に鼻息を荒くした[p]
[jump target="*normalsex2"]
[s]
;-----------------------------------------

*normal通常
[chara_mod name="suzune" face="泣き"]
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に歯を食いしばった[p]
#犬童
どうだ！俺のマラの感触は！！[p]
#鈴耶
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#犬童
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
[jump target="*normalsex2"]
[s]

;-----------------------------------------

*normal気絶
[chara_mod name="suzune" face="レイプ目"]
#
鈴耶は気絶した！[p]
#犬童
おいおい！まだ先っちょを挿れただけぜ！！[p]
#鈴耶
・・・・・・・・・[p]
#犬童
オラァ！！起きろ！！[p]
#鈴耶
かはっ！！[p]
#
犬童は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]
;-----------------------------------------
;-----------------------------------------

*anal淫乱絶頂
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[r]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴耶は挿入と同時に大きな嬌声を上げながら絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*anal気絶"][endif]
#犬童
へっ！まだ入れただけだぜ！！こっからが本番だ！！[p]
#鈴耶
あんっ！！もっとぉ！！めちゃくちゃにしてぇ！！[p]
#
犬童は鈴耶の痴態に鼻息を荒くした[p]
[jump target="*analsex2"]
[s]
;-----------------------------------------

*anal通常絶頂
[chara_mod name="suzune" face="泣き"]
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に目を見開いた[p]
備えていたつもりだったが体は意思の手綱を離れ痙攣を始める[r]
そして[p]
[chara_mod name="suzune" face="絶頂"]
#鈴耶
いやあああっ！！らめぇぇぇぇっ！！[p]
#
;鈴耶は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*anal気絶"][endif]
#犬童
へっ！まだ入れただけだぜ？こっからが本番だ！！[p]
#鈴耶
ううっ！この調子にのんじゃないわよ！！[p]
[jump target="*analsex2"]
[s]
;-----------------------------------------

*anal淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[r]
#
鈴耶は自ら腰を振り、膣でマラを締め付けた[p]
#犬童
おおう！！こいつはすげぇ名器だ！！[p]
#
犬童は快感に鼻息を荒くした[p]
[jump target="*analsex2"]
[s]
;-----------------------------------------

*anal通常
[chara_mod name="suzune" face="泣き"]
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に歯を食いしばった[p]
#犬童
どうだ！俺のマラの感触は！！[p]
#鈴耶
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#犬童
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
[jump target="*analsex2"]
[s]

;-----------------------------------------

*anal気絶
[chara_mod name="suzune" face="レイプ目"]
#
鈴耶は気絶した！[p]
#犬童
おいおい！まだ先っちょを挿れただけぜ！！[p]
#鈴耶
・・・・・・・・・[p]
#犬童
オラァ！！起きろ！！[p]
#鈴耶
かはっ！！[p]
#
犬童は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------
*normalsex2
#
犬童はしっかりと鈴耶の腰を抱え込むと激しく腰を打ち付けた[p]
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*VGNA"]
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*normalsex2淫乱絶頂"]
[elsif exp="f.orgasm > 0"][jump target="*normalsex2通常絶頂"]
[elsif exp="f.nasty > 0"][jump target="*normalsex2淫乱"]
[else][jump target="*normalsex2通常"]
[endif]
[s]
;----------------------------------------

*analsex2
#
犬童はしっかりと鈴耶の尻を抱え込むと激しく腰を打ち付けた[p]
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*VGNA"]
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*analsex2淫乱絶頂"]
[elsif exp="f.orgasm > 0"][jump target="*analsex2通常絶頂"]
[elsif exp="f.nasty > 0"][jump target="*analsex2淫乱"]
[else][jump target="*analsex2通常"]
[endif]
[s]
;----------------------------------------
*normalsex2淫乱絶頂
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！いいっ！！早く！早く頂戴！！[p]
#犬童
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
犬童の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#犬童
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに犬童のマラが爆発した[p]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴耶は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*normalsex2気絶"][endif]
#犬童
へへへ、こいつは凄え名器だったぜ[p]
#
犬童は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
#鈴耶
ああんっ！！[p]
#
その場にくずおれた鈴耶の秘裂からごぽりと精液が溢れた[p]
#鈴耶
はああああああ…[p]
#
鈴耶の表情は熱に浮かされたように蕩け、
潤んだ瞳は男の股間を物欲しそうに追いかけていた[p]
#犬童
ほら、魔羅様にお礼を申し上げろ[p]
#鈴耶
はぁ、はぁ。本日はお鈴のはしたない雌穴にお情けをかけていただきありがとうございました[p]
[jump target="*finish"]
[s]
;----------------------------------------

*normalsex2通常絶頂
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！いやあっ！！イクぅ！！[p]
#犬童
イけぇ！！イっちまええええ！！[p]
#鈴耶
いやぁっ！！こんな雑魚なんかにイかされたくないいい！！！[p]
#犬童
うおおお！出すぞ！！[p]
#
犬童は鈴耶の中で射精した[p]
[chara_mod name="suzune" face="絶頂"]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴耶は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*normalsex24気絶"][endif]
#犬童
へへへ、なかなか良かったぜ[p]
#
犬童は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
#鈴耶
ああんっ！！[p]
#
その場にくずおれた鈴耶の秘裂からごぽりと精液が溢れた[p]
#犬童
ほら、魔羅様にお礼を申し上げろ[p]
[chara_mod name="suzune" face="厳しい"]
#鈴耶
はぁ、はぁ。お情けをかけていただきありがとうございました[p]
[jump target="*finish"]
[s]
;----------------------------------------

*normalsex2淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！いいっ！！早く！早く頂戴！！[p]
#犬童
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
犬童の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#犬童
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに犬童のマラが爆発した[p]
#鈴耶
あああああっ！！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
その間も鈴耶の膣はうねり男のマラから根こそぎ精を搾り取った[p]
#犬童
へ、へへ、こいつは凄え名器だったぜ[p]
#
犬童は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
#鈴耶
ああんっ！！[p]
#
その場にくずおれた鈴耶の秘裂からごぽりと精液が溢れた[p]
#鈴耶
はああああああ…[p]
#
鈴耶の表情は熱に浮かされたように蕩け、
潤んだ瞳は男の股間を物欲しそうに追いかけていた[p]
#犬童
ほら、魔羅様にお礼を申し上げろ[p]
#鈴耶
はぁ、はぁ。本日はお鈴のはしたない尻穴にお情けをかけていただきありがとうございました[p]
[jump target="*finish"]
[s]
;----------------------------------------

*normalsex2通常
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！あんっ！ひぃん！！[p]
#犬童
うおおお！出すぞ！！ぶちまけてやる！！[p]
#鈴耶
いやあああああっ！！[p]
#犬童
うおおおおおおっ！！[p]
#
犬童は鈴耶の中で射精した[p]
#鈴耶
あああああっ！！ダメェ・・・！！[p]
#犬童
へへへ、なかなか良かったぜ[p]
#
犬童は嫌らしく笑いながら鈴耶からマラを引き抜いた[p]
#鈴耶
あんっ！[p]
#
どろりと鈴耶の秘裂から精液がこぼれた[p]
#犬童
ほら、魔羅様にお礼を申し上げろ[p]
[chara_mod name="suzune" face="厳しい"]
#鈴耶
はぁ、はぁ。お情けをかけていただきありがとうございました[p]
[jump target="*finish"]
[s]

;-----------------------------------------
*normalsex2気絶
[chara_mod name="suzune" face="レイプ目"]
#
鈴耶は気絶した！[p]
#犬童
へへへ、なかなか良かったぜ[p]
#
犬童は白目を剥いて痙攣する鈴耶からマラを引き抜いた[p]
#鈴耶
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴耶はその場に崩折れる[r]
どろりと鈴耶の膣穴から精液がこぼれた[p]
#犬童
ふふふ、気を失うほど良かったか[p]
[jump target="*finish"]
[s]

;----------------------------------------
;----------------------------------------
*analsex2淫乱絶頂
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！いいっ！！早く！早く頂戴！！[p]
#犬童
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
犬童の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#犬童
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに犬童のマラが爆発した[p]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴耶は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*analsex2気絶"][endif]
#犬童
へへへ、こいつは凄え名器だったぜ[p]
#
犬童は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
#鈴耶
ああんっ！！[p]
#
その場にくずおれた鈴耶の肛門からごぽりと精液が溢れた[p]
#鈴耶
はああああああ…[p]
#
鈴耶の表情は熱に浮かされたように蕩け、
潤んだ瞳は男の股間を物欲しそうに追いかけていた[p]
#犬童
ほら、魔羅様にお礼を申し上げろ[p]
#鈴耶
はぁ、はぁ。本日はお鈴のはしたない尻穴にお情けをかけていただきありがとうございました[p]
[jump target="*finish"]
[s]
;----------------------------------------

*analsex2通常絶頂
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！いやあっ！！イクぅ！！[p]
#犬童
イけぇ！！イっちまええええ！！[p]
#鈴耶
いやぁっ！！こんな雑魚なんかにイかされたくないいい！！！[p]
#犬童
うおおお！出すぞ！！[p]
#
犬童は鈴耶の中で射精した[p]
[chara_mod name="suzune" face="絶頂"]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴耶は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*analsex2気絶"][endif]
#犬童
へへへ、なかなか良かったぜ[p]
#
犬童は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
#鈴耶
ああんっ！！[p]
#
その場にくずおれた鈴耶の肛門からごぽりと精液が溢れた[p]
#犬童
ほら、魔羅様にお礼を申し上げろ[p]
[chara_mod name="suzune" face="厳しい"]
#鈴耶
はぁ、はぁ。お情けをかけていただきありがとうございました[p]
[jump target="*finish"]
[s]
;----------------------------------------

*analsex2淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！いいっ！！早く！早く頂戴！！[p]
#犬童
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
犬童の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#犬童
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに犬童のマラが爆発した[p]
#鈴耶
あああああっ！！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
その間も鈴耶の膣はうねり男のマラから根こそぎ精を搾り取った[p]
#犬童
へ、へへ、こいつは凄え名器だったぜ[p]
#
犬童は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
#鈴耶
ああんっ！！[p]
#
その場にくずおれた鈴耶の肛門からごぽりと精液が溢れた[p]
#鈴耶
はああああああ…[p]
#
鈴耶の表情は熱に浮かされたように蕩け、
潤んだ瞳は男の股間を物欲しそうに追いかけていた[p]
#犬童
ほら、魔羅様にお礼を申し上げろ[p]
#鈴耶
はぁ、はぁ。本日はお鈴のはしたない尻穴にお情けをかけていただきありがとうございました[p]
[jump target="*finish"]
[s]
;----------------------------------------

*analsex2通常
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！あんっ！ひぃん！！[p]
#犬童
うおおお！出すぞ！！ぶちまけてやる！！[p]
#鈴耶
いやあああああっ！！[p]
#犬童
うおおおおおおっ！！[p]
#
犬童は鈴耶の中で射精した[p]
#鈴耶
あああああっ！！ダメェ・・・！！[p]
#犬童
へへへ、なかなか良かったぜ[p]
#
犬童は嫌らしく笑いながら鈴耶からマラを引き抜いた[p]
#鈴耶
あんっ！[p]
#
どろりと鈴耶の肛門から精液がこぼれた[p]
#犬童
ほら、魔羅様にお礼を申し上げろ[p]
[chara_mod name="suzune" face="厳しい"]
#鈴耶
はぁ、はぁ。お情けをかけていただきありがとうございました[p]
[jump target="*finish"]
[s]

;-----------------------------------------
*analsex2気絶
[chara_mod name="suzune" face="レイプ目"]

#
鈴耶は気絶した！[p]
#犬童
へへへ、なかなか良かったぜ[p]
#
犬童は白目を剥いて痙攣する鈴耶からマラを引き抜いた[p]
#鈴耶
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴耶はその場に崩折れる[r]
どろりと鈴耶の肛門から精液がこぼれた[p]
#犬童
ふふ、気を失うほど良かったか[p]
#
[jump target="*finish"]
[s]

;フィニッシュ-----------------------------------------------------------------------
*finish
#
将軍の警備体制が強化された[p]
[eval exp="f.keibi = 100"]
[call storage="routin/Rt_dairy.ks"]
[jump target="*home_start"]
[s]
