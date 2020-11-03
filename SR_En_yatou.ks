*start
;ラウンド開始時処理--------------------------------------------------------------
[eval exp="f.Round += 1"]
[eval exp="f.GRD = 1 , f.AVD =  0" ]
[eval exp="f.ambush = 0" cond="f.Round >= 2"]
[eval exp="f.BUFF_ATP = 1 + f.ambush"]

[if exp="f.En_Raptured_time == 1"]
#
敵は房中術の影響から脱した
[endif]
[eval exp="f.En_Raptured_time -= 1 " cond="f.En_Raptured > 0"]

[if exp="f.En_Wiseman_time == 1"]
#
敵は虚脱状態から回復した
[endif]
[eval exp="f.En_Wiseman_time -= 1 " cond="f.En_Wiseman > 0"]

;PLの行動------------------------------------------------------------------------
#
鈴耶の攻撃[r]
[call storage="SR_PL_battle.ks" target="*start"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
#
野盗を撃退した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]

;敵の行動------------------------------------------------------------------------
[jump target="*enemy_sexhara" cond="f.charm > 0"]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand <= 30"]
[jump target="*enemy_attack1"]
[elsif exp="f.rand <= 60"]
[jump target="*enemy_attack2"]
[else]
[jump target="*enemy_sexhara"]
[endif]

*enemy_attack1
#
野盗の攻撃[r]
「いしつぶて」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 10 + f.AVD"]
[eval exp="f.hit = f.hit + (f.En_Raptured * 5)"]
[TESTER]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
[eval exp="tf.arg = 50 * f.GRD"]
[eval exp="tf.arg = tf.arg * (10 - f.En_Raptured ) / 10"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][MP5][WSs]
[endif]
[if exp="f.HP < 1"][return][endif]
[jump target="*start"][s]

*enemy_attack2
#
野盗の攻撃[r]
「棍棒」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50 + f.AVD"]
[eval exp="f.hit = f.hit + (f.En_Raptured * 5)"]
[TESTER]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
[eval exp="tf.arg = 100 * f.GRD"]
[eval exp="tf.arg = tf.arg * (10 - f.En_Raptured ) / 10"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][MP5][WSs]
[endif]
[if exp="f.HP < 1"][return][endif]
[jump target="*start"][s]

;------------------------------------------------------------------------------
*enemy_sexhara
#
[eval exp="f.charm = 0"]
野盗の組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 20 + f.AVD"]
[TESTER]
[if exp="f.hit > f.rand"]
鈴耶は敵の組付きを回避した[p][MND1][WSs]
[jump target="*start"][s]
[endif]
鈴耶は野盗に組み付かれた[p]
[eval exp="f.bind = f.GRB"]

;------------------------------------------------------------------------------
*fase1
;抵抗１
[call storage="SR_PL_bind.ks"]
;抵抗成功
[jump target="*start" cond="f.bind <= 0"]
;段階１
#
野盗は鈴耶の胸を揉みしだいた[p]
;快感ダメージ
[eval exp="tf.fack = f.SEX "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.BOOB / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"][MND0][WSs]

;リアクション
[if exp="f.ERO >= 1000 && f.rapture > 0"][jump target="*fase1房中術絶頂"]
[elsif exp="f.ERO >= 1000 && f.endure > 0"][jump target="*fase1我慢絶頂"]
[elsif exp="f.ERO >= 1000"][jump target="*fase1通常絶頂"]
[elsif exp="f.rapture > 0"][jump target="*fase1房中術"]
[else][jump target="*fase1通常"]
[endif]
;-----------------------------------------
*fase1房中術絶頂
#鈴耶
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
胸を弄ばれ鈴耶は大きな嬌声を上げながら絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase1気絶"][endif]
#野盗
へへっ、なんだぁ？もうイったのかよ？[p]
デカイだけなじゃなく、感度も抜群たぁ[p]
こいつはとんでもない淫乱だぜ！！[p]
#
野盗は鈴耶の痴態に相好を崩した[p]
房中術の効果で野盗のステータスが低下した[p]
[eval exp="f.En_Raptured = 0.5 "]

[jump target="*fase2"]
[s]
;-----------------------------------------
*fase1我慢絶頂
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸から押し寄せる快感の波に鈴耶は必死に耐えた[p]
鈴耶は絶頂を堪えた！[p]
#野盗
へへっ、デカイだけなじゃなく、感度も良いみたいだなぁ[p]
何食えばこんなにデカくなるんだ？[p]
#鈴耶
んっ！！き、汚い手で触んじゃないわよ！！[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1通常絶頂
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸からの快感に鈴耶は体を震わせた[p]
鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase1気絶"][endif]
#野盗
なんだぁ？この程度でイったのか？[p]
だらしねぇなぁ[p]
#鈴耶
！そ、そんなわけ無いでしょ！！[p]
#野盗
デカイだけなじゃなく、感度も抜群たぁ[p]
こいつはとんでもない淫乱だぜ！！[p]
#鈴耶
くっ・・・！[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1房中術
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声で野盗にしなだれかかった[p]
野盗は鈴耶の反応に相好を崩した[p]
房中術の効果で野盗のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
#野盗
おっとぉ？デカイだけなじゃなく、感度も抜群たぁ[p]
こいつはとんでもない淫乱だぜ！！[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1通常
#野盗
おおう！何食えばこんなにデカくなるんだ？[p]
手に収まんないぜ？[p]
#鈴耶
ちっ！！汚い手で触んじゃないわよ！！[p]
#
胸を這い回る男の手の不快感に鈴耶は顔をしかめた[p]
[jump target="*fase2"]
[s]

;-----------------------------------------
*fase1気絶
鈴耶は気絶した！[p]
#野盗
おうおう！いいイキっぷりじゃねえか！！[p]
#鈴耶
・・・・・・・・・[p]
#野盗
？[p]
・・・・・・・このアマ！！ノビてやがる！！[p]
オラァ！！起きろ！！[p]
#鈴耶
かはっ！！[p]
#
野盗は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase2
;抵抗２
[call storage="SR_PL_bind.ks"]
[jump target="*start" cond="f.bind <= 0"]
;段階２
#
野盗はマラを鈴耶の尻に擦りつけてきた[p]
;快感ダメージ
[eval exp="tf.fack = f.SEX "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.ANAL / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"][MND0][WSs]

;リアクション
[if exp="f.ERO >= 1000 && f.rapture > 0"][jump target="*fase2房中術絶頂"]
[elsif exp="f.ERO >= 1000 && f.endure > 0"][jump target="*fase2我慢絶頂"]
[elsif exp="f.ERO >= 1000"][jump target="*fase2通常絶頂"]
[elsif exp="f.rapture > 0"][jump target="*fase2房中術"]
[else][jump target="*fase2通常"]
[endif]
;-----------------------------------------

*fase2房中術絶頂
#鈴耶
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
#
鈴耶は大きな嬌声を上げながら絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase2気絶"][endif]
#野盗
おいおい、まだ前戯だってのにどんだけ欲求不満なんだよ！！[p]
#鈴耶
あぁ！焦らさないでぇ…[p]
#
鈴耶は自ら腰をマラに押し付けくねらせる[p]
#野盗
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
#
野盗は鈴耶の痴態に相好を崩した[p]
房中術の効果で野盗のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2我慢絶頂
#
快感でびくびくと鈴耶の体が痙攣する[p]
#鈴耶
(ダメッ！！こんな程度で絶対イかされたりしない！！)[p]
#
鈴耶は眉根を寄せて気色悪い感触に耐えた[p]
鈴耶は絶頂を堪えた！[p]
#野盗
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#野盗
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2通常絶頂
#鈴耶
(ダメッ！！イクぅーーーーーッ！！)[p]
#
びくびくと鈴耶の体が痙攣する[p]
鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase2気絶"][endif]
#野盗
おいおい、まだ前戯だってのにどんだけ欲求不満なんだ？[p]
#鈴耶
う、うるひゃいい！！[p]
#野盗
へへっ！！じゃあ本番といくか！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2房中術
#野盗
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
んっ！焦らさないで…[p]
#
鈴耶は自ら腰をマラに押し付けくねらせた[p]
#野盗
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2通常
#野盗
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#野盗
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
[jump target="*fase3"]
[s]

;-----------------------------------------

*fase2気絶
#
鈴耶は気絶した！[p]
#野盗
はっはぁ！！ケツ穴ほじられて白目剥くとはなぁ！！[p]
#鈴耶
・・・・・・・・・[p]
#野盗
オラァ！！起きろ！！[p]
#鈴耶
くふっ！！[p]
#
野盗は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]
;------------------------------------------------------------------------------

*fase3
;抵抗3
[call storage="SR_PL_bind.ks"]
[jump target="*start" cond="f.bind <= 0"]
;段階３
#
野盗はマラを鈴耶の秘裂に挿入した[p]
;快感ダメージ
[eval exp="tf.fack = f.SEX "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.VGNA / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"][MND0][WSs]

;リアクション
[if exp="f.ERO >= 1000 && f.rapture > 0"][jump target="*fase3房中術絶頂"]
[elsif exp="f.ERO >= 1000 && f.endure > 0"][jump target="*fase3我慢絶頂"]
[elsif exp="f.ERO >= 1000"][jump target="*fase3通常絶頂"]
[elsif exp="f.rapture > 0"][jump target="*fase3房中術"]
[else][jump target="*fase3通常"]
[endif]
;-----------------------------------------

*fase3房中術絶頂
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[p]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴耶は挿入と同時に大きな嬌声を上げながら絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#野盗
へっ！まだ入れただけだぜ！！こっからが本番だ！！[p]
#鈴耶
あんっ！！もっとぉ！！めちゃくちゃにしてぇ！！[p]
#
野盗は鈴耶の痴態に鼻息を荒くした[p]
房中術の効果で野盗のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3我慢絶頂
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に歯を食いしばった[p]
跳ね回りそうな体を押さえつけ、快感を拒絶する[p]
鈴耶は絶頂を堪えた！[p]
#野盗
へっ！イクのをこらえやがったな？だが本番はここからだぜ！！[p]
#鈴耶
ふんっ！調子にのんじゃないわよ！！この下手くそ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3通常絶頂
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に目を見開いた[p]
備えていたつもりだったが体は意思の手綱を離れ痙攣を始める[r]
そして[p]
#鈴耶
いやあああっ！！らめぇぇぇぇっ！！[p]
#
鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#野盗
へっ！まだ入れただけだぜ？こっからが本番だ！！[p]
#鈴耶
ううっ！この調子にのんじゃないわよ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3房中術
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[p]
#
鈴耶は自ら腰を振り、膣でマラを締め付けた[p]
#野盗
おおう！！こいつはすげぇ名器だ！！[p]
#
野盗は快感に鼻息を荒くした[p]
房中術の効果で野盗のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3通常
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に歯を食いしばった[p]
#野盗
どうだ！俺のマラの感触は！！[p]
#鈴耶
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#野盗
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3気絶
#
鈴耶は気絶した！[p]
#野盗
おいおい！まだ先っちょを挿れただけぜ！！[p]
#鈴耶
・・・・・・・・・[p]
#野盗
オラァ！！起きろ！！[p]
#鈴耶
かはっ！！[p]
#
野盗は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase4
;抵抗4
[call storage="SR_PL_bind.ks"]
[jump target="*start" cond="f.bind <= 0"]
;段階４
#
野盗はしっかりと鈴耶の腰を抱え込むと激しく腰を打ち付けた[p]
[eval exp="tf.fack = f.SEX "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.VGNA / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"][MND0][WSs]

;リアクション
[if exp="f.ERO >= 1000 && f.rapture > 0"][jump target="*fase4房中術絶頂"]
[elsif exp="f.ERO >= 1000 && f.endure > 0"][jump target="*fase4我慢絶頂"]
[elsif exp="f.ERO >= 1000"][jump target="*fase4通常絶頂"]
[elsif exp="f.rapture > 0"][jump target="*fase4房中術"]
[else][jump target="*fase4通常"]
[endif]
;----------------------------------------

*fase4房中術絶頂
#鈴耶
ああん！いいっ！！早く！早く頂戴！！[p]
#野盗
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
野盗の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#野盗
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに野盗のマラが爆発した[p]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[p]
鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#野盗
へ、へへ、腰が抜けちまいそうだぜ[p]
#
野盗は鈴耶からマラを引き抜くとヨタヨタと後退りした。
房中術の効果で野盗のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
#鈴耶
ふう、なかなか良かったわね。でも楽しんだ分は返してもらうわよ！！！[p]
#
鈴耶は立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase4我慢絶頂
#野盗
イけぇ！！イっちまええええ！！[p]
#鈴耶
(イっちゃ駄目！イっちゃ駄目！)[p]
#野盗
うおおお！出すぞ！！[p]
#鈴耶
くううううううっ！！[p]
#
野盗は鈴耶の中で射精した[p]
#鈴耶
（ーーーーーー！！）[p]
#
マラが膣内で爆ぜるのを感じながら鈴耶は快感を押し殺した[p]
鈴耶は絶頂を堪えた！[p]
#野盗
ちっ、イクの我慢しやがったな…[p]
#
野盗はマラを引き抜くとつまらなそうに鈴耶の尻を叩いた[p]
#鈴耶
んっ！！[p]
#
その場にくずおれた鈴耶の秘裂からごぽりと精液が溢れた[p]
#鈴耶
くっ！絶対許さないんだから！！[p]
#
鈴耶はよろよろと立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase4通常絶頂
#鈴耶
ああん！いやあっ！！イクぅ！！[p]
#野盗
イけぇ！！イっちまええええ！！[p]
#鈴耶
いやぁっ！！こんな雑魚なんかにイかされたくないいい！！！[p]
#野盗
うおおお！出すぞ！！[p]
#
野盗は鈴耶の中で射精した[p]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[p]
鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#野盗
へへへ、なかなか良かったぜ[p]
#
野盗は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
#鈴耶
ああんっ！！[p]
#
その場にくずおれた鈴耶の秘裂からごぽりと精液が溢れた[p]
#鈴耶
くっ！絶対許さないんだから！！[p]
#
鈴耶はよろよろと立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase4房中術
#鈴耶
ああん！いいっ！！早く！早く頂戴！！[p]
#野盗
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
野盗の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#野盗
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに野盗のマラが爆発した[p]
#鈴耶
あああああっ！！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[p]
その間も鈴耶の膣はうねり男のマラから根こそぎ精を搾り取った[p]
#野盗
へ、へへ、腰が抜けちまいそうだぜ[p]
#
野盗は鈴耶からマラを引き抜くとヨタヨタと後退りした。
房中術の効果で野盗のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
#鈴耶
さて、楽しんだ分は返してもらうわよ！！！[p]
#
鈴耶は立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase4通常
#鈴耶
あんっ！あんっ！ひぃん！！[p]
#野盗
うおおお！出すぞ！！ぶちまけてやる！！[p]
#鈴耶
いやあああああっ！！[p]
#野盗
うおおおおおおっ！！[p]
#
野盗は鈴耶の中で射精した[p]
#鈴耶
あああああっ・・・[p]
#野盗
へへへ、なかなか良かったぜ[p]
#
野盗は嫌らしく笑いながら鈴耶からマラを引き抜いた[p]
#鈴耶
あんっ！[p]
#
どろりと鈴耶の秘裂から精液がこぼれた[p]
#鈴耶
くっ！絶対許さないんだから！！[p]
#
鈴耶は何とか立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;-----------------------------------------

*fase4気絶
#
鈴耶は気絶した！[p]
#野盗
へへへ、なかなか良かったぜ[p]
#
野盗は白目を剥いて痙攣する鈴耶からマラを引き抜いた[p]
#鈴耶
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴耶はその場に崩折れる[p]
どろりと鈴耶の秘裂から精液がこぼれた[p]
#野盗
このままヤリ捨てるのは勿体ねえ上玉だな[p]
ねぐらまでお持ち帰りさせてもらおうか！！[p]
#
野盗はニヤリとほくそ笑むと鈴耶を担ぎ上げて意気揚々と闇の中へ消えていった[p]
ゲームオーバー（実際には野盗の住処へ続きます）
[s]

;フィニッシュ-----------------------------------------------------------------------
*finish
#
男の精を受けて鈴耶の気力が増加した[p]
[eval exp="f.MP += 30 "]
[eval exp="f.MP = 100" cond="f.MP > 100"][WSs]
射精した敵は虚精状態になった（３ラウンド組付封印）[p]
[eval exp="f.En_Wiseman = 1 , f.En_Wiseman_time = 4 "]
[jump target="*start"]
