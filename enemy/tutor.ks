*エネミーデータ
[eval exp="f.En_HP = 2000 ,f.En_MP_gain =　30 , f.En_ATP = 10 , f.En_DEX = 0 ,f.En_BASE_ERO = 30"]
[eval exp="f.En_ATP_Plus = 0, f.En_DFP_Plus = 0 , f.En_DEX_Plus = 0 "]
[return][s]

*行動パターン
;敵の行動パターン選定
;チャージ判定
[eval exp="f.En_BURST = 0" cond="f.En_BURST > 0"]
[eval exp="f.En_HOLD = 0" cond="f.En_HOLD > 0"]
;判定可能変数（残りHP）
[getrand min="1" max="100" var="f.rand"]
[if exp="f.En_MP >= 100"]
[eval exp="f.En_BURST = 1"]
[eval exp="f.En_DEF = 11"]
敵が印を切った[p]
[elsif exp="f.rand < f.En_BASE_ERO + f.ERO"]
[eval exp="f.En_DEF = 10"]
[eval exp="f.En_HOLD = 1" ]
敵は鈴猫の身体を舐めるように見ている[p]
[elsif exp="f.rand<25"]
[eval exp="f.En_DEF = 9"]
[elsif exp="f.rand<50"]
[eval exp="f.En_DEF = 8"]
[elsif exp="f.rand<75"]
[eval exp="f.En_DEF = 7"]
[else]
[eval exp="f.En_DEF = 7"]
[endif]
[return][s]

*回避
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < (f.RES + f.RES_green) - (f.En_DEX + f.En_DEX_Plus) - (f.orgasm * 30) "]
[eval exp="f.Pary = 1"]
#鈴猫
甘い！！[r]
#
鈴猫は敵の攻撃を回避した[p]
[endif]
[return][s]

*ダメージ計算
[getrand min="1" max="&f.En_ATP" var="f.rand"]
[eval exp="f.damage = f.BASE + f.En_ATP_Plus + f.rand"]
[eval exp="f.HP -= f.damage"]
[emb exp="f.damage"]のダメージを受けた。[p]
[return][s]

*敵行動
;ターゲットテキストの作成
[iscript]
f.nextDraw = f.Down + 1;
f.returnTag = "*ドロー" + f.nextDraw;
[endscript]
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
練気[r]
敵の攻撃力がアップ[wt2]
[eval exp="f.En_ATP_Plus = 50"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*防御バフ
硬気功[r]
敵の防御力がアップ[wt2]
[eval exp="f.En_DFP_Plus = 50"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*命中バフ
精神統一[r]
敵の命中力がアップ[wt2]
[eval exp="f.En_DFP_Plus = 10"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*強攻撃
[eval exp="f.BASE= 50 , f.En_DEX = -5"]
;回避判定
[call target="*回避"]
;回避成功の場合ジャンプ
[jump storage="battle.ks" target="&f.returnTag" cond="f.Pary > 0"]
;無敵の場合ジャンプ
[jump storage="battle.ks" target="*空蝉発動" cond="f.invincible > 0"]
;失敗の場合ダメージ
;ダメージ演出
[call target="*ダメージ計算"]
;生死の判定
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*守備力アップ
#
敵のスキル使用[wt2]
「守備体勢」[wt2]
敵の守備力が＋１された[p]
[eval exp="f.En_DEF += 1"][eval exp="f.Target += 1" ]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

;バースト----------------------------------------------------------------------------

*バースト
敵の攻撃[r]
[if exp="f.En_HOLD > 0" ]
[jump target="*拘束攻撃"]
[elsif exp="f.En_BURST > 0"]
[jump target="*チャージ攻撃"]
[else]
[jump target="*バースト攻撃"]
[endif]
[s]

*チャージ攻撃
敵のチャージ攻撃[p]
[eval exp="f.BASE= 200 , f.En_DEX = 0"]
;回避判定
[call target="*回避"]
;回避成功の場合ジャンプ
[jump storage="battle.ks" target="*ラウンド終了" cond="f.Pary > 0"]
;無敵の場合ジャンプ
[jump storage="battle.ks" target="*空蝉発動" cond="f.invincible > 0"]
;失敗の場合ダメージ
;ダメージ演出
[call target="*ダメージ計算"]
;生死の判定
[update_status][show_score]
[jump target="*敗北" cond="f.HP <= 0"]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*拘束攻撃
敵は鈴猫を拘束した[p]
[jump storage="battle.ks" target="*空蝉発動拘束時" cond="f.invincible > 0"]
[jump storage="battle/bind.ks" target="*拘束開始"]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*バースト攻撃
敵のバースト攻撃[r]
[eval exp="f.BASE= 50 , f.En_DEX = -5"]
;回避判定
[call target="*回避"]
;回避成功の場合ジャンプ
[jump storage="battle.ks" target="&f.returnTag" cond="f.Pary > 0"]
;無敵の場合ジャンプ
[jump storage="battle.ks" target="*空蝉発動" cond="f.invincible > 0"]
;失敗の場合ダメージ
;ダメージ演出
[call target="*ダメージ計算"]
;生死の判定
[update_status][show_score]
[jump target="*敗北" cond="f.HP <= 0"]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*敗北
鈴猫は敗北した[p]
[s]

;拘束----------------------------------------------------------------------------

*敵拘束攻撃1
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 90"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.ERO += 5" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 10"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[else]
#敵
暴れんじゃねえよ！[p]
#
敵の攻撃[r]
１０のダメージを受けた。[p]
[eval exp="f.HP -= 10"]
[endif]
[update_status][show_score]
[return][s]

*敵拘束攻撃2
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 90"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.ERO += 5" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 10"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[else]
#敵
暴れんじゃねえよ！[p]
#
敵の攻撃[r]
１０のダメージを受けた。[p]
[eval exp="f.HP -= 10"]
[endif]
[update_status][show_score]
[return][s]

*敵拘束攻撃3
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 90"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.ERO += 5" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 10"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[else]
#敵
暴れんじゃねえよ！！[p]
#
敵の攻撃[r]
１０のダメージを受けた。[p]
[eval exp="f.HP -= 10"]
[endif]
[update_status][show_score]
[return][s]

*拘束バースト
#敵
敵は鈴猫の秘所を弄った[p]
#鈴猫
いやぁっ！！[p]
#
鈴猫は２０の快感を受けた[p]
[eval exp="f.ERO += 20"][eval exp="f.ERO += 10" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 20"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
[return][s]

;レイプ----------------------------------------------------------------------
*レイプ開始
#敵
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
[return][s]

*レイプ序
#忍者
どうだ！俺のマラの感触は！！[p]
[chara_mod name="suzune" face="苦しみ"]
#鈴猫
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#忍者
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
#
[return][s]

*レイプ本番
忍者はしっかりと鈴猫の腰を抱え込むと激しく腰を打ち付けた[p]
[chara_mod name="suzune" face="喘ぎ"]
#忍者
オラオラ、オラァ！！[p]
#鈴猫
んっ！！こんな奴にぃ！！ううんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.ERO += 5" cond="f.orgasm > 0"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
[return][s]

*レイプフィニッシュ
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
#
忍者は鈴猫の中で射精した[p]
[chara_mod name="suzune" face="泣き"]
#鈴猫
いやあああああっ！！！[p]
#
鈴猫は精の迸りを子宮に感じながら嬌声を上げた[r]
#
[if exp="f.ERO_DEF > 0"]
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"]
[else]
鈴猫は５０の快感を受けた[p]
[eval exp="f.ERO += 50"]
[endif]
[eval exp="f.En_MP = 0 ,f.En_ERO = 0"]
[eval exp="f.ERO += 25" cond="f.orgasm > 0"]
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
鈴猫はよろよろと立ち上がると敵を睨みつけた[p]
[return]
[s]

;絶頂----------------------------------------------------------------------
*絶頂
[chara_mod name="suzune" face="絶頂"]
#鈴猫
いやあああっ！！らめぇぇぇぇっ！！[p]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴猫は絶頂した[r]
体力が50減少[p]
[eval exp="f.HP -= 50"]
[eval exp="f.HP = 1" cond="f.HP <= 0"]
絶頂状態になった[r]
理性が１減少した[p]
[eval exp="f.SAN -= 1 , f.orgasm = 1 , f.Rt_orgasm = 2 , f.ERO = 0"]
[chara_mod name="suzune" face="レイプ目"]
[return]
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
鈴猫はよろよろと立ち上がると敵を睨みつけた[p]
[return][s]

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
