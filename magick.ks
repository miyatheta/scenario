*忍術選択
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" exp="f.Magic1_set = 1" text="颶風・鎌鼬（迅３枚）" target="*忍術1準備"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" exp="f.Magic2_set = 1" text="火車・叢原火（技３枚）" target="*忍術2準備"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" exp="f.Magic3_set = 1" text="波動・威吹（気３枚）" target="*忍術3準備"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="450" text="戻る" storage="battle.ks" target="*ドロー1コマンド"]
[s]

*忍術1準備
#
鈴猫は印を構えた[wt5]
[eval exp="f.MP=0"]
[eval exp="f.Magick_set=1"]
[jump storage="battle.ks" target="*ドロー1コマンド"][s]

*忍術2準備
#
鈴猫は印を構えた[wt5]
[eval exp="f.MP=0"]
[eval exp="f.Magick_set=1"]
[jump storage="battle.ks" target="*ドロー1コマンド"][s]

*忍術3準備
#
鈴猫は印を構えた[wt5]
[eval exp="f.MP=0"]
[eval exp="f.Magick_set=1"]
[jump storage="battle.ks" target="*ドロー1コマンド"][s]

*ダメージ計算
[eval exp="tf.argment = f.BASE * (f.ATP)"]
[getMathRound var="f.damage"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた。[p]
[update_status]
[return][s]

*忍術判定
[if exp="f.Magic1_set > 0"]
[Calc_Card]
[jump target="*颶風・鎌鼬" cond="f.Green >= 3"]
忍術発動失敗[wt2]

[elsif exp="f.Magic2_set > 0"]
[Calc_Card]
[jump target="*火車・叢原火" cond="f.Orange >= 3"]
忍術発動失敗[wt2]

[elsif exp="f.Magic1_set > 0"]
[Calc_Card]
[jump target="*波動・威吹" cond="f.Blue >= 3"]
忍術発動失敗[wt2]

[endif]

苦無乱れ打ち[wt5]
[jump target="*苦無乱れ打ち"]
[s]

*苦無乱れ打ち
;下記３つが不発のときのコモン技
#鈴猫
「苦無乱れ打ち！！」[wt2]
#
無数の苦無を投げつけた[wt5]
[eval exp="f.BASE = 5"]
[call target="*ダメージ計算"]
[eval exp="f.Magic_set = 0, f.Magic3_set = 0 , f.Magic2_set = 0 , f.Magic1_set = 0"]
[jump storage="&f.returnStr" target="&f.returnTag"]
[s]

*颶風・鎌鼬
;鋼線で敵を切り刻む。緑色３枚。
#鈴猫
「吹けよ颶風・鎌鼬！！」[wt5]
#
不可視の刃が周囲を切り刻んだ[wt5]
[eval exp="f.BASE = 8"]
[call target="*ダメージ計算"]
[eval exp="f.Magic_set = 0, f.Magic3_set = 0 , f.Magic2_set = 0 , f.Magic1_set = 0"]
[jump storage="&f.returnStr" target="&f.returnTag"]
[s]

*火車・叢原火
;黄色３枚
#鈴猫
「燃え上がれ！！火車・叢原火！！」[wt5]
#
敵を火柱が包み込んだ[wt5]
[eval exp="f.BASE = 8"]
[call target="*ダメージ計算"]
[eval exp="f.Magic_set = 0, f.Magic3_set = 0 , f.Magic2_set = 0 , f.Magic1_set = 0"]
[jump storage="&f.returnStr" target="*バースト"]
[s]

*波動・威吹
;青色３枚。
#鈴猫
「打ち払え！！威吹！！」[wt5]
#
[eval exp="f.BASE = 8"]
[call target="*ダメージ計算"]
[eval exp="f.MP=0"]
[eval exp="f.Magic3_set = 0 , f.Magic2_set = 0 , f.Magic1_set = 0"]
[jump storage="&f.returnStr" target="&f.returnTag"]
[s]

忍術は先にベットを行い効果を発揮する。
バーストしたり、判定負けすると発動しない。
BJのダブルに相当。
発動条件、特定の色のカードを指定枚数引いて勝つ。
失敗したときはコモンの忍術が発動する。
