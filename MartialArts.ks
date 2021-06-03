*武芸選択
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" cond="f.Bind<1" text="強攻撃(呼吸-7)" target="*強攻撃準備"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" cond="f.Bind<1" text="中攻撃(呼吸-5)" target="*中攻撃準備"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" cond="f.Bind<1" text="弱攻撃(呼吸-3)" target="*弱攻撃準備"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="450" cond="f.Bind<1" text="牽　制(呼吸-1)" target="*牽制準備"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="500" cond="f.Bind<1" text="戻る" storage="battle.ks" target="*ドロー1コマンド"]
[s]
*牽制準備
#
[eval exp="f.BP_reserved = 1"]
[eval exp="f.Marts_set=11"]
[show_score]
[jump storage="battle.ks" target="*ドロー2"][s]

*弱攻撃準備
#
[if exp="f.BP<3"]
呼吸が足りません（要3以上）[p]
[jump target="*武芸選択"]
[endif]
[eval exp="f.BP_reserved = 3"]
[eval exp="f.Marts_set=21"]
[show_score]
[jump storage="battle.ks" target="*ドロー2"][s]

*中攻撃準備
#
[if exp="f.BP<5"]
呼吸が足りません（要5以上）[p]
[jump target="*武芸選択"]
[endif]
[eval exp="f.BP_reserved = 5"]
[eval exp="f.Marts_set=31"]
[show_score]
[jump storage="battle.ks" target="*ドロー2"][s]

*強攻撃準備
#
[if exp="f.BP<7"]
呼吸が足りません（要7以上）[p]
[jump target="*武芸選択"]
[endif]
[eval exp="f.BP_reserved = 7"]
[eval exp="f.Marts_set=41"]
[show_score]
[jump storage="battle.ks" target="*ドロー2"][s]

*武芸判定
[if exp="f.Marts_set == 11 "]
[jump target="*牽制"]
[elsif exp="f.Marts_set == 21 "]
[jump target="*弱攻撃"]
[elsif exp="f.Marts_set == 31 "]
[jump target="*中攻撃"]
[elsif exp="f.Marts_set == 41 "]
[jump target="*強攻撃"]
[endif]
[jump target="*牽制"]
[s]

*強攻撃
;かかと落とし
鈴猫の攻撃[r]
「かかと落とし」[wt5]
[eval exp="f.BP -= f.BP_reserved"][show_score]
[eval exp="f.BASE =8 + (f.Bonus_Red * 0.3)"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*中攻撃
;回し蹴り
鈴猫の攻撃[r]
「回し蹴り」[wt5]
[eval exp="f.BP -= f.BP_reserved"][show_score]
[eval exp="f.BASE = 5 + (f.Bonus_Red * 0.3)"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*弱攻撃
;キック
鈴猫の攻撃[r]
「キック」[wt5]
[eval exp="f.BP -= f.BP_reserved"][show_score]
[eval exp="f.BASE = 3 + (f.Bonus_Red * 0.3)"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*牽制
;拳
鈴猫の攻撃[r]
「掌打」[wt5]
[eval exp="f.BP -= f.BP_reserved"][show_score]
[eval exp="f.BASE = 1 + (f.Bonus_Red * 0.3)"]
[call target="*ダメージ計算"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*ダメージ計算
[if exp="f.Total == 21"]
[eval exp="f.critical = 1.5" ]
会心の一撃[r]
[endif]
[eval exp="tf.argment = f.BASE * (f.ATP * 2) * f.critical"]
[getMathRound var="f.damage"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた。[p]
[update_status]
[return][s]
