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
落ち武者を撃退した[p]
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
落ち武者の攻撃[r]
「直突き」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 40"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[else]
[eval exp="tf.argment = f.EN_STR * 10 * f.GRD"]
[eval exp="tf.argment = tf.argment * (10 - f.En_Raptured ) / 10"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][DAMED][WSs]
[endif]
[jump target="*Round_end"][s]

*enemy_attack2
#
落ち武者の攻撃[r]
「袈裟斬り」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 0"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
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
落ち武者の組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 30"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の組付きを回避した[p][AVOID][WSs]
[jump target="*Round_end"][s]
[endif]
鈴耶は落ち武者に組み付かれた[p]
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
;抵抗１
[call storage="PL_bind.ks"]
;抵抗成功
[jump target="*Round_end" cond="f.bind <= 0"]
;段階１
#
落ち武者は鈴耶の胸を揉みしだいた[p]
;快感ダメージ
[eval exp="tf.fack = f.SEX "]
[call storage="routin/Rt_kaikan.ks" target="*BOOB"]
[call storage="asset_extra_reaction.ks" target="*orgasm"]
[call storage="asset_extra_reaction.ks" target="*milk" cond="f.Milk > 0"]
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
#落ち武者
へへっ、なんだぁ？もうイったのかよ？[r]
デカイだけなじゃなく、感度も抜群たぁ[r]
こいつはとんでもない淫乱だぜ！！[p]
#
落ち武者は鈴耶の痴態に相好を崩した[p]
房中術の効果で落ち武者のステータスが低下した[p]
[eval exp="f.En_Raptured = 0.5 "]

[jump target="*fase2"]
[s]
;-----------------------------------------
*fase1我慢絶頂
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸から押し寄せる快感の波に鈴耶は必死に耐えた[r]
鈴耶は絶頂を堪えた！[p]
#落ち武者
へへっ、デカイだけなじゃなく、感度も良いみたいだなぁ[r]
何食えばこんなにデカくなるんだ？[p]
#鈴耶
んっ！！き、汚い手で触んじゃないわよ！！[p]
#
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1通常絶頂
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸からの快感に鈴耶は体を震わせた[r]
;鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase1気絶"][endif]
#落ち武者
なんだぁ？この程度でイったのか？[r]
だらしねぇなぁ[p]
#鈴耶
！そ、そんなわけ無いでしょ！！[p]
#落ち武者
デカイだけなじゃなく、感度も抜群たぁ[r]
こいつはとんでもない淫乱だぜ！！[p]
#鈴耶
くっ・・・！[p]
#
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1房中術
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声で落ち武者にしなだれかかった[p]
落ち武者は鈴耶の反応に相好を崩した[p]
房中術の効果で落ち武者のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
#落ち武者
おっとぉ？デカイだけなじゃなく、感度も抜群たぁ[r]
こいつはとんでもない淫乱だぜ！！[p]
#
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1通常
#落ち武者
おおう！何食えばこんなにデカくなるんだ？[r]
手に収まんないぜ？[p]
#鈴耶
くっ！！汚い手で触んじゃないわよ！！[p]
#
胸を這い回る男の手の不快感に鈴耶は顔をしかめた[p]
[jump target="*fase2"]
[s]

;-----------------------------------------
*fase1気絶
鈴耶は気絶した！[p]
#落ち武者
おうおう！いいイキっぷりじゃねえか！！[p]
#鈴耶
・・・・・・・・・[p]
#落ち武者
？[p]
・・・・・・・このアマ！！ノビてやがる！！[r]
オラァ！！起きろ！！[p]
#鈴耶
かはっ！！[p]
#
落ち武者は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase2
;抵抗２
[call storage="PL_bind.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階２
#
落ち武者は魔羅を鈴耶の尻に擦りつけてきた[p]
;快感ダメージ
[eval exp="tf.fack = f.SEX "]
[call storage="routin/Rt_kaikan.ks" target="*ANAL"]
[call storage="asset_extra_reaction.ks" target="*orgasm"]
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
#落ち武者
おいおい、まだ前戯だってのにどんだけ欲求不満なんだよ！！[p]
#鈴耶
あぁ！焦らさないでぇ…[p]
#
鈴耶は自ら腰を魔羅に押し付けくねらせる[p]
#落ち武者
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
#
落ち武者は鈴耶の痴態に相好を崩した[p]
房中術の効果で落ち武者のステータスが低下した[p]
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
#落ち武者
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#落ち武者
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
#
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2通常絶頂
#鈴耶
(ダメッ！！イクぅーーーーーッ！！)[p]
#
びくびくと鈴耶の体が痙攣する[p]
;鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase2気絶"][endif]
#落ち武者
おいおい、まだ前戯だってのにどんだけ欲求不満なんだ？[p]
#鈴耶
う、うるひゃいい！！[p]
#落ち武者
へへっ！！じゃあ本番といくか！！[p]
#
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2房中術
#落ち武者
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
んっ！焦らさないで…[p]
#
鈴耶は自ら腰を魔羅に押し付けくねらせた[p]
#落ち武者
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
#
[eval exp="f.En_Raptured += 1"]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2通常
#落ち武者
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#落ち武者
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
#
[jump target="*fase3"]
[s]

;-----------------------------------------

*fase2気絶
#
鈴耶は気絶した！[p]
#落ち武者
はっはぁ！！ケツ穴ほじられて白目剥くとはなぁ！！[p]
#鈴耶
・・・・・・・・・[p]
#落ち武者
オラァ！！起きろ！！[p]
#鈴耶
くふっ！！[p]
#
落ち武者は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]
;------------------------------------------------------------------------------

*fase3
;抵抗3
[call storage="PL_bind.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階３
#
落ち武者は魔羅を鈴耶の秘裂に挿入した[p]
;快感ダメージ
[eval exp="tf.fack = f.SEX "]
[call storage="routin/Rt_kaikan.ks" target="*VGNA"]
[call storage="asset_extra_reaction.ks" target="*orgasm"]
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
ああん！！これぇ！これが欲しかったのぉ！！[r]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴耶は挿入と同時に大きな嬌声を上げながら絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#落ち武者
へっ！まだ入れただけだぜ！！こっからが本番だ！！[p]
#鈴耶
あんっ！！もっとぉ！！めちゃくちゃにしてぇ！！[p]
#
落ち武者は鈴耶の痴態に鼻息を荒くした[p]
房中術の効果で落ち武者のステータスが低下した[p]
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
#落ち武者
へっ！イクのをこらえやがったな？だが本番はここからだぜ！！[p]
#鈴耶
ふんっ！調子にのんじゃないわよ！！この下手くそ！！[p]
#
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
;鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase3気絶"][endif]
#落ち武者
へっ！まだ入れただけだぜ？こっからが本番だ！！[p]
#鈴耶
ううっ！この調子にのんじゃないわよ！！[p]
#
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3房中術
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[r]
#
鈴耶は自ら腰を振り、膣で魔羅を締め付けた[p]
#落ち武者
おおう！！こいつはすげぇ名器だ！！[p]
#
落ち武者は快感に鼻息を荒くした[p]
房中術の効果で落ち武者のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3通常
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に歯を食いしばった[p]
#落ち武者
どうだ！俺の魔羅の感触は！！[p]
#鈴耶
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#落ち武者
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
#
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3気絶
#
鈴耶は気絶した！[p]
#落ち武者
おいおい！まだ先っちょを挿れただけぜ！！[p]
#鈴耶
・・・・・・・・・[p]
#落ち武者
オラァ！！起きろ！！[p]
#鈴耶
かはっ！！[p]
#
落ち武者は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase4
;抵抗4
[call storage="PL_bind.ks"]
[jump target="*Round_end" cond="f.bind <= 0"]
;段階４
#
落ち武者はしっかりと鈴耶の腰を抱え込むと激しく腰を打ち付けた[p]
[eval exp="tf.fack = f.SEX "]
[call storage="routin/Rt_kaikan.ks" target="*ANAL"]
[call storage="asset_extra_reaction.ks" target="*orgasm"]
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
#落ち武者
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
落ち武者の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#落ち武者
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに落ち武者の魔羅が爆発した[p]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#落ち武者
へ、へへ、腰が抜けちまいそうだぜ[p]
#
落ち武者は鈴耶から魔羅を引き抜くとヨタヨタと後退りした。
房中術の効果で落ち武者のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
#鈴耶
ふう、なかなか良かったわね。でも楽しんだ分は返してもらうわよ！！！[p]
#
鈴耶は立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase4我慢絶頂
#落ち武者
イけぇ！！イっちまええええ！！[p]
#鈴耶
(イっちゃ駄目！イっちゃ駄目！)[p]
#落ち武者
うおおお！出すぞ！！[p]
#鈴耶
くううううううっ！！[p]
#
落ち武者は鈴耶の中で射精した[p]
#鈴耶
（ーーーーーー！！）[p]
#
魔羅が膣内で爆ぜるのを感じながら鈴耶は快感を押し殺した[r]
鈴耶は絶頂を堪えた！[p]
#落ち武者
ちっ、イクの我慢しやがったな…[p]
#
落ち武者は魔羅を引き抜くとつまらなそうに鈴耶の尻を叩いた[p]
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
#落ち武者
イけぇ！！イっちまええええ！！[p]
#鈴耶
いやぁっ！！こんな雑魚なんかにイかされたくないいい！！！[p]
#落ち武者
うおおお！出すぞ！！[p]
#
落ち武者は鈴耶の中で射精した[p]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
;鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#落ち武者
へへへ、なかなか良かったぜ[p]
#
落ち武者は嫌らしく笑いながら魔羅を引き抜くと鈴耶の尻を叩いた[p]
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
#落ち武者
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
落ち武者の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#落ち武者
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに落ち武者の魔羅が爆発した[p]
#鈴耶
あああああっ！！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
その間も鈴耶の膣はうねり男の魔羅から根こそぎ精を搾り取った[p]
#落ち武者
へ、へへ、腰が抜けちまいそうだぜ[p]
#
落ち武者は鈴耶から魔羅を引き抜くとヨタヨタと後退りした。
房中術の効果で落ち武者のステータスが低下した[p]
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
#落ち武者
うおおお！出すぞ！！ぶちまけてやる！！[p]
#鈴耶
いやあああああっ！！[p]
#落ち武者
うおおおおおおっ！！[p]
#
落ち武者は鈴耶の中で射精した[p]
#鈴耶
あああああっ・・・[p]
#落ち武者
へへへ、なかなか良かったぜ[p]
#
落ち武者は嫌らしく笑いながら鈴耶から魔羅を引き抜いた[p]
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
[eval exp="f.bind = 0"]
#
鈴耶は気絶した！[p]
#落ち武者
へへへ、なかなか良かったぜ[p]
#
落ち武者は白目を剥いて痙攣する鈴耶から魔羅を引き抜いた[p]
#鈴耶
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴耶はその場に崩折れる[r]
どろりと鈴耶の秘裂から精液がこぼれた[p]
#落ち武者
このままヤリ捨てるのは勿体ねえ上玉だな[r]
ねぐらまでお持ち帰りさせてもらおうか！！[p]
#
落ち武者はニヤリとほくそ笑むと鈴耶を担ぎ上げて意気揚々と闇の中へ消えていった[p]
ゲームオーバー（実際には落ち武者の住処へ続きます）
[s]

;フィニッシュ-----------------------------------------------------------------------
*finish
[eval exp="f.bind = 0"]
#
男の精を受けて鈴耶の気力が増加した[p]
[eval exp="f.MP += 30 "]
[eval exp="f.MP = 100" cond="f.MP > 100"][WSs]
射精した敵は虚精状態になった（３ラウンド組付封印）[p]
[eval exp="f.En_Wiseman = 1 , f.En_Wiseman_time = 4 "]
[jump target="*Round_end"]
