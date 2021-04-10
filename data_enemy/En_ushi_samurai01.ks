*start
;ラウンド開始時処理--------------------------------------------------------------
[call storage="battle/Rt_battle_round.ks" target="*battle_round_start"]


;PLの行動------------------------------------------------------------------------
#
鈴猫の攻撃[r]
[call storage="battle/PL_battle.ks"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
#
侍を撃退した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]

;敵の行動------------------------------------------------------------------------
*enemy_comand_select
[jump target="*enemy_sexhara" cond="f.charm > 0"]
[getrand min="1" max="100" var="f.rand"]
[if exp=" 0 == f.Round % 4"]
[jump target="*enemy_special1"]
[elsif exp="f.rand <= 20"]
[jump target="*enemy_attack1"]
[elsif exp="f.rand <= 50"]
[jump target="*enemy_attack2"]
[else]
[jump target="*enemy_sexhara"]
[endif]

;敵の攻撃------------------------------------------------------------------------
*enemy_attack1
#
侍の攻撃[r]
「直突き」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 40"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴猫は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"]
[call storage="battle/Rt_invincible.ks"]
[else]
[eval exp="tf.argment = f.EN_STR * 10 * f.GRD"]
[eval exp="tf.argment = tf.argment * (10 - f.En_Raptured ) / 10"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][DAMED][WSs]
[endif]
[jump target="*Round_end"][s]

*enemy_attack2
#
侍の攻撃「袈裟斬り」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 0"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴猫は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"]
[call storage="battle/Rt_invincible.ks"]
[else]
[eval exp="tf.argment = f.EN_STR * 20 * f.GRD"]
[eval exp="tf.argment = tf.argment * (10 - f.En_Raptured ) / 10"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][DAMED][WSs]
[endif]
[jump target="*Round_end"][s]

*enemy_special1
#
侍の攻撃「斬岩剣」[p]
「ヴォぉぉぉぉぉぉ！！」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 0"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴猫は敵の攻撃を回避した[p][AVOID][WSs]
[elsif exp="f.invincible > 0"]
[call storage="battle/Rt_invincible.ks"]
[else]
[eval exp="tf.argment = f.EN_STR * 40 * f.GRD"]
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
侍の組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 30"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴猫は敵の組付きを回避した[p][AVOID][WSs]
[jump target="*Round_end"][s]
[elsif exp="f.invincible > 0"]
[call storage="battle/Rt_invincible.ks"]
[jump target="*Round_end"][s]
[endif]
鈴猫は侍に組み付かれた[p]
[eval exp="f.bind = f.GRB"]
[jump target="*fase1"]
[s]

;------------------------------------------------------------------------------

*Round_end
#
[if exp="f.HP < 1"][return][endif]
[if exp="f.Quest_type == 3"][call storage="routin/Rt_progress.ks" target="*guard"][endif]
[if exp="f.Quest_type == 4"][call storage="routin/Rt_progress.ks" target="*trace"][endif]
[call storage="battle/Rt_battle_round.ks" target="*battle_round_end"]
[jump target="*start"][s]

;------------------------------------------------------------------------------

*fase1

;抵抗１
[call storage="battle/PL_bind.ks"]
;抵抗成功
[jump target="*Round_end" cond="f.bind <= 0"]
;段階１
#
侍は鈴猫の胸を揉みしだいた[p]
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
#鈴猫
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
胸を弄ばれ鈴猫は大きな嬌声を上げながら絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[chara_mod name="suzune" face="喘ぎ"]
[if exp="f.HP <= 0"][call target="*fase気絶1"][endif]
#侍
なんと他愛ない！！[p]
これでくノ一を名乗るとは片腹痛いわ！[p]
#鈴猫
いやぁ、言わないでぇ・・・[p]
#侍
はっ！随分とだらしのない乳だな！！[p]
よかろう！拙者がここで躾けてやろう！！[p]
#
侍は鈴猫の痴態に相好を崩した[p]
[jump target="*fase2"]
[s]
;-----------------------------------------
*fase我慢絶頂1
[chara_mod name="suzune" face="泣き" ]
#鈴猫
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸から押し寄せる快感の波に鈴猫は必死に耐えた[r]
鈴猫は絶頂を堪えた！[p]
[call storage="bochu/Rt_orgasm.ks" target="*endure"]
#侍
ほぉ堪えたか？[p]
だが、随分とだらしのない乳だな[p]
#鈴猫
うっ、うるさいっ！！離しなさいよっ！！[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase通常絶頂1
[chara_mod name="suzune" face="絶頂" ]
#鈴猫
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸からの快感に鈴猫は体を震わせた[r]
;鈴猫は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase気絶1"][endif]
#侍
なんと他愛ない！！[p]
これでくノ一を名乗るとは片腹痛いわ！[p]
#鈴猫
くっ・・・！！[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase淫乱1
[chara_mod name="suzune" face="喘ぎ"]
#鈴猫
あんっ！！もっと、してぇ…[p]
#
鈴猫は甘い声で侍にしなだれかかった[p]
#侍
まったくだらしのない乳だな！！[p]
よかろう！拙者がここで躾けてやろう！！[p]
#
侍は鈴猫の反応に相好を崩した[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase通常1
[chara_mod name="suzune" face="苦しみ"]
#鈴猫
んうっ！揉むなぁ！！[p]
#侍
はっ！さすがくノ一男好きのするだらしのない乳をしておる！！[p]
#鈴猫
だっ、だらしないて何よ！！[p]
#
[jump target="*fase2"]
[s]

;-----------------------------------------
*fase気絶1
[chara_mod name="suzune" face="レイプ目"]
鈴猫は気絶した！[p]
#侍
まさか！？もう気をやるとは！！[p]
まだ何も聞いておらぬぞ！！[p]
目覚めよ！！ハァッ！！[p]
#鈴猫
かはっ！！[p]
#
侍は気絶していた鈴猫に活を入れた[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase2
;抵抗２
[call storage="battle/PL_bind.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階２
#
侍はマラを鈴猫の尻に擦りつけてきた[p]
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
#鈴猫
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
鈴猫は大きな嬌声を上げながら絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase2気絶"][endif]
#侍
何とどんだけ欲求不満なんだよ！！[p]
[chara_mod name="suzune" face="喘ぎ"]
#鈴猫
あぁ！焦らさないでぇ…[p]
#
鈴猫は自ら腰をマラに押し付けくねらせる[p]
#侍
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
#
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase我慢絶頂2
[chara_mod name="suzune" face="泣き"]
#
快感でびくびくと鈴猫の体が痙攣する[p]
#鈴猫
(ダメッ！！こんな程度で絶対イかされたりしない！！)[p]
#
鈴猫は眉根を寄せて気色悪い感触に耐えた[p]
鈴猫は絶頂を堪えた！[p]
[call storage="bochu/Rt_orgasm.ks" target="*endure"]
#侍
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴猫
くっ！！汚いものをこすりつけるなぁっ！！[p]
#侍
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase通常絶頂2
[chara_mod name="suzune" face="絶頂"]
#鈴猫
(ダメッ！！イクぅーーーーーッ！！)[p]
#
びくびくと鈴猫の体が痙攣する[p]
;鈴猫は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase2気絶"][endif]
#侍
おいおい、まだ前戯だってのにどんだけ欲求不満なんだ？[p]
#鈴猫
う、うるひゃいい！！[p]
#侍
へへっ！！じゃあ本番といくか！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase淫乱2
[chara_mod name="suzune" face="喘ぎ"]
#侍
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴猫
んっ！焦らさないで…[p]
#
鈴猫は自ら腰をマラに押し付けくねらせた[p]
#侍
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase通常2
[chara_mod name="suzune" face="苦しみ"]
#侍
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴猫
くっ！！汚いものをこすりつけるなぁっ！！[p]
#侍
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
[jump target="*fase3"]
[s]

;-----------------------------------------

*fase2気絶
[chara_mod name="suzune" face="レイプ目"]
#
鈴猫は気絶した！[p]
#侍
はっはぁ！！ケツ穴ほじられて白目剥くとはなぁ！！[p]
#鈴猫
・・・・・・・・・[p]
#侍
オラァ！！起きろ！！[p]
#鈴猫
くふっ！！[p]
#
侍は気絶していた鈴猫を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]
;------------------------------------------------------------------------------

*fase3
;抵抗3
[call storage="battle/PL_bind.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階３
#
侍はマラを鈴猫の秘裂に挿入した[p]
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
#鈴猫
ああん！！これぇ！これが欲しかったのぉ！！[r]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴猫は挿入と同時に大きな嬌声を上げながら絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#侍
へっ！まだ入れただけだぜ！！こっからが本番だ！！[p]
#鈴猫
あんっ！！もっとぉ！！めちゃくちゃにしてぇ！！[p]
#
侍は鈴猫の痴態に鼻息を荒くした[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase我慢絶頂3
[chara_mod name="suzune" face="泣き"]
#鈴猫
（ーーーーーーーッ！！）[p]
#
鈴猫は挿入の衝撃に歯を食いしばった[p]
跳ね回りそうな体を押さえつけ、快感を拒絶する[p]
鈴猫は絶頂を堪えた！[p]
[call storage="bochu/Rt_orgasm.ks" target="*endure"]
#侍
へっ！イクのをこらえやがったな？だが本番はここからだぜ！！[p]
[chara_mod name="suzune" face="苦しみ"]
#鈴猫
ふんっ！調子にのんじゃないわよ！！この下手くそ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase通常絶頂3
[chara_mod name="suzune" face="泣き"]
#鈴猫
（ーーーーーーーッ！！）[p]
#
鈴猫は挿入の衝撃に目を見開いた[p]
備えていたつもりだったが体は意思の手綱を離れ痙攣を始める[r]
そして[p]
[chara_mod name="suzune" face="絶頂"]
#鈴猫
いやあああっ！！らめぇぇぇぇっ！！[p]
#
;鈴猫は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#侍
へっ！まだ入れただけだぜ？こっからが本番だ！！[p]
#鈴猫
ううっ！この調子にのんじゃないわよ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase淫乱3
[chara_mod name="suzune" face="喘ぎ"]
#鈴猫
ああん！！これぇ！これが欲しかったのぉ！！[r]
#
鈴猫は自ら腰を振り、膣でマラを締め付けた[p]
#侍
おおう！！こいつはすげぇ名器だ！！[p]
#
侍は快感に鼻息を荒くした[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase通常3
[chara_mod name="suzune" face="泣き"]
#鈴猫
（ーーーーーーーッ！！）[p]
#
鈴猫は挿入の衝撃に歯を食いしばった[p]
#侍
どうだ！俺のマラの感触は！！[p]
#鈴猫
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#侍
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
[jump target="*fase4"]
[s]

;-----------------------------------------

*fase3気絶
[chara_mod name="suzune" face="レイプ目"]
#
鈴猫は気絶した！[p]
#侍
おいおい！まだ先っちょを挿れただけぜ！！[p]
#鈴猫
・・・・・・・・・[p]
#侍
オラァ！！起きろ！！[p]
#鈴猫
かはっ！！[p]
#
侍は気絶していた鈴猫を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase4
;抵抗4
[call storage="battle/PL_bind.ks" target="*fase4"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階４
#
侍はしっかりと鈴猫の腰を抱え込むと激しく腰を打ち付けた[p]
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
#鈴猫
ああん！いいっ！！早く！早く頂戴！！[p]
#侍
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
侍の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#侍
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに侍のマラが爆発した[p]
#鈴猫
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴猫は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴猫は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#侍
へ、へへ、こいつは凄え名器だったぜ[p]
#
下忍は嫌らしく笑いながらマラを引き抜くと鈴猫の尻を叩いた[p]
#鈴猫
ああんっ！！[p]
#
その場にくずおれた鈴猫の秘裂からごぽりと精液が溢れた[p]
#鈴猫
はああああああ…[p]
#
鈴猫はよろよろと立ち上がったが、その表情は熱に浮かされたように蕩け、
潤んだ瞳は男の股間を物欲しそうに追いかけていた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase我慢絶頂4
[chara_mod name="suzune" face="泣き"]
#侍
イけぇ！！イっちまええええ！！[p]
#鈴猫
(イっちゃ駄目！イっちゃ駄目！)[p]
#侍
うおおお！出すぞ！！[p]
#鈴猫
くううううううっ！！[p]
#
侍は鈴猫の中で射精した[p]
#鈴猫
（ーーーーーー！！）[p]
#
マラが膣内で爆ぜるのを感じながら鈴猫は快感を押し殺した[r]
鈴猫は絶頂を堪えた！[p]
[call storage="bochu/Rt_orgasm.ks" target="*endure"]
#侍
ちっ、イクの我慢しやがったな…[p]
#
侍はマラを引き抜くとつまらなそうに鈴猫の尻を叩いた[p]
#鈴猫
んっ！！[p]
#
その場にくずおれた鈴猫の秘裂からごぽりと精液が溢れた[p]
[chara_mod name="suzune" face="厳しい"]
#鈴猫
くっ！絶対許さないんだから！！[p]
#
鈴猫はよろよろと立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase通常絶頂4
[chara_mod name="suzune" face="喘ぎ"]
#鈴猫
ああん！いやあっ！！イクぅ！！[p]
#侍
イけぇ！！イっちまええええ！！[p]
#鈴猫
いやぁっ！！こんな雑魚なんかにイかされたくないいい！！！[p]
#侍
うおおお！出すぞ！！[p]
#
侍は鈴猫の中で射精した[p]
[chara_mod name="suzune" face="絶頂"]
#鈴猫
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴猫は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴猫は絶頂した[p]
[call storage="bochu/Rt_orgasm.ks"]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#侍
へへへ、なかなか良かったぜ[p]
#
侍は嫌らしく笑いながらマラを引き抜くと鈴猫の尻を叩いた[p]
#鈴猫
ああんっ！！[p]
#
その場にくずおれた鈴猫の秘裂からごぽりと精液が溢れた[p]
[chara_mod name="suzune" face="厳しい"]
#鈴猫
くっ！絶対許さないんだから！！[p]
#
鈴猫はよろよろと立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase淫乱4
[chara_mod name="suzune" face="喘ぎ"]
#鈴猫
ああん！いいっ！！早く！早く頂戴！！[p]
#侍
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
侍の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#侍
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに侍のマラが爆発した[p]
#鈴猫
あああああっ！！！[p]
#
鈴猫は精の迸りを子宮に感じながら嬌声を上げた[r]
その間も鈴猫の膣はうねり男のマラから根こそぎ精を搾り取った[p]
#侍
へ、へへ、こいつは凄え名器だったぜ[p]
#
下忍は嫌らしく笑いながらマラを引き抜くと鈴猫の尻を叩いた[p]
#鈴猫
ああんっ！！[p]
#
その場にくずおれた鈴猫の秘裂からごぽりと精液が溢れた[p]
#鈴猫
はああああああ…[p]
#
鈴猫はよろよろと立ち上がったが、その表情は熱に浮かされたように蕩け、
潤んだ瞳は男の股間を物欲しそうに追いかけていた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase通常4
[chara_mod name="suzune" face="喘ぎ"]
#鈴猫
あんっ！あんっ！ひぃん！！[p]
#侍
うおおお！出すぞ！！ぶちまけてやる！！[p]
#鈴猫
いやあああああっ！！[p]
#侍
うおおおおおおっ！！[p]
#
侍は鈴猫の中で射精した[p]
[jump target="*fase房中術4" cond="f.rapture > 0"]
#鈴猫
あああああっ！！ダメェ・・・！！[p]
#侍
へへへ、なかなか良かったぜ[p]
#
侍は嫌らしく笑いながら鈴猫からマラを引き抜いた[p]
#鈴猫
あんっ！[p]
#
どろりと鈴猫の秘裂から精液がこぼれた[p]
[chara_mod name="suzune" face="厳しい"]
#鈴猫
くっ！絶対許さないんだから！！[p]
#
鈴猫は何とか立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;-----------------------------------------
*fase房中術4
#鈴猫
[chara_mod name="suzune" face="厳しい"]
(今よ！！)[p]
[call storage="bochu/Rt_bochu.ks" target="*bochu_select"]
#
鈴猫の膣内が淫猥に蠢き、貪欲に精液を飲み干していく[p]
[if exp="f.EN_SAN <= 0"]
#侍
ぐおおおおおおおおおっ！！！！[p]
#
絶叫とともに一際濃い精液をぶちまけると、力なくへなへなと座り込んだ[p]
ずるりと抜けた陰茎は持ち主同様すっかり覇気を失い項垂れている[p]
#鈴猫
隙あり！！[p]
#
敵は虚脱状態になった(3ターン)[p]
[eval exp="f.En_Wiseman=1 , f.En_Wiseman_time=3"]
[else]
#侍
ぐおおおおおおおおおっ！！！！[p]
#
絶叫とともに酔漢は鈴猫を突き飛ばすようにして無理やり肉棒を引き抜いた[p]
#鈴猫
あら、残念[p]
#
秘裂からどろりと精液を零しながら鈴猫は悪戯っぽく笑った[p]
[eval exp="f.En_Raptured += 1"]
[endif]
[jump target="*finish"]
[s]

;-----------------------------------------
*fase4気絶
[chara_mod name="suzune" face="レイプ目"]
[eval exp="f.bind = 0"]
#
鈴猫は気絶した！[p]
#侍
へへへ、なかなか良かったぜ[p]
#
侍は白目を剥いて痙攣する鈴猫からマラを引き抜いた[p]
#鈴猫
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴猫はその場に崩折れる[r]
どろりと鈴猫の秘裂から精液がこぼれた[p]
#侍
このままヤリ捨てるのは勿体ねえ上玉だな[r]
ねぐらまでお持ち帰りさせてもらおうか！！[p]
#
侍はニヤリとほくそ笑むと鈴猫を担ぎ上げて意気揚々と闇の中へ消えていった[p]
ゲームオーバー（実際には侍の住処へ続きます）
[s]

;フィニッシュ-----------------------------------------------------------------------
*finish
#
[eval exp="f.bind = 0"]
;男の精を受けて鈴猫の気力が増加した[p]
;[eval exp="f.MP += 30 "]
[eval exp="f.MP = 100" cond="f.MP > 100"][WSs]
射精した敵は虚精状態になった（３ラウンド組付封印）[p]
[eval exp="f.En_Wiseman = 1 , f.En_Wiseman_time = 4 "]
[jump target="*Round_end"]
