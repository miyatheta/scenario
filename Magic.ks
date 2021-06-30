*忍術選択
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" cond="f.Bind<1" text="乱れ苦無の術(気力30)" target="*忍術1準備"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" cond="f.Bind<1" text="鎌鼬の術　　(気力60)" target="*忍術2準備"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" cond="f.Bind<1" text="火遁・焔舞い(気力100)" target="*忍術3準備"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="450" cond="f.Bind<1" text="破魔・螺旋功(気力50)" target="*忍術4準備"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="500" cond="f.Bind<1" text="戻る" storage="battle.ks" target="*ドロー1コマンド"]

[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" cond="f.Bind>0" text="房中術・魂吸い(気力50)" target="*房中術1準備" exp="f.Magic_set=91"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" cond="f.Bind>0" text="房中術・筒枯らし(気力30)" target="*房中術2準備" exp="f.Magic_set=92"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="500" cond="f.Bind>0" text="戻る" storage="battle.ks" target="*ドロー1コマンド"]
[s]

*忍術1準備
#
[if exp="f.MP<30"]
気力が足りません（要３０以上）[p]
[jump target="*忍術選択"]
[endif]
鈴猫は印を構えた[wt5]
[eval exp="f.MP -= 30"]
[eval exp="f.Magic_set=11"]
[jump storage="battle.ks" target="*ドロー2"][s]

*忍術2準備
#
[if exp="f.MP<60"]
気力が足りません（要６０以上）[p]
[jump target="*忍術選択"]
[endif]
鈴猫は印を構えた[wt5]
[eval exp="f.MP -= 60"]
[eval exp="f.Magic_set=21"]
[jump storage="battle.ks" target="*ドロー2"][s]

*忍術3準備
#
[if exp="f.MP<100"]
気力が足りません（要１００）[p]
[jump target="*忍術選択"]
[endif]
鈴猫は印を構えた[wt5]
[eval exp="f.MP -= 100"]
[eval exp="f.Magic_set=31"]
[jump storage="battle.ks" target="*ドロー2"][s]

*忍術4準備
#
[if exp="f.MP<50"]
気力が足りません（要５０）[p]
[jump target="*忍術選択"]
[endif]
鈴猫は印を構えた[wt5]
[eval exp="f.MP -= 50"]
[eval exp="f.Magic_set=41"]
[jump storage="battle.ks" target="*ドロー2"][s]

*房中術1準備
#
[if exp="f.MP<50"]
気力が足りません（要５０以上）[p]
[jump target="*忍術選択"]
[endif]
鈴猫は印を構えた[wt5]
[eval exp="f.MP -= 50"]
[eval exp="f.Magic_set=91"]
[jump storage="battle.ks" target="*ドロー2"][s]

*房中術2準備
#
[if exp="f.MP<30"]
気力が足りません（要３０以上）[p]
[jump target="*忍術選択"]
[endif]
鈴猫は印を構えた[wt5]
[eval exp="f.MP -= 30"]
[eval exp="f.Magic_set=92"]
[jump storage="battle.ks" target="*ドロー2"][s]

*ダメージ計算
[eval exp="tf.argment = f.BASE * (f.ATP)"]
[getMathRound var="f.damage"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた。[p]
[update_status]
[return][s]

*忍術判定
;補正値計算
[eval exp="f.Bonus_Honor = 0"]
;絵札ボーナス
[iscript]
for(i=0;i<3;i++){
  if(f.Cards[f.Hand[i]]['honor'] > 0){
    f.Bonus_Honor += 0.3;
    break;
  }
}
[endscript]
[if exp="f.Magic_set == 11"]
[jump target="*苦無術"]

[elsif exp="f.Magic_set == 21"]
[jump target="*鎌鼬"]

[elsif exp="f.Magic_set == 31"]
[jump target="*火遁"]

[elsif exp="f.Magic_set == 41"]
[jump target="*退魔"]

[elsif exp="f.Magic_set == 91"]
[jump target="*房中術体力吸収"]

[elsif exp="f.Magic_set == 92"]
[jump target="*房中術デバフ"]
[endif]

[jump target="*苦無術"]
[s]

*苦無術
#鈴猫
「乱れ苦無！！鳳仙花！！」[wt2]
#
鈴猫は無数の苦無を投げつけた[wt5]
[eval exp="f.BASE = 5 + f.Bonus_Honor"]
[call target="*ダメージ計算"]
[eval exp="f.Magic_set = 0"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*鎌鼬
;鋼線で敵を切り刻む。緑色３枚。
#鈴猫
「吹き荒れろ颶風！！鎌鼬！！」[wt5]
#
不可視の刃が周囲を切り刻んだ[wt5]
[eval exp="f.BASE = 8 + f.Bonus_Honor"]
[call target="*ダメージ計算"]
[eval exp="f.Magic_set = 0"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*火遁
;黄色３枚
#鈴猫
「燃え上がれ！！必殺・焔舞い！！」[wt5]
#
[wt5]
[eval exp="f.BASE = 10 + f.Bonus_Honor"]
[call target="*ダメージ計算"]
[eval exp="f.Magic_set = 0"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*退魔
;青色３枚。
#鈴猫
「破魔調伏！螺旋功！！」[wt5]
#
[eval exp="f.BASE = 5 + f.Bonus_Honor"]
[call target="*ダメージ計算"]
[eval exp="f.MP=0"]
[eval exp=" f.Magic_set = 0"]
[jump storage="battle.ks" target="*勝利判定"]
[s]

*房中術体力吸収
#
;敵の興奮度に応じて体力を回復[wt5]
[eval exp="f.damage = f.En_ERO * 5"]
鈴猫は敵の精力を吸収した。体力が[emb exp="f.damage"]回復[p]
[eval exp="f.HP += f.damage"]
[eval exp="f.Magic_set = 0"]
[return]
[s]

*房中術デバフ
#
;敵の判定値-3[wt5]
敵は鈴猫に精気を吸いつくされた。敵は不能状態に陥った（３ターン）[p]
[eval exp="f.En_Impotenz= 1 , f.Rt_En_Impotenz= 4"]
[eval exp="f.Magic_set = 0"]
[return]
[s]


忍術は先にベットを行い効果を発揮する。
バーストしたり、判定負けすると発動しない。
BJのダブルに相当。
