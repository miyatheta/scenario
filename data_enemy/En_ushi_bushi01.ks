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
武士を撃退した[p]
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
武士の攻撃[r]
「直突き」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 40"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"]
[call storage="macro/Mc_invincible.ks"]
[else]
[eval exp="tf.argment = f.EN_STR * 10 * f.GRD"]
[eval exp="tf.argment = tf.argment * (10 - f.En_Raptured ) / 10"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][DAMED][WSs]
[endif]
[jump target="*Round_end"][s]

*enemy_attack2
#
武士の攻撃[r]
「袈裟斬り」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 0"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"]
[call storage="macro/Mc_invincible.ks"]
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
武士の組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 0"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の組付きを回避した[p][AVOID][WSs]
[jump target="*Round_end"][s]
[elsif exp="f.invincible > 0"]
[call storage="macro/Mc_invincible.ks"]
[jump target="*Round_end"][s]
[endif]
鈴耶は武士に組み付かれた[p]
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

*fase1
[call storage="routin/Rt_bind_fase.ks"]
;抵抗１
[call storage="PL_bind.ks"]
;抵抗成功
[jump target="*Round_end" cond="f.bind <= 0"]
;段階１
#
武士は鈴耶の胸を揉みしだいた[p]
;快感ダメージ
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="routin/Rt_kaikan.ks" target="*BOOB"]
;状態異常による追加ダメージ
[call storage="asset/As_extra_reaction.ks" target="*milk" cond="f.Milk > 0"]
;絶頂判定
[call storage="macro/Mc_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
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
[call storage="macro/Mc_orgasm.ks"]
[chara_mod name="suzune" face="喘ぎ"]
[if exp="f.HP <= 0"][call target="*fase気絶1"][endif]
#武士
なんと他愛ない！！[p]
これでくノ一を名乗るとは片腹痛いわ！[p]
#鈴耶
いやぁ、言わないでぇ・・・[p]
#武士
はっ！随分とだらしのない乳だな！！[p]
よかろう！拙者がここで躾けてやろう！！[p]
#
武士は鈴耶の痴態に相好を崩した[p]
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
[call storage="macro/Mc_orgasm.ks" target="*endure"]
#武士
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
[call storage="macro/Mc_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase気絶1"][endif]
#武士
なんと他愛ない！！[p]
これでくノ一を名乗るとは片腹痛いわ！[p]
[chara_mod name="suzune" face="苦しみ"]
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
鈴耶は甘い声で武士にしなだれかかった[p]
#武士
まったくだらしのない乳だな！！[p]
よかろう！拙者がここで躾けてやろう！！[p]
#
武士は鈴耶の反応に相好を崩した[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase通常1
[chara_mod name="suzune" face="苦しみ"]
#鈴耶
んうっ！揉むなぁ！！[p]
#武士
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
#武士
おおおおおお！？[p]
#
酩酊した武士の能力が低下した[p]

[eval exp="f.En_Raptured += 1"]
[eval exp="f.rapture = 0"]
[jump target="*fase2"]
[s]

;-----------------------------------------
*fase気絶1
[chara_mod name="suzune" face="レイプ目"]
鈴耶は気絶した！[p]
#武士
まさか！？もう気をやるとは！！[p]
まだ何も聞いておらぬぞ！！[p]
目覚めよ！！ハァッ！！[p]
#鈴耶
かはっ！！[p]
#
武士は気絶していた鈴耶に活を入れた[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase2
;抵抗２
[call storage="PL_bind.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階２
#
武士はマラを鈴耶の尻に擦りつけてきた[p]
;快感ダメージ
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="routin/Rt_kaikan.ks" target="*ANAL"]
[call storage="macro/Mc_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
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
[call storage="macro/Mc_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase2気絶"][endif]
#武士
何とどんだけ欲求不満なんだよ！！[p]
[chara_mod name="suzune" face="喘ぎ"]
#鈴耶
あぁ！焦らさないでぇ…[p]
#
鈴耶は自ら腰をマラに押し付けくねらせる[p]
#武士
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
[call storage="macro/Mc_orgasm.ks" target="*endure"]
#武士
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#武士
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
[call storage="macro/Mc_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase2気絶"][endif]
#武士
おいおい、まだ前戯だってのにどんだけ欲求不満なんだ？[p]
#鈴耶
う、うるひゃいい！！[p]
#武士
へへっ！！じゃあ本番といくか！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase淫乱2
[chara_mod name="suzune" face="喘ぎ"]
#武士
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
んっ！焦らさないで…[p]
#
鈴耶は自ら腰をマラに押し付けくねらせた[p]
#武士
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase通常2
[chara_mod name="suzune" face="苦しみ"]
#武士
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#武士
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
淫蜜が潤滑油となり得も言われぬ快感が武士を襲う[p]
[call storage="routin/Rt_bochu.ks"]
#武士
おおおおおお！？[p]
#
激しい快感が武士を襲う[p]
武士の能力が低下した[p]

[eval exp="f.En_Raptured += 1"]
[eval exp="f.rapture = 0"]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2気絶
[chara_mod name="suzune" face="レイプ目"]
#
鈴耶は気絶した！[p]
#武士
はっはぁ！！ケツ穴ほじられて白目剥くとはなぁ！！[p]
#鈴耶
・・・・・・・・・[p]
#武士
オラァ！！起きろ！！[p]
#鈴耶
くふっ！！[p]
#
武士は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]
;------------------------------------------------------------------------------

*fase3
;抵抗3
[call storage="PL_bind.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階３
#
武士はマラを鈴耶の秘裂に挿入した[p]
;快感ダメージ
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="routin/Rt_kaikan.ks" target="*VGNA"]
[call storage="macro/Mc_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
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
[call storage="macro/Mc_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#武士
へっ！まだ入れただけだぜ！！こっからが本番だ！！[p]
#鈴耶
あんっ！！もっとぉ！！めちゃくちゃにしてぇ！！[p]
#
武士は鈴耶の痴態に鼻息を荒くした[p]
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
[call storage="macro/Mc_orgasm.ks" target="*endure"]
#武士
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
[call storage="macro/Mc_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#武士
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
#武士
おおう！！こいつはすげぇ名器だ！！[p]
#
武士は快感に鼻息を荒くした[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase通常3
[chara_mod name="suzune" face="泣き"]
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に歯を食いしばった[p]
#武士
どうだ！俺のマラの感触は！！[p]
#鈴耶
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#武士
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
電撃が走るような快感が武士を襲う[p]
[call storage="routin/Rt_bochu.ks"]
#武士
おおおおおお！？[p]
#
強烈な快感が武士を襲う[p]
武士の能力が低下した[p]
[eval exp="f.En_Raptured += 1"]
[eval exp="f.rapture = 0"]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3気絶
[chara_mod name="suzune" face="レイプ目"]
#
鈴耶は気絶した！[p]
#武士
おいおい！まだ先っちょを挿れただけぜ！！[p]
#鈴耶
・・・・・・・・・[p]
#武士
オラァ！！起きろ！！[p]
#鈴耶
かはっ！！[p]
#
武士は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase4
;抵抗4
[call storage="PL_bind.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階４
#
武士はしっかりと鈴耶の腰を抱え込むと激しく腰を打ち付けた[p]
[eval exp="tf.fuck = f.EN_SEX "]
[call storage="routin/Rt_kaikan.ks" target="*VGNA"]
[call storage="macro/Mc_check_orgasm.ks" target="*orgasm" cond="f.ERO >= 1000"]
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
#武士
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
武士の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#武士
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに武士のマラが爆発した[p]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴耶は絶頂した[p]
[call storage="macro/Mc_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#武士
へ、へへ、こいつは凄え名器だったぜ[p]
#
下忍は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
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
#武士
イけぇ！！イっちまええええ！！[p]
#鈴耶
(イっちゃ駄目！イっちゃ駄目！)[p]
#武士
うおおお！出すぞ！！[p]
#鈴耶
くううううううっ！！[p]
#
武士は鈴耶の中で射精した[p]
#鈴耶
（ーーーーーー！！）[p]
#
マラが膣内で爆ぜるのを感じながら鈴耶は快感を押し殺した[r]
鈴耶は絶頂を堪えた！[p]
[call storage="macro/Mc_orgasm.ks" target="*endure"]
#武士
ちっ、イクの我慢しやがったな…[p]
#
武士はマラを引き抜くとつまらなそうに鈴耶の尻を叩いた[p]
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
#武士
イけぇ！！イっちまええええ！！[p]
#鈴耶
いやぁっ！！こんな雑魚なんかにイかされたくないいい！！！[p]
#武士
うおおお！出すぞ！！[p]
#
武士は鈴耶の中で射精した[p]
[chara_mod name="suzune" face="絶頂"]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴耶は絶頂した[p]
[call storage="macro/Mc_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#武士
へへへ、なかなか良かったぜ[p]
#
武士は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
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
#武士
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
武士の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#武士
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに武士のマラが爆発した[p]
#鈴耶
あああああっ！！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
その間も鈴耶の膣はうねり男のマラから根こそぎ精を搾り取った[p]
#武士
へ、へへ、こいつは凄え名器だったぜ[p]
#
下忍は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
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
#武士
うおおお！出すぞ！！ぶちまけてやる！！[p]
#鈴耶
いやあああああっ！！[p]
#武士
うおおおおおおっ！！[p]
#
武士は鈴耶の中で射精した[p]
[jump target="*fase房中術4" cond="f.rapture > 0"]
#鈴耶
あああああっ！！ダメェ・・・！！[p]
#武士
へへへ、なかなか良かったぜ[p]
#
武士は嫌らしく笑いながら鈴耶からマラを引き抜いた[p]
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
#武士
う？おおおおおおおお！？[p]
#
さらなる雄汁を催促するような締め上げに武士の肉棒が快感に悲鳴を上げる[p]
#鈴耶
「忍法・筒枯らし！！」
#
精どころか魂も魄も吸い上げるような壮絶な吸い上げに武士は[p]
[call storage="routin/Rt_bochu.ks"]
[if exp="f.EN_SAN <= 0"]
#武士
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
#武士
ぐおおおおおおおおおっ！！！！[p]
#
絶叫とともに武士は鈴耶を突き飛ばすようにして無理やり肉棒を引き抜いた[p]
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
#武士
へへへ、なかなか良かったぜ[p]
#
武士は白目を剥いて痙攣する鈴耶からマラを引き抜いた[p]
#鈴耶
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴耶はその場に崩折れる[r]
どろりと鈴耶の秘裂から精液がこぼれた[p]
#武士
このままヤリ捨てるのは勿体ねえ上玉だな[r]
ねぐらまでお持ち帰りさせてもらおうか！！[p]
#
武士はニヤリとほくそ笑むと鈴耶を担ぎ上げて意気揚々と闇の中へ消えていった[p]
ゲームオーバー（実際には武士の住処へ続きます）
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
