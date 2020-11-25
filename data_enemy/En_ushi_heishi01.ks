*start
;ラウンド開始時処理--------------------------------------------------------------
[call storage="routin/Rt_battle_round.ks" target="*battle_round_start"]


;PLの行動------------------------------------------------------------------------
#
鈴耶の攻撃[r]
[call storage="PL_battle.ks"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
#
見廻りを撃退した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]

;敵の行動------------------------------------------------------------------------
*enemy_comand_select
[jump target="*enemy_sexhara" cond="f.charm > 0"]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand <= 30"]
[jump target="*enemy_attack1"]
[elsif exp="f.rand <= 60"]
[jump target="*enemy_attack2"]
[else]
[jump target="*enemy_sexhara"]
[endif]

;敵の攻撃------------------------------------------------------------------------
*enemy_attack1
#
見廻りの攻撃[r]
「直突き」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 40"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"]
[call storage="macro_invincible.ks"]
[else]
[eval exp="tf.argment = f.EN_STR * 10 * f.GRD"]
[eval exp="tf.argment = tf.argment * (10 - f.En_Raptured ) / 10"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][DAMED][WSs]
[endif]
[jump target="*Round_end"][s]

*enemy_attack2
#
見廻りの攻撃[r]
「袈裟斬り」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 0"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"]
[call storage="macro_invincible.ks"]
[else]
[eval exp="tf.argment = f.EN_STR * 20 * f.GRD"]
[eval exp="tf.argment = tf.argment * (10 - f.En_Raptured ) / 10"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][DAMED][WSs]
[endif]
[jump target="*Round_end"][s]

;------------------------------------------------------------------------------
*enemy_sexhara
#
[eval exp="f.charm = 0"]
[jump target="*enemy_comand_select" cond="f.En_Wiseman > 0"]
見廻りの組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 30"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の組付きを回避した[p][AVOID][WSs]
[jump target="*Round_end"][s]
[elsif exp="f.invincible > 0"]
[call storage="macro_invincible.ks"]
[jump target="*Round_end"][s]
[endif]
鈴耶は見廻りに組み付かれた[p]
[eval exp="f.bind = f.GRB"]
[jump target="*fase1"]
[s]
;------------------------------------------------------------------------------

*Round_end
#
[if exp="f.HP < 1"][return][endif]
[if exp="f.Quest_type == 3"][call storage="routin/Rt_progress.ks" target="*guard"][endif]
[if exp="f.Quest_type == 4"][call storage="routin/Rt_progress.ks" target="*trace"][endif]
[call storage="routin/Rt_battle_round.ks" target="*battle_round_end"]
[jump target="*start"][s]

;------------------------------------------------------------------------------
*;------------------------------------------------------------------------------
*fase1
;抵抗１
[call storage="PL_bind.ks"]
;抵抗成功
[jump target="*Round_end" cond="f.bind <= 0"]
;段階１
#
見廻りは鈴耶の胸を揉みしだいた[p]
;快感ダメージ
[eval exp="tf.fuck = f.SEX "]
[call storage="routin/Rt_kaikan.ks" target="*BOOB"]
[call storage="asset_extra_reaction.ks" target="*orgasm"]
[call storage="asset_extra_reaction.ks" target="*milk" cond="f.Milk > 0"]
;リアクション
[if exp="f.ERO >= 1000 && f.nasty > 0"][jump target="*fase1淫乱絶頂"]
[elsif exp="f.ERO >= 1000 && f.endure > 0"][jump target="*fase1我慢絶頂"]
[elsif exp="f.ERO >= 1000"][jump target="*fase1通常絶頂"]
[elsif exp="f.nasty > 0"][jump target="*fase1淫乱"]
[else][jump target="*fase1通常"]
[endif]
;-----------------------------------------
*fase1淫乱絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
胸を弄ばれ鈴耶は大きな嬌声を上げながら絶頂した[p]
[call storage="macro_orgasm.ks"]
[chara_mod name="suzune" face="喘ぎ"]
[if exp="f.HP <= 0"][call target="*fase1気絶"][endif]
#見廻り
なんと他愛ない！！[p]
これでくノ一を名乗るとは片腹痛いわ！[p]
#鈴耶
いやぁ、言わないでぇ・・・[p]
#見廻り
はっ！随分とだらしのない乳だな！！[p]
よかろう！拙者がここで躾けてやろう！！[p]
#
見廻りは鈴耶の痴態に相好を崩した[p]
房中術の効果で見廻りのステータスが低下した[p]


[jump target="*fase2"]
[s]
;-----------------------------------------
*fase1我慢絶頂
[chara_mod name="suzune" face="泣き" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸から押し寄せる快感の波に鈴耶は必死に耐えた[r]
鈴耶は絶頂を堪えた！[p]
#見廻り
ほぉ堪えたか？[p]
だが、随分とだらしのない乳だな[p]
#鈴耶
うっ、うるさいっ！！離しなさいよっ！！[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1通常絶頂
[chara_mod name="suzune" face="絶頂" ]
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸からの快感に鈴耶は体を震わせた[r]
;鈴耶は絶頂した[p]
[call storage="macro_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase1気絶"][endif]
#見廻り
なんと他愛ない！！[p]
これでくノ一を名乗るとは片腹痛いわ！[p]
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
くっ・・・言わせておけばぁ！！[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声で見廻りにしなだれかかった[p]
#見廻り
まったくだらしのない乳だな！！[p]
よかろう！拙者がここで躾けてやろう！！[p]
#
見廻りは鈴耶の反応に相好を崩した[p]
房中術の効果で見廻りのステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1通常
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
んうっ！揉むなぁ！！[p]
#見廻り
はっ！さすがくノ一男好きのするだらしのない乳をしておる！！[p]
#鈴耶
だっ、だらしないて何よ！！[p]
#
[jump target="*fase2"]
[s]

;-----------------------------------------
*fase1気絶
[chara_mod name="suzune" face="レイプ目"]
鈴耶は気絶した！[p]
#見廻り
まさか！？もう気をやるとは！！[p]
まだ何も聞いておらぬぞ！！[p]
目覚めよ！！ハァッ！！[p]
#鈴耶
かはっ！！[p]
#
見廻りは気絶していた鈴耶に活を入れた[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase2
;抵抗２
[call storage="PL_bind.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階２
#
見廻りはマラを鈴耶の尻に擦りつけてきた[p]
;快感ダメージ
[eval exp="tf.fuck = f.SEX "]
[call storage="routin/Rt_kaikan.ks" target="*ANAL"]
[call storage="asset_extra_reaction.ks" target="*orgasm"]
;リアクション
[if exp="f.ERO >= 1000 && f.nasty > 0"][jump target="*fase2淫乱絶頂"]
[elsif exp="f.ERO >= 1000 && f.endure > 0"][jump target="*fase2我慢絶頂"]
[elsif exp="f.ERO >= 1000"][jump target="*fase2通常絶頂"]
[elsif exp="f.rapture > 0"][jump target="*fase2淫乱"]
[else][jump target="*fase2通常"]
[endif]
;-----------------------------------------

*fase2淫乱絶頂
[chara_mod name="suzune" face="絶頂"]
#鈴耶
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
鈴耶は大きな嬌声を上げながら絶頂した[p]
[call storage="macro_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase2気絶"][endif]
#見廻り
何とどんだけ欲求不満なんだよ！！[p]
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あぁ！焦らさないでぇ…[p]
#
鈴耶は自ら腰をマラに押し付けくねらせる[p]
#見廻り
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
#
見廻りは鈴耶の痴態に相好を崩した[p]
房中術の効果で見廻りのステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2我慢絶頂
[chara_mod name="suzune" face="泣き"]
#
快感でびくびくと鈴耶の体が痙攣する[p]
#鈴耶
(ダメッ！！こんな程度で絶対イかされたりしない！！)[p]
#
鈴耶は眉根を寄せて気色悪い感触に耐えた[p]
鈴耶は絶頂を堪えた！[p]
#見廻り
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#見廻り
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2通常絶頂
[chara_mod name="suzune" face="絶頂"]
#鈴耶
(ダメッ！！イクぅーーーーーッ！！)[p]
#
びくびくと鈴耶の体が痙攣する[p]
;鈴耶は絶頂した[p]
[call storage="macro_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase2気絶"][endif]
#見廻り
おいおい、まだ前戯だってのにどんだけ欲求不満なんだ？[p]
#鈴耶
う、うるひゃいい！！[p]
#見廻り
へへっ！！じゃあ本番といくか！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2淫乱
[chara_mod name="suzune" face="喘ぎ"]
#見廻り
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
んっ！焦らさないで…[p]
#
鈴耶は自ら腰をマラに押し付けくねらせた[p]
#見廻り
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2通常
[chara_mod name="suzune" face="苦しみ"]
#見廻り
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#見廻り
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
[jump target="*fase3"]
[s]

;-----------------------------------------

*fase2気絶
[chara_mod name="suzune" face="レイプ目"]
#
鈴耶は気絶した！[p]
#見廻り
はっはぁ！！ケツ穴ほじられて白目剥くとはなぁ！！[p]
#鈴耶
・・・・・・・・・[p]
#見廻り
オラァ！！起きろ！！[p]
#鈴耶
くふっ！！[p]
#
見廻りは気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]
;------------------------------------------------------------------------------

*fase3
;抵抗3
[call storage="PL_bind.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階３
#
見廻りはマラを鈴耶の秘裂に挿入した[p]
;快感ダメージ
[eval exp="tf.fuck = f.SEX "]
[call storage="routin/Rt_kaikan.ks" target="*VGNA"]
[call storage="asset_extra_reaction.ks" target="*orgasm"]
;リアクション
[if exp="f.ERO >= 1000 && f.nasty > 0"][jump target="*fase3淫乱絶頂"]
[elsif exp="f.ERO >= 1000 && f.endure > 0"][jump target="*fase3我慢絶頂"]
[elsif exp="f.ERO >= 1000"][jump target="*fase3通常絶頂"]
[elsif exp="f.rapture > 0"][jump target="*fase3淫乱"]
[else][jump target="*fase3通常"]
[endif]
;-----------------------------------------

*fase3淫乱絶頂
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[r]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴耶は挿入と同時に大きな嬌声を上げながら絶頂した[p]
[call storage="macro_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#見廻り
へっ！まだ入れただけだぜ！！こっからが本番だ！！[p]
#鈴耶
あんっ！！もっとぉ！！めちゃくちゃにしてぇ！！[p]
#
見廻りは鈴耶の痴態に鼻息を荒くした[p]
房中術の効果で見廻りのステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3我慢絶頂
[chara_mod name="suzune" face="泣き"]
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に歯を食いしばった[p]
跳ね回りそうな体を押さえつけ、快感を拒絶する[p]
鈴耶は絶頂を堪えた！[p]
#見廻り
へっ！イクのをこらえやがったな？だが本番はここからだぜ！！[p]
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
ふんっ！調子にのんじゃないわよ！！この下手くそ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3通常絶頂
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
[call storage="macro_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#見廻り
へっ！まだ入れただけだぜ？こっからが本番だ！！[p]
#鈴耶
ううっ！この調子にのんじゃないわよ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[r]
#
鈴耶は自ら腰を振り、膣でマラを締め付けた[p]
#見廻り
おおう！！こいつはすげぇ名器だ！！[p]
#
見廻りは快感に鼻息を荒くした[p]
房中術の効果で見廻りのステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3通常
[chara_mod name="suzune" face="泣き"]
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に歯を食いしばった[p]
#見廻り
どうだ！俺のマラの感触は！！[p]
#鈴耶
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#見廻り
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3気絶
[chara_mod name="suzune" face="レイプ目"]
#
鈴耶は気絶した！[p]
#見廻り
おいおい！まだ先っちょを挿れただけぜ！！[p]
#鈴耶
・・・・・・・・・[p]
#見廻り
オラァ！！起きろ！！[p]
#鈴耶
かはっ！！[p]
#
見廻りは気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase4
;抵抗4
[call storage="PL_bind.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階４
#
見廻りはしっかりと鈴耶の腰を抱え込むと激しく腰を打ち付けた[p]
[eval exp="tf.fuck = f.SEX "]
[call storage="routin/Rt_kaikan.ks" target="*VGNA"]
[call storage="asset_extra_reaction.ks" target="*orgasm"]
;リアクション
[if exp="f.ERO >= 1000 && f.nasty > 0"][jump target="*fase4淫乱絶頂"]
[elsif exp="f.ERO >= 1000 && f.endure > 0"][jump target="*fase4我慢絶頂"]
[elsif exp="f.ERO >= 1000"][jump target="*fase4通常絶頂"]
[elsif exp="f.rapture > 0"][jump target="*fase4淫乱"]
[else][jump target="*fase4通常"]
[endif]
;----------------------------------------

*fase4淫乱絶頂
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！いいっ！！早く！早く頂戴！！[p]
#見廻り
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
見廻りの目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#見廻り
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに見廻りのマラが爆発した[p]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴耶は絶頂した[p]
[call storage="macro_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#見廻り
へ、へへ、腰が抜けちまいそうだぜ[p]
#
見廻りは鈴耶からマラを引き抜くとヨタヨタと後退りした。
房中術の効果で見廻りのステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[chara_mod name="suzune" face="厳しい"]
#鈴耶
ふう、なかなか良かったわね。でも楽しんだ分は返してもらうわよ！！！[p]
#
鈴耶は立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase4我慢絶頂
[chara_mod name="suzune" face="泣き"]
#見廻り
イけぇ！！イっちまええええ！！[p]
#鈴耶
(イっちゃ駄目！イっちゃ駄目！)[p]
#見廻り
うおおお！出すぞ！！[p]
#鈴耶
くううううううっ！！[p]
#
見廻りは鈴耶の中で射精した[p]
#鈴耶
（ーーーーーー！！）[p]
#
マラが膣内で爆ぜるのを感じながら鈴耶は快感を押し殺した[r]
鈴耶は絶頂を堪えた！[p]
#見廻り
ちっ、イクの我慢しやがったな…[p]
#
見廻りはマラを引き抜くとつまらなそうに鈴耶の尻を叩いた[p]
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

*fase4通常絶頂
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！いやあっ！！イクぅ！！[p]
#見廻り
イけぇ！！イっちまええええ！！[p]
#鈴耶
いやぁっ！！こんな雑魚なんかにイかされたくないいい！！！[p]
#見廻り
うおおお！出すぞ！！[p]
#
見廻りは鈴耶の中で射精した[p]
[chara_mod name="suzune" face="絶頂"]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴耶は絶頂した[p]
[call storage="macro_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#見廻り
へへへ、なかなか良かったぜ[p]
#
見廻りは嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
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

*fase4淫乱
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
ああん！いいっ！！早く！早く頂戴！！[p]
#見廻り
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
見廻りの目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#見廻り
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに見廻りのマラが爆発した[p]
#鈴耶
あああああっ！！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
その間も鈴耶の膣はうねり男のマラから根こそぎ精を搾り取った[p]
#見廻り
へ、へへ、腰が抜けちまいそうだぜ[p]
#
見廻りは鈴耶からマラを引き抜くとヨタヨタと後退りした。
房中術の効果で見廻りのステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[chara_mod name="suzune" face="厳しい"]
#鈴耶
さて、楽しんだ分は返してもらうわよ！！！[p]
#
鈴耶は立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase4通常
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あんっ！あんっ！ひぃん！！[p]
#見廻り
うおおお！出すぞ！！ぶちまけてやる！！[p]
#鈴耶
いやあああああっ！！[p]
#見廻り
うおおおおおおっ！！[p]
#
見廻りは鈴耶の中で射精した[p]
#鈴耶
あああああっ・・・[p]
#見廻り
へへへ、なかなか良かったぜ[p]
#
見廻りは嫌らしく笑いながら鈴耶からマラを引き抜いた[p]
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

*fase4気絶
[chara_mod name="suzune" face="レイプ目"]
[eval exp="f.bind = 0"]
#
鈴耶は気絶した！[p]
#見廻り
へへへ、なかなか良かったぜ[p]
#
見廻りは白目を剥いて痙攣する鈴耶からマラを引き抜いた[p]
#鈴耶
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴耶はその場に崩折れる[r]
どろりと鈴耶の秘裂から精液がこぼれた[p]
#見廻り
このままヤリ捨てるのは勿体ねえ上玉だな[r]
ねぐらまでお持ち帰りさせてもらおうか！！[p]
#
見廻りはニヤリとほくそ笑むと鈴耶を担ぎ上げて意気揚々と闇の中へ消えていった[p]
ゲームオーバー（実際には見廻りの住処へ続きます）
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
