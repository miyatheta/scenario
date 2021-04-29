*スキル選択
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="心眼(CT20)" exp="f.comand=3" target="*心眼"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" text="変り身(CT20)" exp="f.comand=4" target="*変り身"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" text="誘惑(CT10)" exp="f.comand=5" target="*誘惑"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" text="空蝉(CT10)" exp="f.comand=6" target="*空蝉"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="450" text="戻る" exp="f.comand=7" storage="&f.returnStr" target="&f.returnTag"]
[s]

*心眼
鈴猫は心眼を使用した[wt2]
[eval exp="f.shingan=1"]
[jump storage="&f.returnStr" target="&f.returnTag"]
[s]
*変り身
鈴猫は変り身の術を使った[wt2]
[jump storage="&f.returnStr" target="&f.returnTag"]
[s]
*誘惑
鈴猫は敵を誘惑した[wt2]
欲情した敵が鈴猫に抱きついてきた[p]
[jump storage="&f.returnStr" target="*バースト"]
[s]
*空蝉
鈴猫は空蝉の術を使った[wt2]
無敵１回が付与された[wt2]
[eval exp="f.invincible=1"]
[jump storage="&f.returnStr" target="&f.returnTag"]
[s]
