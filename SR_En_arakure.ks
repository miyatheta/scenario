*start
;ラウンド開始時処理--------------------------------------------------------------
[eval exp="f.Round += 1"]
[eval exp="f.GRD = 1 , f.AVD =  0" ]
[eval exp="f.ambush = 0" cond="f.Round >= 2"]
[eval exp="f.BUFF_ATP = 1 + f.ambush"]

[if exp="f.En_Raptured_time == 1"]
敵は房中術の影響から脱した
[endif]
[eval exp="f.En_Raptured_time -= 1 " cond="f.En_Raptured > 0"]

[if exp="f.En_Wiseman_time == 1"]
敵は虚脱状態から回復した
[endif]
[eval exp="f.En_Wiseman_time -= 1 " cond="f.En_Wiseman > 0"]

;PLの行動------------------------------------------------------------------------
鈴耶の攻撃[r]
[call storage="SR_PL_battle.ks" target="*start"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
荒くれ者を撃退した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]

;敵の行動------------------------------------------------------------------------
[jump target="*enemy_sexhara" cond="f.charm > 0 "]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 80"]
[jump target="*enemy_attack"]
[else]
[jump target="*enemy_sexhara"]
[endif]

*enemy_attack
荒くれ者の攻撃[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 50 + f.AVD"]
[eval exp="f.hit = f.hit + (f.En_Raptured * 5)"]
[if exp="f.hit > f.rand"]
鈴耶は敵の攻撃を回避した[p][MND1][WSs]
[else]
[eval exp="tf.arg = 100 * f.GRD"]
[eval exp="tf.arg = tf.arg * (10 - f.En_Raptured ) / 10"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][MP1][WSs]
[endif]
[if exp="f.HP < 1"][return][endif]
[jump target="*start"][s]

;------------------------------------------------------------------------------
*enemy_sexhara
[eval exp="f.charm = 0"]
荒くれ者の組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.hit = (f.SPD - f.en_DEX) * 5 + 10 + f.AVD"]
[if exp="f.hit > f.rand"]
鈴耶は敵の組付きを回避した[p][MND1][WSs]
[jump target="*start"][s]
[endif]
鈴耶は荒くれ者に組み付かれた[p]
[eval exp="f.bind = f.GRB"]
;------------------------------------------------------------------------------
;抵抗１
[call storage="SR_PL_bind.ks"]
;抵抗成功
[jump target="*start" cond="f.bind <= 0"]
;段階１
荒くれ者は鈴耶の胸を揉みしだいた[p]
#鈴耶
;快感ダメージ
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.BUST / 100 "]
[getMathRound var="tf.tmp"]
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0][WSs]

;リアクション
[if exp="f.ERO >= 1000 && f.rapture > 0"]
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
胸を弄ばれ鈴耶は大きな嬌声を上げながら絶頂した[p]
鈴耶の理性が１減少した[p]
鈴耶の腕力が一時的に低下[p]
[orgasm]
へへっ、なんだぁ？もうイったのかよ？[p]
デカイだけなじゃなく、感度も抜群たぁ[p]
こいつはとんでもない淫乱だぜ！！[p]
荒くれ者は鈴耶の痴態に相好を崩した[p]
房中術の効果で荒くれ者のステータスが低下した[p]
[eval exp="f.En_Raptured = 0.5 "]

[elsif exp="f.ERO >= 1000 && f.endure > 0"]
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
胸からの快感に鈴耶は体を震わせた[p]

[elsif exp="f.ERO >= 1000"]
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
胸からの快感に鈴耶は体を震わせた[p]
鈴耶は絶頂した[p]
鈴耶の理性が１減少した[p]
鈴耶の腕力が一時的に低下[p]
[orgasm]
おっ！？なんだぁ？もしかして今イったのか？[p]
！そ、そんなわけ無いでしょ！！[p]
デカイだけなじゃなく、感度も抜群たぁ[p]
こいつはとんでもない淫乱だぜ！！[p]

[elsif exp="f.rapture > 0"]
あんっ！！もっと、してぇ…[p]
鈴耶は甘い声で荒くれ者にしなだれかかった[p]
荒くれ者は鈴耶の反応に相好を崩した[p]
房中術の効果で荒くれ者のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
おっとぉ？デカイだけなじゃなく、感度も抜群たぁ[p]
こいつはとんでもない淫乱だぜ！！[p]
[else]

おおう！何食えばこんなにデカくなるんだ？[p]
手に収まんないぜ？[p]
ちっ！！汚い手で触んじゃないわよ！！[p]
胸を這い回る男の手の不快感に鈴耶は顔をしかめた[p]
[endif]
;------------------------------------------------------------------------------
;抵抗２
[call storage="SR_PL_bind.ks"]
[jump target="*start" cond="f.bind <= 0"]
;段階２
荒くれ者はマラを鈴耶の尻に擦りつけてきた[p]
;快感ダメージ
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.ANAL / 100 "]
[getMathRound var="tf.tmp"]
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0][WSs]

;リアクション
[if exp="f.ERO >= 1000 && f.rapture > 0"]
ああんっ！！イクっ！！イクイクイクーーーーッ！！[p]
鈴耶は大きな嬌声を上げながら絶頂した[p]
鈴耶の理性が１減少した[p]
鈴耶の腕力が一時的に低下[p]
[orgasm]
おいおい、まだ前戯だってのにどんだけ欲求不満なんだよ！！[p]
あぁ！焦らさないでぇ…[p]
鈴耶は自ら腰をマラに押し付けくねらせる[p]
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
荒くれ者は鈴耶の痴態に相好を崩した[p]
房中術の効果で荒くれ者のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]

[elsif exp="f.ERO >= 1000 && f.endure > 0"]
快感でびくびくと鈴耶の体が痙攣する[p]
(ダメッ！！こんな程度で絶対イかされたりしない！！)[p]
鈴耶は眉根を寄せて気色悪い感触に耐えた[p]
鈴耶は絶頂を堪えた！[p]
ぷりっぷりっのいいケツしてやがるぜ！！[p]
くっ！！汚いものをこすりつけるなぁっ！！[p]
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]

[elsif exp="f.ERO >= 1000"]
(ダメッ！！イクぅーーーーーッ！！)[p]
びくびくと鈴耶の体が痙攣する[p]
鈴耶は絶頂した[p]
鈴耶の理性が１減少した[p]
鈴耶の腕力が一時的に低下[p]
[orgasm]
おいおい、まだ前戯だってのにどんだけ欲求不満なんだ？[p]
う、うるひゃいい！！[p]
へへっ！！じゃあ本番といくか！！[p]

[elsif exp="f.rapture > 0"]
ぷりっぷりっのいいケツしてやがるぜ！！[p]
んっ！焦らさないで…[p]
鈴耶は自ら腰をマラに押し付けくねらせた[p]
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
[eval exp="f.En_Raptured += 1"]
[else]

ぷりっぷりっのいいケツしてやがるぜ！！[p]
くっ！！汚いものをこすりつけるなぁっ！！[p]
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
[endif]
;------------------------------------------------------------------------------
;抵抗3
[call storage="SR_PL_bind.ks"]
[jump target="*start" cond="f.bind <= 0"]
;段階３
荒くれ者はマラを鈴耶の秘裂に挿入した[p]
#鈴耶
;快感ダメージ
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.VGNA / 100 "]
[getMathRound var="tf.tmp"]
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0][WSs]

;リアクション
[if exp="f.ERO >= 1000 && f.rapture > 0"]
ああん！！これぇ！これが欲しかったのぉ！！[p]
イクっ！！イクイクイクーーーーっ！！[p]
鈴耶は挿入と同時に大きな嬌声を上げながら絶頂した[p]
鈴耶の理性が１減少した[p]
鈴耶の腕力が一時的に低下[p]
[orgasm]
へっ！まだ入れただけだぜ！！こっからが本番だ！！[p]
あんっ！！もっとぉ！！めちゃくちゃにしてぇ！！[p]
荒くれ者は鈴耶の痴態に鼻息を荒くした[p]
房中術の効果で荒くれ者のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]

[elsif exp="f.ERO >= 1000 && f.endure > 0"]
（ーーーーーーーッ！！）[p]
鈴耶は挿入の衝撃に歯を食いしばった[p]
跳ね回りそうな体を押さえつけ、快感を拒絶する[p]
鈴耶は絶頂を堪えた！[p]
へっ！イクのをこらえやがったな？だが本番はここからだぜ！！[p]
ふんっ！調子にのんじゃないわよ！！この下手くそ！！[p]

[elsif exp="f.ERO >= 1000"]
（ーーーーーーーッ！！）[p]
鈴耶は挿入の衝撃に目を見開いた[p]
備えていたつもりだったが体は意思の手綱を離れ痙攣を始める[p]
いやあああっ！！らめぇぇぇぇっ！！[p]
鈴耶は絶頂した[p]
鈴耶の理性が１減少した[p]
鈴耶の腕力が一時的に低下[p]
[orgasm]
へっ！まだ入れただけだぜ？こっからが本番だ！！[p]
ううっ！この調子にのんじゃないわよ！！[p]

[elsif exp="f.rapture > 0"]
ああん！！これぇ！これが欲しかったのぉ！！[p]
鈴耶は自ら腰を振り、膣でマラを締め付けた[p]
おおう！！こいつはすげぇ名器だ！！[p]
荒くれ者は快感に鼻息を荒くした[p]
房中術の効果で荒くれ者のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[else]

（ーーーーーーーッ！！）[p]
鈴耶は挿入の衝撃に歯を食いしばった[p]
どうだ！俺のマラの感触は！！[p]
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
[endif]
;------------------------------------------------------------------------------
;抵抗4
[call storage="SR_PL_bind.ks"]
[jump target="*start" cond="f.bind <= 0"]
;段階４
荒くれ者はしっかりと鈴耶の腰を抱え込むと激しく腰を打ち付けた[p]
[eval exp="tf.tmp = 100 "]
[eval exp="tf.tmp = tf.tmp * f.CURSE / 100 + tf.tmp"]
[eval exp="tf.arg = tf.tmp * f.VGNA / 100 "]
[getMathRound var="tf.tmp"]
鈴耶は[emb exp="tf.tmp"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.tmp"][MND0][WSs]

;リアクション
[if exp="f.ERO >= 1000 && f.rapture > 0"]
ああん！いいっ！！早く！早く頂戴！！[p]
ああっ！！出してやる！！ぶちまけてやる！！[p]
荒くれ者の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
咆哮とともに荒くれ者のマラが爆発した[p]
あああああっ！！！イクイクイクーーーーーー！！[p]
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[p]
鈴耶は絶頂した[p]
鈴耶の理性が１減少した[p]
鈴耶の腕力が一時的に低下[p]
[orgasm]
へ、へへ、腰が抜けちまいそうだぜ[p]
荒くれ者は鈴耶からマラを引き抜くとヨタヨタと後退りした。
房中術の効果で荒くれ者のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
ふう、なかなか良かったわね。でも楽しんだ分は返してもらうわよ！！！[p]
鈴耶は立ち上がると敵を睨みつけた[p]

[elsif exp="f.ERO >= 1000 && f.endure > 0"]
イけぇ！！イっちまええええ！！[p]
(イっちゃ駄目！イっちゃ駄目！)[p]
うおおお！出すぞ！！[p]
くううううううっ！！[p]
荒くれ者は鈴耶の中で射精した[p]
（ーーーーーー！！）[p]
マラが膣内で爆ぜるのを感じながら鈴耶は快感を押し殺した[p]
鈴耶は絶頂を堪えた！[p]
ちっ、イクの我慢しやがったな…[p]
荒くれ者はマラを引き抜くとつまらなそうに鈴耶の尻を叩いた[p]
んっ！！[p]
その場にくずおれた鈴耶の秘裂からごぽりと精液が溢れた[p]
くっ！絶対許さないんだから！！[p]
鈴耶はよろよろと立ち上がると敵を睨みつけた[p]

[elsif exp="f.ERO >= 1000"]
ああん！いやあっ！！イクぅ！！[p]
イけぇ！！イっちまええええ！！[p]
いやぁっ！！こんな雑魚なんかにイかされたくないいい！！！[p]
うおおお！出すぞ！！[p]
荒くれ者は鈴耶の中で射精した[p]
あああああっ！！！イクイクイクーーーーーー！！[p]
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[p]
鈴耶は絶頂した[p]
鈴耶の理性が１減少した[p]
鈴耶の腕力が一時的に低下[p]
[orgasm]
へへへ、なかなか良かったぜ[p]
荒くれ者は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
ああんっ！！[p]
その場にくずおれた鈴耶の秘裂からごぽりと精液が溢れた[p]
くっ！絶対許さないんだから！！[p]
鈴耶はよろよろと立ち上がると敵を睨みつけた[p]

[elsif exp="f.rapture > 0"]
ああん！いいっ！！早く！早く頂戴！！[p]
ああっ！！出してやる！！ぶちまけてやる！！[p]
荒くれ者の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
咆哮とともに荒くれ者のマラが爆発した[p]
あああああっ！！！[p]
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[p]
その間も鈴耶の膣はうねり男のマラから根こそぎ精を搾り取った[p]
へ、へへ、腰が抜けちまいそうだぜ[p]
荒くれ者は鈴耶からマラを引き抜くとヨタヨタと後退りした。
房中術の効果で荒くれ者のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
さて、楽しんだ分は返してもらうわよ！！！[p]
鈴耶は立ち上がると敵を睨みつけた[p]

[else]
あんっ！あんっ！ひぃん！！[p]
うおおお！出すぞ！！ぶちまけてやる！！[p]
いやあああああっ！！[p]
うおおおおおおっ！！[p]
荒くれ者は鈴耶の中で射精した[p]
#鈴耶
あああああっ・・・[p]
へへへ、なかなか良かったぜ[p]
荒くれ者は嫌らしく笑いながら鈴耶からマラを引き抜いた[p]
あんっ！[p]
どろりと鈴耶の秘裂から精液がこぼれた[p]
くっ！絶対許さないんだから！！[p]
鈴耶は何とか立ち上がると敵を睨みつけた[p]
[endif]

;フィニッシュ
男の精を受けて鈴耶の気力が増加した[p]
[eval exp="f.MP += 30 "][WSs]
[eval exp="f.MP = 100" cond="f.MP > 100"]
射精した敵は虚精状態になった（３ラウンド組付封印）[p]
[eval exp="f.En_Wiseman = 1 , f.En_Wiseman_time = 4 "]
[jump target="*start"]
