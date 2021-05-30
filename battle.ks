;メッセージウィンドウの表示
@layopt layer=message0 visible=true
@layopt layer=2 visible=true
@layopt layer=3 visible=true

;UI配置
;UIのx、yに関する変数を一括制御するためのもの(いちいち置換するのがめんどい）
;数値が共通(xかyが揃っている)のもの限定
[eval exp="f.pos_Card_y = 390 ,f.pos_Card_x1 = 400 ,f.pos_Card_x2 = 500 ,f.pos_Card_x3 = 600 ,f.pos_Card_x4 = 700 ,f.pos_Card_x5 = 800 "]
[eval exp="f.pos_Comand_btn_x1 = 400 , f.pos_Comand_btn_x2 = 600 "]

#
戦闘開始[wt2]
[eval exp="f.comand='' ,f.Target='' ,f.Limit='' ,f.Total='' ,f.Bind = 0 ,f.Rt_Bind = 0"]
[eval exp="f.Draw1_txt='' ,f.Draw2_txt='' ,f.Draw3_txt='' ,f.Draw4_txt='' ,f.Draw5_txt=''"]
[eval exp="f.HP = 2000 , f.MP = 0 , f.BP = 0 , f.SAN = 60 , f.orgasm = 0 , f.dress = 1"]
[eval exp="f.critical = 1"]
[eval exp="f.shingan = 0 , f.invincible = 0 ,f.Guard = 1 , f.Pary = 0"]
[eval exp="f.skill1_CT = 0 , f.skill2_CT = 0 , f.skill3_CT = 0 , f.skill4_CT = 0"]
[eval exp="f.Magic_set = 0"]
[eval exp="f.ATP = 50 , f.Bonus_Red = 0 , f.RES = 40 , f.Bonus_Green = 0 ,f.DEF_Yellow = 0"]
[eval exp="f.Red = 0 , f.Blue = 0 , f.Green = 0 , f.Orange = 0"]

[eval exp="f.ERO_DEF = 0"]
[eval exp="f.En_DEF ='' ,f.En_MP = 0 ,f.En_ERO = 0 ,f.Rape_mode = 0 ,f.En_BURST = 0"]
[eval exp="f.round=0 , f.Rt_Bind = 0"]
[call storage="&f.enemy_PASS" target="*エネミーデータ" ]

;カード構築
[Initialize_Cards]
;初回シャッフル
[DeckShuffle]

[jump target="*ラウンド開始"]
;サブルーチン-----------------------------------------------------------------------
*ドローボーナス
[call storage="tutorial.ks" target="*ドローボーナスについて" cond="f.tutorial01 != 1"]
[if exp="f.drawColor == 'red' "]
武：武芸レベル＋１[wt5]
[eval exp="f.Bonus_Red += 1"]
[elsif exp="f.drawColor == 'blue' "]
術：気力＋１０[wt5]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[elsif exp="f.drawColor == 'green' "]
感：回避＋１[wt5]
[eval exp="f.Bonus_Green += 1"]
[elsif exp="f.drawColor == 'orange' "]
技：技能クールタイム-１[wt5]
;技能クールのための処理
[iscript]
var n = f.skill.length;
for(i=0 ; i<n ; i++){
  if(f.skill[i]['cooltime'] > 0){
    f.skill[i]['cooltime'] -= 1;
  }
}
[endscript]
[else]
[endif]
[show_score][update_status]
[return][s]

;１回目のみ
;選択後
;未選択、心眼使用
;通常
*ドロー
[if exp="f.Cards[f.Hand[0]]['active']==0"]
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y font_color="0x696969" text="&f.Cards[f.Hand[0]]['txt']" exp="f.Draw =f.Hand[0],f.Cards[f.Hand[0]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[0]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y font_color="0xffffff" text="&f.Cards[f.Hand[0]]['txt']" exp="f.Draw =f.Hand[0],f.Cards[f.Hand[0]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y font_color="0xffffff" text=""                           exp="f.Draw =f.Hand[0],f.Cards[f.Hand[0]]['active']=0" target="&f.Path" ]
[endif]

[if exp="f.Cards[f.Hand[1]]['active']==0"]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y font_color="0x696969" text="&f.Cards[f.Hand[1]]['txt']" exp="f.Draw =f.Hand[1],f.Cards[f.Hand[1]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[1]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y font_color="0xffffff" text="&f.Cards[f.Hand[1]]['txt']" exp="f.Draw =f.Hand[1],f.Cards[f.Hand[1]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y font_color="0xffffff" text=""                           exp="f.Draw =f.Hand[1],f.Cards[f.Hand[1]]['active']=0" target="&f.Path" ]
[endif]

[if exp="f.Cards[f.Hand[2]]['active']==0"]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y font_color="0x696969" text="&f.Cards[f.Hand[2]]['txt']" exp="f.Draw =f.Hand[2],f.Cards[f.Hand[2]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[2]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y font_color="0xffffff" text="&f.Cards[f.Hand[2]]['txt']" exp="f.Draw =f.Hand[2],f.Cards[f.Hand[2]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y font_color="0xffffff" text=""                           exp="f.Draw =f.Hand[2],f.Cards[f.Hand[2]]['active']=0" target="&f.Path" ]
[endif]

[if exp="f.Cards[f.Hand[3]]['active']==0"]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y font_color="0x696969" text="&f.Cards[f.Hand[3]]['txt']" exp="f.Draw =f.Hand[3],f.Cards[f.Hand[3]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[3]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y font_color="0xffffff" text="&f.Cards[f.Hand[3]]['txt']" exp="f.Draw =f.Hand[3],f.Cards[f.Hand[3]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y font_color="0xffffff" text=""                           exp="f.Draw =f.Hand[3],f.Cards[f.Hand[3]]['active']=0" target="&f.Path" ]
[endif]

[if exp="f.Cards[f.Hand[4]]['active']==0"]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y font_color="0x696969" text="&f.Cards[f.Hand[4]]['txt']" exp="f.Draw =f.Hand[4],f.Cards[f.Hand[4]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[4]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y font_color="0xffffff" text="&f.Cards[f.Hand[4]]['txt']" exp="f.Draw =f.Hand[4],f.Cards[f.Hand[4]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y font_color="0xffffff" text=""                           exp="f.Draw =f.Hand[4],f.Cards[f.Hand[4]]['active']=0" target="&f.Path" ]
[endif]
[s]

*防御
#
鈴猫は守りを固めた[wt5]
[eval exp="f.Guard = 2"]
[jump target="*判定失敗"]
[s]

*反撃
反撃[wt2]
[eval exp="f.damage = (f.ATP) - (f.orgasm * 30)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のを与えた[p]
[show_score][update_status]
[return][s]

*ダメージ計算
[if exp="f.Total == 21"]
[eval exp="f.critical = 1.5" ]
会心の一撃[r]
[endif]
[getrand min="1" max="10" var="f.rand"]
[eval exp="tf.argment = f.BASE * (f.ATP) - (f.orgasm * 50) * f.critical + f.rand"]
[getMathRound var="f.damage"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた。[p]
[return][s]

;--------------------------------------------------------------------------------

*ラウンド開始
[eval exp="f.round++"]
[eval exp="f.Limit=21"]
[show_score][update_status]

*敵パターン抽選
;敵のヘッドが表示されます[p]
[if exp="f.Rape_mode > 0"]
[call storage="&f.enemy_PASS" target="*レイプ時ハンド抽選"]
[elsif exp="f.Rt_Bind > 0 "]
[call storage="&f.enemy_PASS" target="*拘束時ハンド抽選"]
[else]
[call storage="&f.enemy_PASS" target="*通常時ハンド抽選" ]
[endif]
[show_score]
;手札作成
[make_hand]

*カード配布
;１枚目のカードが表示されます[wt2]
[glink color="rosy" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y text="手札配布" target="*ドロー1" ]
[s]

*ドロー1
[eval exp="f.Draw = 0 , f.Down = 1 , f.Path = '*ドロー1完了'"][jump target="*ドロー"]
*ドロー1完了
[eval exp="f.Draw1 = f.Draw"]
[eval exp="f.Total = 0 + f.Cards[f.Draw1]['value']"]
[eval exp="f.Draw1_txt = f.Cards[f.Draw1]['txt'] "]
[show_score][update_status]
;*バースト判定1(バーストはない)
*ドロー1ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw1]['color']"]
[call target="*ドローボーナス" cond="f.Bind < 1"]
[call storage="tutorial.ks" target="*目標値について" cond="f.tutorial02 != 1"]
;*敵行動1（敵は行動しない）
;*敵行動1完了
*ドロー1コマンド
[glink color="red" size="18" x="0" y="450" text="スキル" exp="f.skillCase=1 , f.returnStr='battle.ks' , f.returnTag='*ドロー'" storage="skill.ks" target="*スキル選択"]

[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="格闘(ヒット)"    exp="" cond="f.Bind < 1" target="*ドロー2"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="抵抗する(ヒット)"    exp="" cond="f.Bind > 0" target="*ドロー2"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" text="技能(スキル)"    exp="f.returnTag = '*ドロー1コマンド'"  storage="skill.ks" target="*スキル選択"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" text="忍術(ベット)"    exp="" cond="f.Down == 1 || f.Magick_set!=1" storage="magick.ks" target="*忍術選択"]
;[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" text="勝負(オープン)"  exp="" cond="f.Total > 12" target="*ハンド判定"]
;[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="450" text="防御(フォールド)"   exp="" cond="f.Total >= 13 && f.Total <= 16" target="*防御"]
[s]

*ドロー2
[eval exp="f.Draw = 0 , f.Down = 2 , f.Path = '*ドロー2完了' "][jump target="*ドロー"]
*ドロー2完了
[call storage="tutorial.ks" target="*ドローについて" cond="f.tutorial03 != 1"]
[eval exp="f.Draw2 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw2]['value']"]
[eval exp="f.Draw2_txt = f.Cards[f.Draw2]['txt'] "]
[iscript]
if(f.Total > 21 && f.Cards[f.Draw2]['value']==11){
  f.Total -= 10;
  f.Draw2_txt = f.Cards[f.Draw2]['Ace']
}
[endscript]
[show_score]
;*バースト判定2(バーストはない絶対２１以下の為)
*ドロー2ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw2]['color']"]
[call target="*ドローボーナス" cond="f.Bind < 1"]
;敵の２枚目も開示
;[eval exp="f.Target = f.En_Hand1 + f.En_Hand2" ]
;[show_score]
[if exp="f.Total == 21"]
先手必勝[wt5]
[jump target="*ハンド判定"]
[endif]
*敵行動2
[jump storage="&f.enemy_PASS" target="*敵行動分岐"]
*敵行動2完了
*ドロー2コマンド
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="練気(ヒット)"    exp="" cond="f.Down < 5" target="*ドロー3"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" text="技能(スキル)"     exp="f.returnTag = '*ドロー2コマンド'"  storage="skill.ks" target="*スキル選択"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" text="忍術(ベット)"     exp="" cond="f.Down == 1" storage="magick.ks" target="*忍術選択"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" text="勝負(オープン)"  exp="" cond="f.Total > f.Target" target="*ハンド判定"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="450" text="防御(フォールド)"   exp="" cond="f.Total <= f.En_Hand1" target="*防御"]
[s]

*ドロー3
;３枚目のカードを選択してください[l]
[eval exp="f.Draw = 0 , f.Down = 3 , f.Path = '*ドロー3完了' "][jump target="*ドロー"]
*ドロー3完了
[eval exp="f.Draw3 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw3]['value']"]
[eval exp="f.Draw3_txt = f.Cards[f.Draw3]['txt'] "]
[iscript]
if(f.Total > 21 && f.Cards[f.Draw3]['value']==11){
  f.Total -= 10;
  f.Draw3_txt = f.Cards[f.Draw3]['Ace']
}else if(f.Total > 21 && f.Cards[f.Draw2]['value']==11){
  f.Total -= 10;
  f.Draw2_txt = f.Cards[f.Draw2]['Ace']
}else if(f.Total > 21 && f.Cards[f.Draw1]['value']==11){
  f.Total -= 10;
  f.Draw1_txt = f.Cards[f.Draw1]['Ace']
}
[endscript]
[show_score]
*バースト判定3
[jump target="*バースト" cond="f.Total > f.Limit "]
*ドロー3ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw3]['color']"]
[call target="*ドローボーナス" cond="f.Bind < 1"]
[show_score]
;*敵行動3(行動しない)
;*敵行動3完了
;*ドロー3コマンド(自動的に判定へ)
*ドロー3判定
[jump target="*ハンド判定"]
[s]

*バースト
#
バースト[wt2]
[jump storage="&f.enemy_PASS" target="*レイプフィニッシュ" cond="f.Rape_mode > 0"]
[jump storage="&f.enemy_PASS" target="*バーストセクハラ攻撃" cond="f.Rt_Bind > 0"]
;ここでレイプシーンを分岐させるのもあり？
[jump storage="&f.enemy_PASS" target="*拘束開始"]
[s]

*ハンド判定
;敵の２枚目も開示
[eval exp="f.Target = f.En_Hand1 + f.En_Hand2" ]
[show_score]
勝負あり[wt5]
[emb exp="f.Total"]対[emb exp="f.Target"][p]
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[wt2]
;武芸選択
[jump target="*判定成功"]
[else]
判定失敗[wt2]
[jump target="*判定失敗"]
[endif]
[s]

*判定成功
[jump storage="magick.ks" target="*忍術判定" cond="f.Magic_set > 0"]
[if exp="f.Rape_mode > 0"]
[jump storage="&f.enemy_PASS" target="*レイプ脱出判定"]

[elsif exp="f.Rt_Bind > 0"]
[jump storage="&f.enemy_PASS" target="*拘束脱出判定"]

[else]
[jump storage="MartialArts.ks" target="*武芸判定"]
[endif]
[s]

*判定失敗
[if exp="f.Rape_mode > 0"]
[jump storage="&f.enemy_PASS" target="*レイプフィニッシュ"]

[elsif exp="f.Rt_Bind > 0"]
[jump storage="&f.enemy_PASS" target="*バーストセクハラ攻撃"]

[else]
[jump storage="&f.enemy_PASS" target="*敵攻撃"]
[endif]
[s]

*勝利判定
[jump target="*勝利" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]


;---------------------------------------------
*空蝉発動
#
;敵の攻撃演出後
#鈴猫
空蝉の術！[wt2]
#
鈴猫は敵の攻撃を回避した[wt2]
鈴猫は装束を失った[wt2]
[eval exp="f.dress=2 , f.invincible=0"]
[call storage="As_face.ks"]
[chara_mod name="suzune" face="厳しい" ]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*空蝉発動拘束時
#
;敵の攻撃演出後
#鈴猫
空蝉の術！[wt2]
#
鈴猫は敵の掴みを回避した[wt2]
鈴猫は装束を失った[wt2]
[eval exp="f.dress=2 , f.invincible=0"]
[call storage="As_face.ks"]
[chara_mod name="suzune" face="厳しい" ]
[jump target="*ラウンド終了"]
[s]

;---------------------------------------------

*ラウンド終了
今回、使用した札は[emb exp="f.Cards[f.Hand[0]]['txt']"]、
[emb exp="f.Cards[f.Hand[1]]['txt']"]、[emb exp="f.Cards[f.Hand[2]]['txt']"]、
[emb exp="f.Cards[f.Hand[3]]['txt']"]、[emb exp="f.Cards[f.Hand[4]]['txt']"]です[p]
[eval exp="f.shingan=0 , f.Pary = 0"]
[if exp="f.Rt_orgasm ==1"]
[eval exp="f.Rt_orgasm = 0 , f.orgasm = 0"]
[chara_mod name="suzune" face="怒り" cond="f.ERO < 70"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 70"]
[elsif exp="f.Rt_orgasm ==2"]
[eval exp="f.Rt_orgasm--"]
[endif]
[eval exp="f.En_MP += f.En_MP_gain"]
[eval exp="f.En_MP = 0" cond="f.En_BURST > 0"]
[eval exp="f.En_ATP_Plus = 0, f.En_DFP_Plus = 0 , f.En_DEX_Plus = 0 "]
[eval exp="f.critical = 1 , f.Guard = 1"]
[eval exp="f.Red = 0 , f.Blue = 0 , f.Green = 0 , f.Orange = 0"]
[eval exp="f.Magic_set = 0 "]
[DeActivate]
[reflesh_score]
[ReShuffle]
[jump target="*ラウンド開始"]
[s]

*勝利
敵を倒した[p]
[s]
