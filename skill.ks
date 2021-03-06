*スキル選択
[iscript]
f.skill0_ptxt = f.skill[0]['name'] + 'CT(' + f.skill[0]['cooltime'] + ')';
f.skill1_ptxt = f.skill[1]['name'] + 'CT(' +  f.skill[1]['cooltime'] + ')';
f.skill2_ptxt = f.skill[2]['name'] + 'CT(' +  f.skill[2]['cooltime'] + ')';
f.skill3_ptxt = f.skill[3]['name'] + 'CT(' +  f.skill[3]['cooltime'] + ')';
[endscript]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="&f.skill0_ptxt" target="*心眼"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" text="&f.skill1_ptxt" target="*变化"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" text="&f.skill2_ptxt" target="*誘惑"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" text="&f.skill3_ptxt" target="*空蝉"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="450" text="戻る" storage="battle.ks" target="&f.returnTag"]
[s]

*心眼
;手札を確認する
[if exp="f.skill[0]['cooltime'] > 0"]
現在、使用できません[wt5]
[jump target="*スキル選択"]
[endif]
鈴猫は心眼を使用した[wt5]
[eval exp="f.shingan=1 , f.skill[0]['cooltime'] = 15"]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*变化
;カード４枚を入れ替える
[if exp="f.skill[1]['cooltime'] > 0"]
現在、使用できません[wt5]
[jump target="*スキル選択"]
[endif]
鈴猫は变化の術を使った。衣装を修繕した[wt5]
[eval exp="f.dress=1"]
[call storage="As_face.ks"]
[chara_mod name="suzune" face="怒り" ]
[eval exp="f.skill[1]['cooltime'] = 15"]
[jump storage="battle.ks" target="&f.returnTag"]
[s]

*誘惑
[if exp="f.skill[2]['cooltime'] > 0"]
現在、使用できません[wt5]
[jump target="*スキル選択"]
[endif]
鈴猫は敵を誘惑した[wt5]
欲情した敵が鈴猫に抱きついてきた[p]
[eval exp="f.skill[2]['cooltime'] = 10"]
[jump storage="battle.ks" target="*バースト"]
[s]

*空蝉
[if exp="f.skill[3]['cooltime'] > 0"]
現在、使用できません[wt5]
[jump target="*スキル選択"]
[endif]
鈴猫は空蝉の術を使った[wt5]
無敵１回が付与された[wt5]
[eval exp="f.invincible=1 , f.skill[3]['cooltime'] = 20"]
[jump storage="battle.ks" target="&f.returnTag"]
[s]
