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
[s]

*thighjob通常絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸からの快感に鈴耶は体を震わせた[r]
#犬童綱久
おお！？今、イキおったな？前戯で絶頂するとは初いやつだわい！！[p]
[s]

*thighjob淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声で犬童にしなだれかかった[p]
#犬童綱久
ふふ…。初いやつだわい。心配せんでも存分に可愛がってやるぞ[p]
[s]

*thighjob通常
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
んうっ！擦りつけるなぁ！！[p]
#犬童綱久
ふっ。口では嫌がっておるが、濡れてきておるではないか[p]
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
[s]

*fingerjob通常絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
蜜壺からの快感に鈴耶は体を震わせた[r]
#犬童綱久
おお！？今、イキおったな？前戯で絶頂するとは初いやつだわい！！[p]
[s]

*fingerjob淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声で犬童にしなだれかかった[p]
#犬童綱久
ふふ…。初いやつだわい。心配せんでも存分に可愛がってやるぞ[p]
[s]

*fingerjob通常
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
んうっ！やめてぇ！！[p]
#犬童綱久
ふっ。口では嫌がっておるが、濡れてきておるではないか[p]
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
[s]

*boobrape通常絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
蜜壺からの快感に鈴耶は体を震わせた[r]
#犬童綱久
おお！？今、イキおったな？前戯で絶頂するとは初いやつだわい！！[p]
[s]

*boobrape淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声で犬童にしなだれかかった[p]
#犬童綱久
ふふ…。初いやつだわい。心配せんでも存分に可愛がってやるぞ[p]
[s]

*boobrape通常
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
んうっ！やめてぇ。揉むなぁ！[p]
#犬童綱久
ふっ。口では嫌がっておるが、乳首はびんびんではないか！[p]
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
[s]

*analcunni通常絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
尻穴からの快感に鈴耶は体を震わせた[r]
#犬童綱久
おお！？今、イキおったな？前戯で絶頂するとは初いやつだわい！！[p]
[s]

*analcunni淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声を上げ悶えた[p]
#犬童綱久
ふふ…。初いやつだわい。心配せんでも存分に可愛がってやるぞ[p]
[s]

*analcunni通常
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
んうっ！やめてぇ。そんなところ舐めるなぁ！[p]
#犬童綱久
ふっ。口では嫌がっておるが、濡れてきておるではないか！[p]
[s]
;------------------------------------------------------------------------------
*sex1



*fase1

;抵抗１
[call storage="battle/PL_sex.ks"]
;抵抗成功
[jump target="*Round_end" cond="f.bind <= 0"]
;段階１
#
犬童は鈴耶の胸を揉みしだいた[p]
;快感ダメージ
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*BOOB"]
;状態異常による追加ダメージ
[call storage="asset/As_extra_reaction.ks" target="*milk" cond="f.milk > 0"]
;絶頂判定
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*fase淫乱絶頂1"]
[elsif exp="f.ERO >= 1000 && f.orgasm == 0"][jump target="*fase我慢絶頂1"]
[elsif exp="f.orgasm > 0"][jump target="*fase通常絶頂1"]
[elsif exp="f.nasty > 0"][jump target="*fase淫乱1"]
[else][jump target="*fase通常1"]
[endif]
;-----------------------------------------
*fase淫乱絶頂1
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
胸を弄ばれ鈴耶は大きな嬌声を上げながら絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[chara_mod name="suzune" face="喘ぎ"]
[if exp="f.HP <= 0"][call target="*fase気絶1"][endif]
#犬童
なんと他愛ない！！[p]
これでくノ一を名乗るとは片腹痛いわ！[p]
#鈴耶
いやぁ、言わないでぇ・・・[p]
#犬童
はっ！随分とだらしのない乳だな！！[p]
よかろう！拙者がここで躾けてやろう！！[p]
#
犬童は鈴耶の痴態に相好を崩した[p]
[jump target="*fase2"]
[s]
;-----------------------------------------
*fase我慢絶頂1
[chara_mod name="suzune" face="泣き" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸から押し寄せる快感の波に鈴耶は必死に耐えた[r]
鈴耶は絶頂を堪えた！[p]
[call storage="bochu/Rt_orgasm.ks" target="*endure"]
#犬童
ほぉ堪えたか？[p]
だが、随分とだらしのない乳だな[p]
#鈴耶
うっ、うるさいっ！！離しなさいよっ！！[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase通常絶頂1
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸からの快感に鈴耶は体を震わせた[r]
;鈴耶は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase気絶1"][endif]
#犬童
なんと他愛ない！！[p]
これでくノ一を名乗るとは片腹痛いわ！[p]
#鈴耶
くっ・・・！！[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase淫乱1
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声で犬童にしなだれかかった[p]
#犬童
まったくだらしのない乳だな！！[p]
よかろう！拙者がここで躾けてやろう！！[p]
#
犬童は鈴耶の反応に相好を崩した[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase通常1
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
んうっ！揉むなぁ！！[p]
#犬童
はっ！さすがくノ一男好きのするだらしのない乳をしておる！！[p]
#鈴耶
だっ、だらしないて何よ！！[p]
#
[jump target="*fase房中術1" cond="f.rapture > 0"]
[jump target="*fase2"]
[s]

;-----------------------------------------
*fase房中術1
[chara_mod name="suzune" face="厳しい"]
#鈴耶
（調子に乗るんじゃないわよ！！）[p]
#
鈴耶の房中術[p]
「乳麝香」[p]
鈴耶の胸元から甘い香りが立ち昇る[p]
[call storage="routin/Rt_bochu.ks"]
#犬童
おおおおおお！？[p]
#
酩酊した犬童の能力が低下した[p]

[eval exp="f.En_Raptured += 1"]
[eval exp="f.rapture = 0"]
[jump target="*fase2"]
[s]

;-----------------------------------------
*fase気絶1
[chara_mod name="suzune" face="レイプ目"]
鈴耶は気絶した！[p]
#犬童
まさか！？もう気をやるとは！！[p]
まだ何も聞いておらぬぞ！！[p]
目覚めよ！！ハァッ！！[p]
#鈴耶
かはっ！！[p]
#
犬童は気絶していた鈴耶に活を入れた[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase2
;抵抗２
[call storage="battle/PL_sex.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階２
#
犬童はマラを鈴耶の尻に擦りつけてきた[p]
;快感ダメージ
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*ANAL"]
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*fase淫乱絶頂2"]
[elsif exp="f.ERO >= 1000 && f.orgasm == 0"][jump target="*fase我慢絶頂2"]
[elsif exp="f.orgasm > 0"][jump target="*fase通常絶頂2"]
[elsif exp="f.nasty > 0"][jump target="*fase淫乱2"]
[else][jump target="*fase通常2"]
[endif]
;-----------------------------------------

*fase淫乱絶頂2
[chara_mod name="suzune" face="絶頂"]
#鈴耶
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
鈴耶は大きな嬌声を上げながら絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase2気絶"][endif]
#犬童
何とどんだけ欲求不満なんだよ！！[p]
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あぁ！焦らさないでぇ…[p]
#
鈴耶は自ら腰をマラに押し付けくねらせる[p]
#犬童
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
#
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase我慢絶頂2
[chara_mod name="suzune" face="泣き"]
#
快感でびくびくと鈴耶の体が痙攣する[p]
#鈴耶
(ダメッ！！こんな程度で絶対イかされたりしない！！)[p]
#
鈴耶は眉根を寄せて気色悪い感触に耐えた[p]
鈴耶は絶頂を堪えた！[p]
[call storage="bochu/Rt_orgasm.ks" target="*endure"]
#犬童
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#犬童
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase通常絶頂2
[chara_mod name="suzune" face="絶頂"]
#鈴耶
(ダメッ！！イクぅーーーーーッ！！)[p]
#
びくびくと鈴耶の体が痙攣する[p]
;鈴耶は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase2気絶"][endif]
#犬童
おいおい、まだ前戯だってのにどんだけ欲求不満なんだ？[p]
#鈴耶
う、うるひゃいい！！[p]
#犬童
へへっ！！じゃあ本番といくか！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase淫乱2
[chara_mod name="suzune" face="喘ぎ"]
#犬童
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
んっ！焦らさないで…[p]
#
鈴耶は自ら腰をマラに押し付けくねらせた[p]
#犬童
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase通常2
[chara_mod name="suzune" face="苦しみ"]
#犬童
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#犬童
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
[jump target="*fase房中術2" cond="f.rapture > 0"]
[jump target="*fase3"]
[s]

;-----------------------------------------
*fase房中術2
[chara_mod name="suzune" face="厳しい"]
#鈴耶
（調子に乗るんじゃないわよ！！）[p]
#
鈴耶の房中術[p]
「小股絞め」[p]
鈴耶は男の魔羅を自ら股に挟み込むと、太股でしごき始めた[p]
淫蜜が潤滑油となり得も言われぬ快感が犬童を襲う[p]
[call storage="routin/Rt_bochu.ks"]
#犬童
おおおおおお！？[p]
#
激しい快感が犬童を襲う[p]
犬童の能力が低下した[p]

[eval exp="f.En_Raptured += 1"]
[eval exp="f.rapture = 0"]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2気絶
[chara_mod name="suzune" face="レイプ目"]
#
鈴耶は気絶した！[p]
#犬童
はっはぁ！！ケツ穴ほじられて白目剥くとはなぁ！！[p]
#鈴耶
・・・・・・・・・[p]
#犬童
オラァ！！起きろ！！[p]
#鈴耶
くふっ！！[p]
#
犬童は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]
;------------------------------------------------------------------------------

*fase3
;抵抗3
[call storage="battle/PL_sex.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階３
#
犬童はマラを鈴耶の秘裂に挿入した[p]
;快感ダメージ
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*VGNA"]
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*fase淫乱絶頂3"]
[elsif exp="f.ERO >= 1000 && f.orgasm == 0"][jump target="*fase我慢絶頂3"]
[elsif exp="f.orgasm > 0"][jump target="*fase通常絶頂3"]
[elsif exp="f.nasty > 0"][jump target="*fase淫乱3"]
[else][jump target="*fase通常3"]
[endif]
;-----------------------------------------

*fase淫乱絶頂3
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[r]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴耶は挿入と同時に大きな嬌声を上げながら絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#犬童
へっ！まだ入れただけだぜ！！こっからが本番だ！！[p]
#鈴耶
あんっ！！もっとぉ！！めちゃくちゃにしてぇ！！[p]
#
犬童は鈴耶の痴態に鼻息を荒くした[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase我慢絶頂3
[chara_mod name="suzune" face="泣き"]
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に歯を食いしばった[p]
跳ね回りそうな体を押さえつけ、快感を拒絶する[p]
鈴耶は絶頂を堪えた！[p]
[call storage="bochu/Rt_orgasm.ks" target="*endure"]
#犬童
へっ！イクのをこらえやがったな？だが本番はここからだぜ！！[p]
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
ふんっ！調子にのんじゃないわよ！！この下手くそ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase通常絶頂3
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
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#犬童
へっ！まだ入れただけだぜ？こっからが本番だ！！[p]
#鈴耶
ううっ！この調子にのんじゃないわよ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase淫乱3
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[r]
#
鈴耶は自ら腰を振り、膣でマラを締め付けた[p]
#犬童
おおう！！こいつはすげぇ名器だ！！[p]
#
犬童は快感に鼻息を荒くした[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase通常3
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
[jump target="*fase房中術3" cond="f.rapture > 0"]
[jump target="*fase4"]
[s]
;-----------------------------------------
*fase房中術3
[chara_mod name="suzune" face="厳しい"]
#鈴耶
（負けるもんか！！）[p]
#
鈴耶の房中術[p]
「天女貝」[p]
鈴耶の膣がうねり、陰唇が射精を催促するように魔羅を食む[p]
電撃が走るような快感が犬童を襲う[p]
[call storage="routin/Rt_bochu.ks"]
#犬童
おおおおおお！？[p]
#
強烈な快感が犬童を襲う[p]
犬童の能力が低下した[p]
[eval exp="f.En_Raptured += 1"]
[eval exp="f.rapture = 0"]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3気絶
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

*fase4
;抵抗4
[call storage="battle/PL_sex.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階４
#
犬童はしっかりと鈴耶の腰を抱え込むと激しく腰を打ち付けた[p]
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="bochu/Rt_kaikan.ks" target="*VGNA"]
[call storage="bochu/Rt_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
;リアクション
[if exp="f.orgasm > 0 && f.nasty > 0"][jump target="*fase淫乱絶頂4"]
[elsif exp="f.ERO >= 1000 && f.orgasm == 0"][jump target="*fase我慢絶頂4"]
[elsif exp="f.orgasm > 0"][jump target="*fase通常絶頂4"]
[elsif exp="f.nasty > 0"][jump target="*fase淫乱4"]
[else][jump target="*fase通常4"]
[endif]
;----------------------------------------

*fase淫乱絶頂4
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
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
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
鈴耶はよろよろと立ち上がったが、その表情は熱に浮かされたように蕩け、
潤んだ瞳は男の股間を物欲しそうに追いかけていた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase我慢絶頂4
[chara_mod name="suzune" face="泣き"]
#犬童
イけぇ！！イっちまええええ！！[p]
#鈴耶
(イっちゃ駄目！イっちゃ駄目！)[p]
#犬童
うおおお！出すぞ！！[p]
#鈴耶
くううううううっ！！[p]
#
犬童は鈴耶の中で射精した[p]
#鈴耶
（ーーーーーー！！）[p]
#
マラが膣内で爆ぜるのを感じながら鈴耶は快感を押し殺した[r]
鈴耶は絶頂を堪えた！[p]
[call storage="bochu/Rt_orgasm.ks" target="*endure"]
#犬童
ちっ、イクの我慢しやがったな…[p]
#
犬童はマラを引き抜くとつまらなそうに鈴耶の尻を叩いた[p]
#鈴耶
んっ！！[p]
#
その場にくずおれた鈴耶の秘裂からごぽりと精液が溢れた[p]
[chara_mod name="suzune" face="厳しい"]
#鈴耶
くっ！絶対許さないんだから！！[p]
#
鈴耶はよろよろと立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase通常絶頂4
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
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#犬童
へへへ、なかなか良かったぜ[p]
#
犬童は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
#鈴耶
ああんっ！！[p]
#
その場にくずおれた鈴耶の秘裂からごぽりと精液が溢れた[p]
[chara_mod name="suzune" face="厳しい"]
#鈴耶
くっ！絶対許さないんだから！！[p]
#
鈴耶はよろよろと立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase淫乱4
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
鈴耶はよろよろと立ち上がったが、その表情は熱に浮かされたように蕩け、
潤んだ瞳は男の股間を物欲しそうに追いかけていた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase通常4
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
[jump target="*fase房中術4" cond="f.rapture > 0"]
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
[chara_mod name="suzune" face="厳しい"]
#鈴耶
くっ！絶対許さないんだから！！[p]
#
鈴耶は何とか立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;-----------------------------------------
*fase房中術4
#鈴耶
[chara_mod name="suzune" face="厳しい"]
(今よ！！)[p]
#
鈴耶の膣内が淫猥に蠢き、貪欲に精液を飲み干していく[p]
#犬童
う？おおおおおおおお！？[p]
#
さらなる雄汁を催促するような締め上げに犬童の肉棒が快感に悲鳴を上げる[p]
#鈴耶
「忍法・筒枯らし！！」
#
精どころか魂も魄も吸い上げるような壮絶な吸い上げに犬童は[p]
[call storage="routin/Rt_bochu.ks"]
[if exp="f.EN_SAN <= 0"]
#犬童
ぐおおおおおおおおおっ！！！！[p]
#
絶叫とともに一際濃い精液をぶちまけると、力なくへなへなと座り込んだ[p]
ずるりと抜けた陰茎は持ち主同様すっかり覇気を失い項垂れている[p]
#鈴耶
隙あり！！[p]
#
敵は虚脱状態になった(3ターン)[p]
[eval exp="f.En_Wiseman=1 , f.En_Wiseman_time=3"]
[else]
#犬童
ぐおおおおおおおおおっ！！！！[p]
#
絶叫とともに犬童は鈴耶を突き飛ばすようにして無理やり肉棒を引き抜いた[p]
#鈴耶
あら、残念[p]
#
秘裂からどろりと精液を零しながら鈴耶は悪戯っぽく笑った[p]
[eval exp="f.En_Raptured += 1"]
[endif]
[jump target="*finish"]
[s]


;-----------------------------------------
*fase4気絶
[chara_mod name="suzune" face="レイプ目"]
[eval exp="f.bind = 0"]
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
どろりと鈴耶の秘裂から精液がこぼれた[p]
#犬童
このままヤリ捨てるのは勿体ねえ上玉だな[r]
ねぐらまでお持ち帰りさせてもらおうか！！[p]
#
犬童はニヤリとほくそ笑むと鈴耶を担ぎ上げて意気揚々と闇の中へ消えていった[p]
ゲームオーバー（実際には犬童の住処へ続きます）
[s]

;フィニッシュ-----------------------------------------------------------------------
*finish
#
[eval exp="f.bind = 0"]
男の精を受けて鈴耶の気力が増加した[p]
[eval exp="f.MP += 30 "]
[eval exp="f.MP = 100" cond="f.MP > 100"][WSs]
射精した敵は虚精状態になった（３ラウンド組付封印）[p]
[eval exp="f.En_Wiseman = 1 , f.En_Wiseman_time = 4 "]
[jump target="*Round_end"]

[call storage="routin/Rt_dairy.ks"]
[jump target="*home_start"]
[s]
