*武芸レベル判定
;武芸は赤の枚数に応じて変わる
[if exp="f.Bonus_Red >= 3"]
[jump target="*武芸レベルMAX"]
[elsif exp="f.Bonus_Red == 2"]
[jump target="*武芸レベル3"]
[elsif exp="f.Bonus_Red == 1"]
[jump target="*武芸レベル2"]
[else]
[jump target="*武芸レベル1"]
[endif]
[s]

*武芸レベルMAX
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="円月の舞" target="*武芸レベルMAX-1"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" text="四神衝" target="*武芸レベルMAX-2"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" text="乾坤" target="*武芸レベルMAX-3"]
[s]

*武芸レベル3
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="螺旋・鎧通し" target="*武芸レベル3-1"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" text="疾風迅雷" target="*武芸レベル3-2"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" text="日天掌" target="*武芸レベル3-3"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" text="雀蜂" target="*武芸レベル3-4"]
[s]

*武芸レベル2
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="三日月" target="*武芸レベル2-1"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" text="五月雨" target="*武芸レベル2-2"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" text="八重の椿" target="*武芸レベル2-3"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" text="虹霓落とし" target="*武芸レベル2-4"]
[s]

*武芸レベル1
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="初風" target="*武芸レベル1-1"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" text="吹雪" target="*武芸レベル1-2"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" text="朧" target="*武芸レベル1-3"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" text="花嵐" target="*武芸レベル1-4"]
[s]

*ダメージ計算
[if exp="f.Total == 21"]
[eval exp="f.critical = 1.5" ]
会心の一撃[r]
[endif]
[eval exp="tf.argment = f.BASE * (f.ATP) - (f.orgasm * 50) * f.critical"]
[getMathRound var="f.damage"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた。[p]
[update_status]
[return][s]

*武芸レベル3-1
;装甲貫通
「螺旋」[wt2]
[eval exp="f.BASE = 4"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*武芸レベル3-2
;必中
「疾風迅雷」[wt2]
[eval exp="f.BASE = 4"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*武芸レベル3-3
;妖怪に大ダメージ
「日天掌」[wt2]
[eval exp="f.BASE = 4"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*武芸レベル3-4
;毒を付与
「雀蜂」[wt2]
[eval exp="f.BASE = 4"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*武芸レベル2-1
;敵の札に３の倍数で威力アップ
;弧を描く蹴り技
「三日月」[wt2]
[eval exp="f.BASE = 3"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*武芸レベル2-2
;敵の札に5の倍数で威力アップ
;拳のラッシュ
「五月雨」[wt2]
[eval exp="f.BASE = 3"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*武芸レベル2-3
;敵の札に4の倍数で威力アップ
;苦無を八本投擲する
「八重の椿」[wt2]
[eval exp="f.BASE = 3"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*武芸レベル2-4
;敵の札に7の倍数で威力アップ
;幸せ投げ
「虹霓落とし」[wt2]
[eval exp="f.BASE = 3"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*武芸レベル1-1
;一のカードで威力アップ
;手刀
「初風」[wt2]
[eval exp="f.BASE = 2"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]
*武芸レベル1-2
;雪の札で威力アップ
;掌打
「吹雪」[wt2]
[eval exp="f.BASE = 2"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]
*武芸レベル1-3
;月の札で威力アップ
;沈み込んだところから上段蹴り
「朧」[wt2]
[eval exp="f.BASE = 2"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]
*武芸レベル1-4
;花の札で威力アップ
;中断回し膝蹴り
「花嵐」[wt2]
[eval exp="f.BASE = 2"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]


*武芸レベルMAX-1
;手札の数によって威力アップ
;目くらましの上段蹴りから始まる円の動きを取るコンビネーション
「円月の舞」[wt2]
[eval exp="f.BASE = 5"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]
*武芸レベルMAX-2
;ドロー数によって威力アップ。５枚引くと威力最大
;至近距離での正拳連打。５枚の場合最後に上段蹴りで〆る。
「四神衝」[wt2]
[eval exp="f.BASE = 5"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]
*武芸レベルMAX-3
;残りHPが少ないほど威力アップ
;カウンターの一撃
「乾坤」[wt2]
[eval exp="f.BASE = 5"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]



[s]
/*
武芸レベルMAX：威力全振り、もしくは強力な効果を持つ必殺技。
赤３枚揃うことが少ないので、効果は絶大。
武芸レベル３：敵の厄介な行動を阻害する。火力自体はレベル２と同等だがデバフ等の副次効果が付く。
敵のバフ解除などを狙って赤札を引く必要のある攻撃。気象現象の名前。
武芸レベル２：相手の札に応じて威力を上げられる。赤１枚なので札の構成は阻害しない。
ボーナスを獲得しなくても火力が見込める。メインウェポン。名前に数字を含む
武芸レベル１：自身の札に応じて威力を上げられる。というより、その手のボーナスがないと威力が出ない。
赤が０枚で良いので自身の札の自由度は高い。しゃがみのアクション。絵札の名前と対応。
 */
