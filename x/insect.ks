*エネミーデータ
[return]error101[s]

*ダメージ計算
[getrand min="1" max="&f.En_ATP" var="f.rand"]
[eval exp="tf.argment= (f.BASE * (f.En_ATP - f.Bonus_Orange*5) * (1+f.En_ATP_Plus) ) / f.Guard + f.rand"]
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
[emb exp="f.En_name"]が隊列を組んだ！！[p]

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
[jump target="*回避バフ"]
[elsif exp="f.rand > 40"]
[jump target="*気力ダウン"]
[else]
;else後にはデフォルトの行動を書く
[jump target="*命中バフ"]
[endif]
;ここまで来ることはない
error-battle-970
[s]

*攻撃バフ
「毒針装填」[r]
[emb exp="f.En_name"]の攻撃力がアップ[wt5]
[eval exp="f.En_ATP_Plus = 50"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*回避バフ
「散開する」[r]
[emb exp="f.En_name"]の回避力がアップ[wt5]
[eval exp="f.En_RES_Plus = 30"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*命中バフ
「包囲する」[r]
[emb exp="f.En_name"]の命中力がアップ[wt5]
[eval exp="f.En_DEX_Plus = 20"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*気力ダウン
#
「羽音」[wt5]
鈴猫は気力を５喪失した[p]
[eval exp="f.MP -= 5"][eval exp="f.MP = 0" cond="f.MP < 0"]
[update_status][show_score]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

;回避----------------------------------------------------------------------------

*敵回避
;敵回避判定[wt5]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand > 100 - (f.En_RES + f.RES_Plus - f.Bonus_Orange*10) "]
[eval exp="f.En_Pary = 1"]
#
[emb exp="f.En_name"]は羽ばたいて鈴猫の攻撃を回避した[p]
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
#
「毒針」[wt5]
[eval exp="f.BASE = 1 , f.En_DEX = 0 "]
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
[eval exp="f.Poizon = 5"]
鈴猫は毒状態になった[wt5]
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
#
鈴猫は体勢を崩した！！[p]
[jump target="*インポ状態" cond="f.En_Impotenz > 0"]
[eval exp="f.BASE = 0, f.En_DEX = 70"]
[emb exp="f.En_name"]が鈴猫に殺到した！！[p]
「掻痒毒針」[wt5]
;回避判定
[call storage="battle.ks" target="*回避"]
;回避成功の場合ジャンプ
[jump storage="battle.ks" target="*ラウンド終了" cond="f.Pary > 0"]
;無敵の場合ジャンプ
[jump storage="battle.ks" target="*空蝉発動拘束時" cond="f.invincible > 0"]
;失敗の場合拘束
#
鈴猫の感度が上昇した[p]
[eval exp="f.ERO_down += 1"]
[update_status][show_score]
;f.Bind=拘束力,f.Rt_Bind=拘束状態であることを示すフラグ
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*インポ状態
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*セクハラスキル
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*拘束脱出判定
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*拘束引き分け
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*拘束脱出
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*バーストセクハラ攻撃
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*本番突入判定
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

;レイプ----------------------------------------------------------------------
*レイプ開始
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*レイプ導入
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*レイプスキル
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*レイプ脱出判定
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*レイプ脱出
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*レイプフィニッシュ
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*レイプカウンター
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*レイプ終了
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

;フィニッシュ----------------------------------------------------------------------
*絶頂フィニッシュ
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*気絶フィニッシュ
#
error404[wt5]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]
