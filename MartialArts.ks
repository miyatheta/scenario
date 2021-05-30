*武芸判定
;補正値計算
[eval exp="f.MA_bonus = 0"]
;絵札ボーナス
[iscript]
for(i=0;i<3;i++){
  if(f.Cards[f.Hand[i]]['honor'] > 0){
    f.MA_bonus += 0.3;
    break;
  }
}
[endscript]
;武芸はカードの内訳によって変化する
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

*武芸レベル4
;赤３枚（スリーカード、ワンペアがありえない）
;かかと落とし
鈴猫の攻撃[r]
「かかと落とし」[wt5]
[eval exp="f.BASE = 5 + f.MA_bonus"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*武芸レベル3
;赤２枚（スリーカードがありえない）
;飛び蹴り
鈴猫の攻撃[r]
「飛び蹴り」[wt5]
[eval exp="f.BASE = 3 + f.MA_bonus"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*武芸レベル2
;赤１枚
;キックorアッパー
鈴猫の攻撃[r]
「キック」[wt5]
[eval exp="f.BASE = 2 + f.MA_bonus"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*武芸レベル1
;赤０枚
鈴猫の攻撃[r]
「掌打」[wt5]
[eval exp="f.BASE = 1 + f.MA_bonus"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*ダメージ計算
[if exp="f.Total == 21"]
[eval exp="f.critical = 1.5" ]
会心の一撃[r]
[endif]
[eval exp="tf.argment = f.BASE * (f.ATP * 2) * f.critical　- (f.orgasm * 50)"]
[getMathRound var="f.damage"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた。[p]
[update_status]
[return][s]
