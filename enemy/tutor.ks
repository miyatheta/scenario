*エネミーデータ
[call storage="enemy/enemy_data.ks" target="*tutor"]
[return]error101[s]

*ダメージ計算
[getrand min="1" max="&f.En_ATP" var="f.rand"]
[eval exp="tf.argment= (f.BASE * (f.En_ATP - f.Bonus_Orange*5) * (1+f.En_ATP_Plus/100) ) / f.Guard + f.rand"]
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
[emb exp="f.En_name"]が印を切った[p]

[elsif exp="f.rand<25"]
[eval exp="f.En_Hand1 = 7 , f.En_Hand2 = 10"]

[elsif exp="f.rand<50"]
[eval exp="f.En_Hand1 = 6 , f.En_Hand2 = 10"]

[elsif exp="f.rand<75"]
[eval exp="f.En_Hand1 = 5 , f.En_Hand2 = 10"]

[else]
[eval exp="f.En_Hand1 = 3 , f.En_Hand2 = 10"]

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
[if exp="f.rand > 90"]
[jump target="*攻撃バフ"]
[elsif exp="f.rand > 60"]
[jump target="*防御バフ"]
[elsif exp="f.rand > 40"]
[jump target="*守備力アップ"]
[else]
;else後にはデフォルトの行動を書く
[jump target="*命中バフ"]
[endif]
;ここまで来ることはない
error-battle-970
[s]

*攻撃バフ
「練気」[r]
[emb exp="f.En_name"]の攻撃力がアップ[wt5]
[eval exp="f.En_ATP_Plus = 50"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*防御バフ
「硬気功」[r]
[emb exp="f.En_name"]の防御力がアップ[wt5]
[eval exp="f.En_DFP_Plus = 20"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*命中バフ
「精神統一」[r]
[emb exp="f.En_name"]の命中力がアップ[wt5]
[eval exp="f.En_DEX_Plus = 10"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*守備力アップ
#
「気迫」[wt5]
呼吸が−１された[p]
[eval exp="f.BP -= 1"][eval exp="f.BP = 0" cond="f.BP < 0"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

;回避----------------------------------------------------------------------------

*敵回避
;敵回避判定[wt5]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand > 100 - (f.En_RES + f.RES_Plus - f.Bonus_Orange*10) "]
[eval exp="f.En_Pary = 1"]
#忍者
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
[eval exp="f.BASE = 5 , f.En_DEX = 0 "]
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

*敗北
鈴猫は敗北した[p]
[s]

;拘束----------------------------------------------------------------------------
*拘束開始
鈴猫は体勢を崩した！！[p]
[jump target="*インポ状態" cond="f.En_Impotenz > 0"]
[eval exp="f.BASE = 0, f.En_DEX = 70"]
「隙あり！！」[wt5]
[emb exp="f.En_name"]は鈴猫に組み付いた[p]
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
[eval exp="f.BASE = 5"][EROdamage]
#忍者
へっ！！おとなしくしな！！[p]
#
[emb exp="f.En_name"]は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は[emb exp="f.damage"]の快感を受けた[p]
[eval exp="f.ERO += f.damage"][eval exp="f.En_ERO += 10"]
[call storage="battle.ks" target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
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
#忍者
暴れんじゃねえよ！[p]
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
[eval exp="f.BASE = 7"][EROdamage]
#忍者
へへっ・・・。いつまで耐えられるかな？[p]
#
怪しげな液体で粘つく手で[emb exp="f.En_name"]は鈴猫の秘所を弄った[p]
#鈴猫
いやぁっ！！[p]
#
鈴猫は[emb exp="f.damage"]の快感を受けた[p]
媚薬の効果により感度が上昇した[p]
[eval exp="f.ERO += f.damage"][eval exp="f.En_ERO += 10"]
[eval exp="f.ERO_down += 2"]
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
#忍者
もう！我慢できねえぜ！！[r]
このまま本番に行かせてもらうぜ！！[p]
#鈴猫
ちょっ！！やめーーーーーー[p]
#
忍者はマラを鈴猫の秘裂に挿入した[p]
[chara_mod name="suzune" face="泣き"]
#鈴猫
（ーーーーーーーッ！！）[p]
[chara_mod name="suzune" face="苦しみ"]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*レイプ導入
#忍者
どうだ！俺のマラの感触は！！[p]
[chara_mod name="suzune" face="苦しみ"]
#鈴猫
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#忍者
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
#
[return][s]

*レイプスキル
[eval exp="f.BASE = 10"][EROdamage]
忍者はしっかりと鈴猫の腰を抱え込むと激しく腰を打ち付けた[p]
[chara_mod name="suzune" face="喘ぎ"]
#忍者
オラオラ、オラァ！！[p]
#鈴猫
んっ！！こんな奴にぃ！！ううんっ！！[p]
#
鈴猫は[emb exp="f.damage"]の快感を受けた[p]
[eval exp="f.ERO += f.damage"]
[call storage="battle.ks" target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*レイプ脱出判定
#
忍者は魔羅で鈴猫の膣を荒々しく突き上げた[p]
[chara_mod name="suzune" face="喘ぎ"]
#鈴猫
あんっ！！あんっ！！ひあっ！！[p]
#忍者
へへっ！！いい声で鳴くようになってきたじゃねえか！！[p]
#鈴猫
う、うるさっ！！ひぃぃん！！！[p]
#忍者
よしっ！！このまま中でぶちまけてやるぜ！！[p]
#鈴猫
！！やめろぉっ！！ばかぁ！！んうううっ！！[p]
#忍者
うおおおおおっ！！出すぞ！！[p]
[eval exp="f.Bind -= f.Total"]
[jump target="*レイプカウンター" cond="f.Magic_set >= 90"]
[jump target="*レイプ脱出" cond="f.Bind <= 0"]
[jump target="*レイプフィニッシュ"]
[s]

*レイプ脱出
#鈴猫
いやあああああっ！！！[p]
#
気をやった忍者の腕力が緩む一瞬の隙をついて、鈴猫は拘束を無理やり振りほどいた[p]
膣から放り出された魔羅が外気に晒される[p]
だが、今更射精を止めることなどできない[p]
#忍者
うおおおおおおっ！？[p]
#
虚空に向けて放たれた精液が仰向けに倒れ込んだ鈴猫の上に降り注いだ[p]
#鈴猫
うぶっ！うええええっ、いやぁ・・・[p]
#
顔に貼り付いた精液を拭いながら鈴猫は転がるように距離を取った[p]
[chara_mod name="suzune" face="泣き"]
[eval exp="f.En_MP = 0 ,f.En_ERO = 0"]
[update_status]
#忍者
ちっ！肝心のところで！！[p]
#
忍者は舌打ちをしながらマラを仕舞い直した[p]
[chara_mod name="suzune" face="厳しい"]
#鈴猫
くっ！絶対許さないんだから！！[p]
#
鈴猫は何とか立ち上がると[emb exp="f.En_name"]を睨みつけた[p]
[jump target="*レイプ終了"]
[s]

*レイプフィニッシュ
#
忍者は鈴猫の中で射精した[p]
[chara_mod name="suzune" face="泣き"]
#鈴猫
いやあああああっ！！！[p]
#
鈴猫は精の迸りを子宮に感じながら嬌声を上げた[r]
#
[if exp="f.ERO_DEF > 0"]
[eval exp="f.BASE = 10"][EROdamage]
[else]
[eval exp="f.BASE = 50"][EROdamage]
[endif]
鈴猫は[emb exp="f.damage"]の快感を受けた[p]
[eval exp="f.ERO += f.damage"]
[emb exp="f.En_name"]の気力と性欲が霧消した[p]
[eval exp="f.En_MP = 0 ,f.En_ERO = 0"]
[update_status]
[jump target="*絶頂フィニッシュ" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
#忍者
へへへ、なかなか良かったぜ[p]
#
忍者は嫌らしく笑いながらマラを引き抜くと鈴猫の尻を叩いた[p]
#鈴猫
ああんっ！！[p]
#
その場にくずおれた鈴猫の秘裂からごぽりと精液が溢れた[p]
[chara_mod name="suzune" face="厳しい"]
#鈴猫
くっ！絶対許さないんだから！！[p]
#
鈴猫はよろよろと立ち上がると[emb exp="f.En_name"]を睨みつけた[p]
[jump target="*レイプ終了"]
[s]

*レイプカウンター
#鈴猫
[chara_mod name="suzune" face="厳しい"]
（かかった！今よ！！）[p]
[if exp="f.Magic_set == 91"]
「魂吸いの術！」[p]
[else]
「筒枯らしの術！」[p]
[endif]
#
鈴猫の膣が妖しく蠢き[emb exp="f.En_name"]の魔羅を締め上げる[p]
#忍者
「ぐおおおおおおお！！？？」[p]
忍者は鈴猫の中で射精した[p]
想像を絶する快感が陰茎を中心に吹き荒れる[p]
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
残念でした！お馬鹿さん！！[p]
#
鈴猫は仁王立ちで[emb exp="f.En_name"]を見下ろした[p]
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
#忍者
へへへ、なかなか良かったぜ[p]
#
忍者は嫌らしく笑いながらマラを引き抜くと鈴猫の尻を叩いた[p]
#鈴猫
ああんっ！！[p]
#
その場にくずおれた鈴猫の秘裂からごぽりと精液が溢れた[p]
#鈴猫
んっ！このぉ……ぜったい、ゆるさないんらからぁっ！[p]
#
鈴猫はよろよろと立ち上がると[emb exp="f.En_name"]を睨みつけた[p]
[jump target="*レイプ終了"][s]

*気絶フィニッシュ
[chara_mod name="suzune" face="レイプ目"]
[eval exp="f.bind = 0"]
#
鈴猫は気絶した！[p]
#忍者
へへへ、なかなか良かったぜ[p]
#
忍者は白目を剥いて痙攣する鈴猫からマラを引き抜いた[p]
#鈴猫
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴猫はその場に崩折れる[r]
どろりと鈴猫の秘裂から精液がこぼれた[p]
#忍者
このままヤリ捨てるのは勿体ねえ上玉だな[r]
ねぐらまでお持ち帰りさせてもらおうか！！[p]
#
忍者はニヤリとほくそ笑むと鈴猫を担ぎ上げて意気揚々と闇の中へ消えていった[p]
ゲームオーバー（実際には忍者の住処へ続きます）
[s]
