*start
;ラウンド開始時処理--------------------------------------------------------------
[call storage="asset_battle.ks" target="*battle_round_start"]

[if exp="f.ambush > 0"]
#
鈴耶の不意打ち[r]
鈴耶の集中力が上昇[p]
[eval exp="f.MND += 1 , f.ambush = 0"][WSs]
[endif]

[if exp="f.unescape == 1"]
#
逃走封印状態が解消した[p]
[endif]
[eval exp="f.unescape -= 1 " cond="f.unescape > 0"]

[if exp="f.En_Raptured_time == 1"]
#
敵は房中術の影響から脱した[p]
[endif]
[eval exp="f.En_Raptured_time -= 1 " cond="f.En_Raptured > 0"]

[if exp="f.En_Wiseman_time == 1"]
#
敵は虚脱状態から回復した[p]
[endif]
[eval exp="f.En_Wiseman_time -= 1 " cond="f.En_Wiseman > 0"]

;敵のスキル------------------------------------------------------------------------

[if exp=" 2 == f.Round "]
中忍の「獣化の術」[p]
「ぶもおおおおおおおおお！！！」[p]
このターンの格闘攻撃力が上昇[p]
[eval exp="f.EN_STR_BUFF = 4"]
[endif]

[if exp=" 0 == f.Round % 5"]
中忍の「獣化の術」[p]
「ぶもおおおおおおおおお！！！」[p]
このターンの格闘攻撃力が上昇[p]
[eval exp="f.EN_STR_BUFF = 4"]
[endif]

[if exp=" 0 == f.Round % 4"]
中忍は印を結んだ[p]
[endif]

;PLの行動------------------------------------------------------------------------
#
鈴耶の攻撃[r]
[call storage="PL_battle.ks" target="*start"]
[if exp="f.escape > 0"][return][endif]

[if exp="f.en_HP < 1"]
#
中忍を撃退した[p]
[eval exp="f.en_Name = ''"][WriteEnemy]
[return][s]
[endif]

;敵の行動------------------------------------------------------------------------
[jump target="*enemy_sexhara" cond="f.charm > 0"]
[getrand min="1" max="100" var="f.rand"]
[if exp=" 0 == f.Round % 3"]
[jump target="*enemy_magic"]
[elsif exp="f.rand <= 30"]
[jump target="*enemy_attack1"]
[elsif exp="f.rand <= 60"]
[jump target="*enemy_attack2"]
[else]
[jump target="*enemy_sexhara"]
[endif]

*enemy_attack1
#
中忍の攻撃「撒き菱」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 40"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[else]
[eval exp="tf.arg = f.EN_STR * 5 * f.GRD"]
[eval exp="tf.arg = tf.arg * (10 - f.En_Raptured ) / 10"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][DAMED][WSs]
[endif]
逃走封印状態（次ラウンド中）が発生[p]
[eval exp="f.unescape = 2"][WSs]
[if exp="f.HP < 1"][return][endif]
[jump target="*start"][s]

*enemy_attack2
#
中忍の攻撃[r]
「中忍刀」[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 0"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の攻撃を回避した[p][AVOID][WSs]
[else]
[eval exp="tf.arg = (f.EN_STR + f.EN_STR_BUFF) * 15 * f.GRD"]
[eval exp="tf.arg = tf.arg * (10 - f.En_Raptured ) / 10"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][DAMED][WSs]
[endif]
[if exp="f.HP < 1"][return][endif]
[jump target="*start"][s]

*enemy_magic
#
中忍の攻撃[r]
火遁の術[p]
[eval exp="tf.arg = f.EN_POW * 15 * f.GRD"][getMathRound var="tf.ATP"]
[emb exp="tf.ATP"]のダメージ[p]
[eval exp="f.HP = f.HP - tf.ATP"][DAMED][WSs]
[if exp="f.HP < 1"][return][endif]
[jump target="*start"][s]
;------------------------------------------------------------------------------
*enemy_sexhara
#
[eval exp="f.charm = 0"]
中忍の組付き[p]
[getrand min="1" max="100" var="f.rand"]
[eval exp="f.Hitrate = 30"]
[AVOIDANCE]
[TESTER]
[if exp="f.target > f.rand"]
鈴耶は敵の組付きを回避した[p][AVOID][WSs]
[jump target="*start"][s]
[endif]
鈴耶は中忍に組み付かれた[p]
[eval exp="f.bind = f.GRB"]

;------------------------------------------------------------------------------
*fase1
;抵抗１
[call storage="PL_bind.ks"]
;抵抗成功
[jump target="*start" cond="f.bind <= 0"]
;段階１
#
中忍は鈴耶の胸を揉みしだいた[p]
;快感ダメージ
[eval exp="tf.fack = f.SEX "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.BOOB / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"]
[eval exp="f.ERO = 999" cond="f.endure > 0"]
[SKEBE][WSs]

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
#中忍
なんと他愛ない！！[p]
これでくノ一を名乗るとは片腹痛いわ！[p]
#鈴耶
いやぁ、言わないでぇ・・・[p]
#中忍
はっ！随分とだらしのない乳だな！！[p]
よかろう！拙者がここで躾けてやろう！！[p]
#
中忍は鈴耶の痴態に相好を崩した[p]
房中術の効果で中忍のステータスが低下した[p]
[eval exp="f.En_Raptured += 1 "]

[jump target="*fase2"]
[s]
;-----------------------------------------
*fase1我慢絶頂
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸から押し寄せる快感の波に鈴耶は必死に耐えた[r]
鈴耶は絶頂を堪えた！[p]
#中忍
ほぉ堪えたか？[p]
だが、随分とだらしのない乳だな[p]
#鈴耶
うっ、うるさいっ！！離しなさいよっ！！[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1通常絶頂
#鈴耶
(駄目ぇ…感じちゃうーーーーーッ！！)[p]
#
胸からの快感に鈴耶は体を震わせた[r]
鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase1気絶"][endif]
#中忍
なんと他愛ない！！[p]
これでくノ一を名乗るとは片腹痛いわ！[p]
#鈴耶
くっ・・・言わせておけばぁ！！[p]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1房中術
#鈴耶
あんっ！！もっと、してぇ…[p]
#
鈴耶は甘い声で中忍にしなだれかかった[p]
#中忍
まったくだらしのない乳だな！！[p]
よかろう！拙者がここで躾けてやろう！！[p]
#
中忍は鈴耶の反応に相好を崩した[p]
房中術の効果で中忍のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase2"]
[s]
;-----------------------------------------

*fase1通常
#鈴耶
んうっ！揉むなぁ！！[p]
#中忍
はっ！さすがくノ一男好きのするだらしのない乳をしておる！！[p]
#鈴耶
だっ、だらしないて何よ！！[p]
#
[jump target="*fase2"]
[s]

;-----------------------------------------
*fase1気絶
鈴耶は気絶した！[p]
#中忍
まさか！？もう気をやるとは！！[p]
まだ何も聞いておらぬぞ！！[p]
目覚めよ！！ハァッ！！[p]
#鈴耶
かはっ！！[p]
#
中忍は気絶していた鈴耶に活を入れた[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase2
;抵抗２
[call storage="PL_bind.ks"]
[jump target="*start" cond="f.bind <= 0"]
;段階２
#
中忍はマラを鈴耶の尻に擦りつけてきた[p]
;快感ダメージ
[eval exp="tf.fack = f.SEX "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.ANAL / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"]
[eval exp="f.ERO = 999" cond="f.endure > 0"]
[SKEBE][WSs]

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
#中忍
何とどんだけ欲求不満なんだよ！！[p]
#鈴耶
あぁ！焦らさないでぇ…[p]
#
鈴耶は自ら腰をマラに押し付けくねらせる[p]
#中忍
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
#
中忍は鈴耶の痴態に相好を崩した[p]
房中術の効果で中忍のステータスが低下した[p]
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
#中忍
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#中忍
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
#中忍
おいおい、まだ前戯だってのにどんだけ欲求不満なんだ？[p]
#鈴耶
う、うるひゃいい！！[p]
#中忍
へへっ！！じゃあ本番といくか！！[p]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2房中術
#中忍
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
んっ！焦らさないで…[p]
#
鈴耶は自ら腰をマラに押し付けくねらせた[p]
#中忍
へへっ、がっつきやがって！ご期待通りねじ込んでやるぜ！！[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase3"]
[s]
;-----------------------------------------

*fase2通常
#中忍
ぷりっぷりっのいいケツしてやがるぜ！！[p]
#鈴耶
くっ！！汚いものをこすりつけるなぁっ！！[p]
#中忍
へへっ、こいつをねじ込まれても同じ口がきけるかな！！[p]
[jump target="*fase3"]
[s]

;-----------------------------------------

*fase2気絶
#
鈴耶は気絶した！[p]
#中忍
はっはぁ！！ケツ穴ほじられて白目剥くとはなぁ！！[p]
#鈴耶
・・・・・・・・・[p]
#中忍
オラァ！！起きろ！！[p]
#鈴耶
くふっ！！[p]
#
中忍は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]
;------------------------------------------------------------------------------

*fase3
;抵抗3
[call storage="PL_bind.ks"]
[jump target="*start" cond="f.bind <= 0"]
;段階３
#
中忍はマラを鈴耶の秘裂に挿入した[p]
;快感ダメージ
[eval exp="tf.fack = f.SEX "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.VGNA / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"]
[eval exp="f.ERO = 999" cond="f.endure > 0"]
[SKEBE][WSs]

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
#中忍
へっ！まだ入れただけだぜ！！こっからが本番だ！！[p]
#鈴耶
あんっ！！もっとぉ！！めちゃくちゃにしてぇ！！[p]
#
中忍は鈴耶の痴態に鼻息を荒くした[p]
房中術の効果で中忍のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3我慢絶頂
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に歯を食いしばった[r]
跳ね回りそうな体を押さえつけ、快感を拒絶する[p]
鈴耶は絶頂を堪えた！[p]
#中忍
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
#中忍
へっ！まだ入れただけだぜ？こっからが本番だ！！[p]
#鈴耶
ううっ！この調子にのんじゃないわよ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3房中術
#鈴耶
ああん！！これぇ！これが欲しかったのぉ！！[r]
#
鈴耶は自ら腰を振り、膣でマラを締め付けた[p]
#中忍
おおう！！こいつはすげぇ名器だ！！[p]
#
中忍は快感に鼻息を荒くした[p]
房中術の効果で中忍のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3通常
#鈴耶
（ーーーーーーーッ！！）[p]
#
鈴耶は挿入の衝撃に歯を食いしばった[r]
#中忍
どうだ！俺のマラの感触は！！[p]
#鈴耶
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#中忍
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
[jump target="*fase4"]
[s]
;-----------------------------------------

*fase3気絶
#
鈴耶は気絶した！[p]
#中忍
おいおい！まだ先っちょを挿れただけぜ！！[p]
#鈴耶
・・・・・・・・・[p]
#中忍
オラァ！！起きろ！！[p]
#鈴耶
かはっ！！[p]
#
中忍は気絶していた鈴耶を叩き起こした[p]
[eval exp="f.HP = 1"][WSs]
[return][s]

;------------------------------------------------------------------------------

*fase4
;抵抗4
[call storage="PL_bind.ks"]
[jump target="*start" cond="f.bind <= 0"]
;段階４
#
中忍はしっかりと鈴耶の腰を抱え込むと激しく腰を打ち付けた[p]
[eval exp="tf.fack = f.SEX "]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.VGNA / 100 "]
[getMathRound var="tf.fack"]
鈴耶は[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"]
[eval exp="f.ERO = 999" cond="f.endure > 0"]
[SKEBE][WSs]

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
#中忍
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
中忍の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#中忍
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに中忍のマラが爆発した[p]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#中忍
へ、へへ、腰が抜けちまいそうだぜ[p]
#
中忍は鈴耶からマラを引き抜くとヨタヨタと後退りした。
房中術の効果で中忍のステータスが低下した[p]
[eval exp="f.En_Raptured += 1"]
#鈴耶
ふう、なかなか良かったわね。でも楽しんだ分は返してもらうわよ！！！[p]
#
鈴耶は立ち上がると敵を睨みつけた[p]
[jump target="*finish"]
[s]
;----------------------------------------

*fase4我慢絶頂
#中忍
イけぇ！！イっちまええええ！！[p]
#鈴耶
(イっちゃ駄目！イっちゃ駄目！)[p]
#中忍
うおおお！出すぞ！！[p]
#鈴耶
くううううううっ！！[p]
#
中忍は鈴耶の中で射精した[p]
#鈴耶
（ーーーーーー！！）[p]
#
マラが膣内で爆ぜるのを感じながら鈴耶は快感を押し殺した[r]
鈴耶は絶頂を堪えた！[p]
#中忍
ちっ、イクの我慢しやがったな…[p]
#
中忍はマラを引き抜くとつまらなそうに鈴耶の尻を叩いた[p]
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
#中忍
イけぇ！！イっちまええええ！！[p]
#鈴耶
いやぁっ！！こんな雑魚なんかにイかされたくないいい！！！[p]
#中忍
うおおお！出すぞ！！[p]
#
中忍は鈴耶の中で射精した[p]
#鈴耶
あああああっ！！！イクイクイクーーーーーー！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
鈴耶は絶頂した[p]
[orgasm]
[if exp="f.HP <= 0"][call target="*fase4気絶"][endif]
#中忍
へへへ、なかなか良かったぜ[p]
#
中忍は嫌らしく笑いながらマラを引き抜くと鈴耶の尻を叩いた[p]
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
#中忍
ああっ！！出してやる！！ぶちまけてやる！！[p]
#
中忍の目は血走り、吐息は獣のようだ[p]
完全に目の前の雌を犯すことしか考えていない獣と化していた[p]
#中忍
うおおおおおお！！出すぞ出すぞ！！ぐおーーーーーーっ！！[p]
#
咆哮とともに中忍のマラが爆発した[p]
#鈴耶
あああああっ！！！[p]
#
鈴耶は精の迸りを子宮に感じながら嬌声を上げた[r]
その間も鈴耶の膣はうねり男のマラから根こそぎ精を搾り取った[p]
#中忍
へ、へへ、腰が抜けちまいそうだぜ[p]
#
中忍は鈴耶からマラを引き抜くとヨタヨタと後退りした。
房中術の効果で中忍のステータスが低下した[p]
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
#中忍
うおおお！出すぞ！！ぶちまけてやる！！[p]
#鈴耶
いやあああああっ！！[p]
#中忍
うおおおおおおっ！！[p]
#
中忍は鈴耶の中で射精した[p]
#鈴耶
あああああっ・・・[p]
#中忍
へへへ、なかなか良かったぜ[p]
#
中忍は嫌らしく笑いながら鈴耶からマラを引き抜いた[p]
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
#中忍
へへへ、なかなか良かったぜ[p]
#
中忍は白目を剥いて痙攣する鈴耶からマラを引き抜いた[p]
#鈴耶
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴耶はその場に崩折れる[r]
どろりと鈴耶の秘裂から精液がこぼれた[p]
#中忍
このままヤリ捨てるのは勿体ねえ上玉だな[r]
ねぐらまでお持ち帰りさせてもらおうか！！[p]
#
中忍はニヤリとほくそ笑むと鈴耶を担ぎ上げて意気揚々と闇の中へ消えていった[p]
ゲームオーバー（実際には中忍の住処へ続きます）
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
[jump target="*start"]
