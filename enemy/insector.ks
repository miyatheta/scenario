*エネミーデータ
[call storage="enemy/enemy_data.ks" target="*insector"]
[return]error101[s]

*ダメージ計算
[getrand min="1" max="&f.En_ATP" var="f.rand"]
[eval exp="tf.argment= (f.BASE * (f.En_ATP - f.Bonus_Orange*5 + f.DEF_down) * (1+f.En_ATP_Plus/100) ) / f.Guard + f.rand"]
[getMathRound var="f.damage"]
[eval exp="f.damage = 0" cond="f.damage < 0"]
[eval exp="f.HP -= f.damage"]
[emb exp="f.damage"]のダメージを受けた。[p]
[return][s]

;-------------------------------------------------------------------------------

*通常時ハンド抽選
;敵の行動パターン選定
;判定可能変数（残りHP）
[getrand min="1" max="100" var="f.rand"]

[if exp="f.En_MP >= 100"]
[eval exp="f.En_BURST = 1"]
[eval exp="f.En_Hand1 = 10 , f.En_Hand2 = 9"]
蟲忍が印を切った[p]

[elsif exp="f.rand<25"]
[eval exp="f.En_Hand1 = 10 , f.En_Hand2 = 10"]

[elsif exp="f.rand<50"]
[eval exp="f.En_Hand1 = 6 , f.En_Hand2 = 10"]

[elsif exp="f.rand<75"]
[eval exp="f.En_Hand1 = 10 , f.En_Hand2 = 5"]

[else]
[eval exp="f.En_Hand1 = 6 , f.En_Hand2 = 8"]

[endif]
[return][s]

*拘束時ハンド抽選
#
鈴猫は[emb exp="f.En_name"]に拘束されている[wt5]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.En_MP >= 100"]
[eval exp="f.En_Hand1 = 10 , f.En_Hand2 = 7"]
[else]
[eval exp="f.En_Hand1 = 10 , f.En_Hand2 = 7"]
[endif]
[return][s]

*レイプ時ハンド抽選
#
鈴猫は[emb exp="f.En_name"]に犯されている[wt5]
[call target="*レイプ導入"]
;導入の演出
[getrand min="1" max="100" var="f.rand"]
[if exp="f.En_MP >= 100"]
[eval exp="f.En_Hand1 = 10 , f.En_Hand2 = 10"]
[else]
[eval exp="f.En_Hand1 = 10 , f.En_Hand2 = 10"]
[endif]
[return][s]

;-------------------------------------------------------------------------------

*敵行動分岐
;ターゲットテキストの作成
;行動終了後は*敵行動X完了に戻る
[iscript]
f.returnTag = "*敵行動" + f.Down + "完了";
[endscript]
[if exp="f.Rape_mode > 0"]
[jump target="*レイプスキル"]
[elsif exp="f.Rt_Bind > 0"]
[jump target="*セクハラスキル"]
[else]
[jump target="*敵スキル使用"]
[endif]

;スキル使用----------------------------------------------------------------------------

*敵スキル使用
;[eval exp="f.Pary = 0"]
;攻撃パターンを決める変数
;①チャージ②行動パターン③残りHP④ドロー１の色＝f.Cards[f.Draw1]['color']
;⑤ドロー時の色の内訳[Calc_Card]とf.色でアクセス
;⑥ドロー時の色の合計値[Calc_Card]とf.色Valueでアクセス
;⑦ドロー時の罰札の内訳
;⑧何回目のドローか？
[Calc_Card]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand > 80"]
[jump target="*吸収"]
[elsif exp="f.rand > 60"]
[jump target="*消化液"]
[elsif exp="f.rand > 40"]
[jump target="*淫霧"]
[else]
;else後にはデフォルトの行動を書く
[jump target="*毒液"]
[endif]
;ここまで来ることはない
error-battle-970
[s]

*吸収
「吸収」[r]
[emb exp="f.En_name"]は鈴猫の気力を吸収した[wt5]
[eval exp="f.En_MP += 10"]
[eval exp="f.MP -= 10"][eval exp="f.MP = 0" cond="f.MP<0"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*消化液
「消化液」[r]
[if exp="f.dress < 2"]
鈴猫の装束がぼろぼろに崩れ落ちた[wt5]
[eval exp="f.dress = 2"]
[call storage="As_face.ks"]
[chara_mod name="suzune" face="厳しい" ]
[else]
鈴猫の防御力が低下した[wt5]
[eval exp="f.DEF_down = 1"]
[endif]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*淫霧
「淫霧」[r]
鈴猫の感度が上昇した[wt5]
[eval exp="f.ERO_down += 1"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*毒液
#
「毒液」[wt5]
鈴猫は毒状態になった[p]
[eval exp="f.Poizon = 5"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

;回避----------------------------------------------------------------------------

*敵回避
;敵回避判定[wt5]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand > 100 - (f.En_RES + f.RES_Plus - f.Bonus_Orange*10) "]
[eval exp="f.En_Pary = 1"]
#蟲忍
遅い！！[r]
#
[emb exp="f.En_name"]は鈴猫の攻撃を回避した[p]
[endif]
[return][s]]

;攻撃----------------------------------------------------------------------------

*敵攻撃
[if exp="f.En_BURST > 0"]
[jump target="*チャージ攻撃"]
[endif]
[emb exp="f.En_name"]の攻撃[wt5]
[eval exp="f.BASE = 2 , f.En_DEX = -5"]
;回避判定
[call storage="battle.ks" target="*回避"]
;回避成功の場合ジャンプ
[jump storage="battle.ks" target="*ラウンド終了" cond="f.Pary > 0"]
;無敵の場合ジャンプ
[jump storage="battle.ks" target="*空蝉発動" cond="f.invincible > 0"]
;失敗の場合ダメージ
;ダメージ演出
[damaged]
;生死の判定
[update_status][show_score]
[jump target="*敗北" cond="f.HP <= 0"]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*チャージ攻撃
[emb exp="f.En_name"]のチャージ攻撃[p]
「猛毒の吐息」[wt5]
[eval exp="f.BASE = 1 , f.En_DEX = 30 "]
;回避判定
[call storage="battle.ks" target="*回避"]
;回避成功の場合ジャンプ
[jump storage="battle.ks" target="*ラウンド終了" cond="f.Pary > 0"]
;無敵の場合ジャンプ
[jump storage="battle.ks" target="*空蝉発動" cond="f.invincible > 0"]
;失敗の場合ダメージ
;ダメージ演出
[damaged]
;特殊効果
鈴猫は猛毒状態になった[r]
感度が上昇した[r]
[eval exp="f.DPoizon = 5 "][eval exp="f.ERO_down += 1"]
;生死の判定
[update_status][show_score]
[jump target="*敗北" cond="f.HP <= 0"]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*敗北
鈴猫は敗北した[p]
[s]

;拘束----------------------------------------------------------------------------
*拘束開始
鈴猫は体勢を崩した！！[p]
[jump target="*インポ状態" cond="f.En_Impotenz > 0"]
[eval exp="f.BASE = 0, f.En_DEX = 70"]
「そこだ、捕らえよ」[wt5]
蟲忍の命令に従い[emb exp="f.En_name"]が鈴猫に絡みつく[p]
;回避判定
[call storage="battle.ks" target="*回避"]
;回避成功の場合ジャンプ
[jump storage="battle.ks" target="*ラウンド終了" cond="f.Pary > 0"]
;無敵の場合ジャンプ
[jump storage="battle.ks" target="*空蝉発動拘束時" cond="f.invincible > 0"]
;失敗の場合拘束
#鈴猫
この！離しなさいよ！！[p]
#
[eval exp="f.Bind = f.En_Bind , f.Rt_Bind = 1"]
;f.Bind=拘束力,f.Rt_Bind=拘束状態であることを示すフラグ
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*インポ状態
しかし、不能状態の[emb exp="f.En_name"]は動きが鈍かった[r]
鈴猫は体勢を立て直した！！[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*セクハラスキル
#蟲忍
ふふふ、苦しめ・・・！[p]
「媚薬注入」[p]
[emb exp="f.En_name"]は鈴猫の腿に毒針を突き立てた[p]
#鈴猫
きゃあっ！？[p]
（・・・身体がどんどん熱くなるっ！？）[p]
#
鈴猫は発情状態になった！！[p]
[eval exp="f.Estrus = 5 "]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*拘束脱出判定
#
鈴猫は暴れた[wt5]
#鈴猫
この！離しなさいよ！！[p]
#
[eval exp="f.Bind -= f.Total"]
拘束力が[emb exp="f.Total"]減少[wt5]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
しかし、振りほどくことはできなかった[p]
[jump storage="&f.enemy_PATH" target="*バーストセクハラ攻撃"]
[s]

*拘束引き分け
#蟲忍
大人しくしろ・・・[p]
#
[emb exp="f.En_name"]は鈴猫を締め上げた[r]
１０のダメージを受けた。[p]
[eval exp="f.HP -= 10"]
[update_status][show_score]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*拘束脱出
#
鈴猫は自由を取り戻した！[p]
[eval exp="f.Rt_Bind = 0"]
[eval exp="f.Rape_mode = 0" cond="f.Rape_mode > 0"]
[ptext layer="3" x="450" y="50" text="" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Bind" overwrite="true"]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*バーストセクハラ攻撃
[eval exp="f.BASE = 10"][EROdamage]
#蟲忍
ふふふ、搾り取ってやろう・・・[p]
#
蟲忍が嗤うと[emb exp="f.En_name"]が鈴猫の胸に吸い付いた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は[emb exp="f.damage"]の快感を受けた[p]
[eval exp="f.ERO += damage"][eval exp="f.En_ERO += 20"]
[call storage="battle.ks" target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
[jump target="*本番突入判定"]
[s]

*本番突入判定
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < f.En_ERO"]
[eval exp="f.Rape_mode = 1"]
[jump target="*レイプ開始"]
[endif]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

;レイプ----------------------------------------------------------------------
*レイプ開始
#蟲
キシャーーーーーッ!![p]
#
鈴猫を拘束していた蟲が奇声を上げた[p]
#蟲忍
ふふふ、この蟲はお前に発情しているぞ[r]
俺も昂ぶってきたところだ[p]
次の段階へ進ませてもらおう！！[p]
#
蟲忍の衣の下から先端に生殖管と思しきものが付いた触手が這い出してくる[p]
#鈴猫
ひっ！！嘘でしょ！！いやーーーーーーっ！！[p]
#
鈴猫の嫌悪の叫びを無視して蟲の固く冷たい触手が鈴猫の秘裂に潜り込んだ[p]
[chara_mod name="suzune" face="泣き"]
#鈴猫
（ーーーーーーーッ！！む、虫なんかに犯されてるぅ！？）[p]
[chara_mod name="suzune" face="苦しみ"]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*レイプ導入
#蟲忍
膣内温度適温、愛液分泌量多め・・・[p]
#
蟲と感覚を共有する虫忍が鈴猫の膣内を分析する[p]
[chara_mod name="suzune" face="苦しみ"]
#鈴猫
くっ！！なに人の身体を品定めしてんのよっ！！[p]
#蟲忍
ふふふ、喜べ。貴様の身体は実に良好だ。蟲の苗床としてな！！[p]
#
[return][s]

*レイプスキル
[eval exp="f.BASE = 10"][EROdamage]
蟲が鈴猫の身体を締めあげながら生殖管を出し入れする[p]
[chara_mod name="suzune" face="喘ぎ"]
#蟲
キィ！！キィッ！！[p]
#虫忍
ははっ。蟲にとっても具合が良いようだな貴様の穴は！！[p]
#鈴猫
いやぁ！！蟲なんかにぃ！！ううんっ！！[p]
#
鈴猫は[emb exp="f.damage"]の快感を受けた[p]
[eval exp="f.ERO += damage"]
[call storage="battle.ks" target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*レイプ脱出判定
#
蟲の触手の動きが激しさを増した。[p]
[chara_mod name="suzune" face="喘ぎ"]
#鈴猫
あんっ！！あんっ！！ひあっ！！[p]
#蟲忍
ふふっ！良いぞ女！！そのまま締め付けろ！！もうすぐだ！！[p]
#鈴猫
も、もうすぐぅぅっ！？？[p]
蟲忍の狂気の声に首を捻った見た鈴猫が見たのは生殖管に繋がる触手が不気味に蠕動する光景だった[p]
#蟲忍
そうだ！！今、蟲の子種がお前に送られているのだ！！しっかり受け止めろ！！[p]
#鈴猫
！？い、いやぁ！！やめてええええええっ！！[p]
#蟲忍
出るぞぉぉぉぉぉ！！[p]
[eval exp="f.Bind -= f.Total"]
[jump target="*レイプカウンター" cond="f.Magic_set >= 90"]
[jump target="*レイプ脱出" cond="f.Bind <= 0"]
[jump target="*レイプフィニッシュ"]
[s]

*レイプ脱出
#鈴猫
いやあああああっ！！！[p]
#
闇雲に振り回した鈴猫の手が蟲の目を捉える[p]
虫が軋むような悲鳴を上げ締め付けが緩む[p]
鈴猫はその隙をついて拘束から脱出することに成功した[p]
#鈴猫
んうっ！！[p]
途中で産卵管が膣から飛び出し、その快感に鈴猫は脚をもつれさせ転倒する[p]
そこに・・・[p]
#蟲
キシャアアアアアアアアアア！！！！[p]
#
生殖管から放たれた粘つく液体が降り注いだ[p]
#鈴猫
うぶっ！うええええっ、いやぁ・・・[p]
#
糸を引く粘液の中を無数のオタマジャクシらしきものが泳いでいる[p]
異形の虫の精液だった[p]
#
[chara_mod name="suzune" face="泣き"]
[eval exp="f.En_MP = 0 ,f.En_ERO = 0"]
[update_status]
#蟲忍
貴様ぁぁぁ！！貴重な子種おおおおおおお！！！[p]
#
鈴猫に子種を植え付けることに失敗した蟲忍が絶叫する[p]
生殖活動に力を使ったのか蟲の動きは鈍くなっている[p]
[chara_mod name="suzune" face="厳しい"]
#鈴猫
はあああああ！？頭に来てるのはこっちよ！！見てなさいその害虫絶対ぶっ潰す！！[p]
#
鈴猫は粘液を振り払いながら怒りに満ちた目で立ち上がった[p]
[jump target="*レイプ終了"]
[s]

*レイプフィニッシュ
#
触手の中を下る瘤が鈴猫の膣口にまで到達する[p]
[chara_mod name="suzune" face="泣き"]
#鈴猫
いやあああああっ！！やめてええええええええ！！[p]
#
常軌を逸した状況にさすがに鈴猫も本気で悲鳴を上げる[p]
しかし、蟲ごときが人語を解する道理はない[p]
ぶつっ！！ぶびゅっ！！ぶびゅびゅびゅびゅーーーー！！！[p]
大量の粘ついた液体が鈴猫の膣内に送り込まれる[p]
#鈴猫
ひゅああああああああああああああああっ！！！[p]
#
拘束された身体を海老反りにしながら鈴猫が絶叫する[p]
#
[eval exp="f.BASE = 50"][EROdamage]
鈴猫は[emb exp="f.damage"]の快感を受けた[p]
鈴猫の感度が大幅に上昇した[p]
[eval exp="f.ERO += f.damage"][eval exp="f.ERO_down += 3"]
[emb exp="f.En_name"]の気力と性欲が霧消した[p]
[eval exp="f.En_MP = 0 ,f.En_ERO = 0"]
[update_status]
[jump target="*絶頂フィニッシュ" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
#蟲忍
ふふふ、よくやった[p]
#
蟲忍は鈴猫を開放して戻ってきた蟲の頭部を愛おしそうに撫でる[p]
#鈴猫
あっ！！あっ！！あああああっ！！[p]
#
一方、鈴猫は開放されたものの膣内を蠢く異形の感覚に身悶えをしていた[p]
#蟲忍
分かるか女？貴様の胎内を蟲の精が作り変えていくのを[p]
捕らえた後は、次はゆっくりと卵を植え付けてやろう[p]
#
鈴猫はよろよろと立ち上がると[emb exp="f.En_name"]を睨みつけた[p]
[chara_mod name="suzune" face="厳しい"]
#鈴猫
ふっ！ふっざけんなぁ！！人の身体を何だと思ってんのよ！！[p]
#
[jump target="*レイプ終了"]
[s]

*レイプカウンター
#鈴猫
[chara_mod name="suzune" face="厳しい"]
（いちかばちか！今よ！！）[p]
[if exp="f.Magic_set == 91"]
「魂吸いの術！」[p]
[else]
「筒枯らしの術！」[p]
[endif]
#
鈴猫の膣が妖しく蠢き[emb exp="f.En_name"]の生殖管を締め上げる[p]
#蟲忍
「ぐおおおおおおお！！？？」[p]
その快感は蟲を介して感覚を共有する蟲忍を襲った[p]
想像を絶する快感が陰茎を中心に吹き荒れる[p]
蟲忍はその装束の下でなすすべもなく射精した[p]
[if exp="f.Magic_set == 91"]
[call storage="Magic.ks" target="*房中術体力吸収"]
[else]
[call storage="Magic.ks" target="*房中術デバフ"]
[endif]
#
[emb exp="f.En_name"]の気力と性欲が霧消した[p]
[eval exp="f.En_MP = 0 ,f.En_ERO = 0"]
[update_status]
[chara_mod name="suzune" face="厳しい"]
#鈴猫
あははは！不様なもんね！！人のことを弄んでくれた報いよっ！！[p]
#
鈴猫は仁王立ちで[emb exp="f.En_name"]を見下ろした[p]
#蟲忍
おのれえええええ！！[p]
#
[jump target="*レイプ終了"]
[s]

*レイプ終了
#
鈴猫は自由を取り戻した！[p]
[eval exp="f.Rt_Bind = 0 , f.Bind = 0"]
[eval exp="f.Rape_mode = 0" cond="f.Rape_mode > 0"]
[ptext layer="3" x="450" y="50" text="" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Bind" overwrite="true"]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

;フィニッシュ----------------------------------------------------------------------
*絶頂フィニッシュ
[chara_mod name="suzune" face="絶頂"]
#鈴猫
いやあああっ！！らめぇぇぇぇっ！！[p]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴猫は絶頂した[r]
体力が100減少[p]
[eval exp="f.HP -= 100"]
[if exp="f.HP <= 0"][jump target="*気絶フィニッシュ"][endif]
絶頂状態になった[r]
理性が１減少した[p]
[eval exp="f.SAN -= 1 , f.orgasm = 1 , f.Rt_orgasm = 2 , f.ERO = 0"]
[chara_mod name="suzune" face="レイプ目"]
#蟲忍
へへへ、なかなか良かったぜ[p]
#
蟲忍は嫌らしく笑いながらマラを引き抜くと鈴猫の尻を叩いた[p]
#鈴猫
ああんっ！！[p]
#
その場にくずおれた鈴猫の秘裂からごぽりと精液が溢れた[p]
#鈴猫
んっ！このぉ・・・・・・ぜったい、ゆるさないんらからぁっ！[p]
#
鈴猫はよろよろと立ち上がると[emb exp="f.En_name"]を睨みつけた[p]
[jump target="*レイプ終了"][s]

*気絶フィニッシュ
[chara_mod name="suzune" face="レイプ目"]
[eval exp="f.bind = 0"]
#
鈴猫は気絶した！[p]
#蟲忍
へへへ、なかなか良かったぜ[p]
#
蟲忍は白目を剥いて痙攣する鈴猫からマラを引き抜いた[p]
#鈴猫
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴猫はその場に崩折れる[r]
どろりと鈴猫の秘裂から精液がこぼれた[p]
#蟲忍
このままヤリ捨てるのは勿体ねえ上玉だな[r]
ねぐらまでお持ち帰りさせてもらおうか！！[p]
#
蟲忍はニヤリとほくそ笑むと鈴猫を担ぎ上げて意気揚々と闇の中へ消えていった[p]
ゲームオーバー（実際には蟲忍の住処へ続きます）
[s]
