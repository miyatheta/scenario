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
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y font_color="0xffffff" text="&f.Cards[f.Hand[0]]['txt']" exp="f.Draw1=f.Hand[0],f.Cards[f.Hand[0]]['active']=0" target="&f.Path" ]
[endif]

[if exp="f.Cards[f.Hand[1]]['active']==0"]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y text="&f.Cards[f.Hand[1]]['txt']" exp="f.Draw =f.Hand[1],f.Cards[f.Hand[1]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[1]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y text="&f.Cards[f.Hand[1]]['txt']" exp="f.Draw =f.Hand[1],f.Cards[f.Hand[1]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[1],f.Cards[f.Hand[1]]['active']=0" target="&f.Path" ]
[endif]

[if exp="f.Cards[f.Hand[2]]['active']==0"]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y text="&f.Cards[f.Hand[2]]['txt']" exp="f.Draw =f.Hand[2],f.Cards[f.Hand[2]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[2]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y text="&f.Cards[f.Hand[2]]['txt']" exp="f.Draw =f.Hand[2],f.Cards[f.Hand[2]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[2],f.Cards[f.Hand[2]]['active']=0" target="&f.Path" ]
[endif]

[if exp="f.Cards[f.Hand[3]]['active']==0"]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y text="&f.Cards[f.Hand[3]]['txt']" exp="f.Draw =f.Hand[3],f.Cards[f.Hand[3]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[3]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y text="&f.Cards[f.Hand[3]]['txt']" exp="f.Draw =f.Hand[3],f.Cards[f.Hand[3]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[3],f.Cards[f.Hand[3]]['active']=0" target="&f.Path" ]
[endif]

[if  exp="f.Cards[f.Hand[4]]['active']==0"]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y text="&f.Cards[f.Hand[4]]['txt']" exp="f.Draw =f.Hand[4],f.Cards[f.Hand[4]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[4]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y text="&f.Cards[f.Hand[4]]['txt']" exp="f.Draw =f.Hand[4],f.Cards[f.Hand[4]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[4],f.Cards[f.Hand[4]]['active']=0" target="&f.Path" ]
[endif]
[glink color="red" size="18" x="0" y="450" text="スキル" exp="f.skillCase=1 , f.returnStr='battle.ks' , f.returnTag='*ドロー'" storage="skill.ks" target="*"]
[s]


;拘束された-------------------------------------------------------------------------------
*拘束開始
[DeActivate]
[reflesh_score]
[ReShuffle]
[eval exp="f.Bind = 200 ,f.Rt_Bind = 1"]
[show_score]
#鈴猫
この！離しなさいよ！！[p]
#

*拘束ラウンド開始
#
鈴猫は拘束されている[p]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < f.En_ERO"]
[eval exp="f.Rape_mode = 1"]
[endif]

[call storage="&f.enemy_PATH" target="*レイプ開始" cond="f.Rape_mode == 1"]
[eval exp="f.En_Hand1 = 10 , f.En_Hand2 = 7"]
[eval exp="f.En_Hand1 = 10 , f.En_Hand2 = 10" cond="f.Rape_mode > 0"]
[show_score]
;手札作成
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]"]
[iscript]
f.Deck.splice(0,5);
[endscript]


*拘束ドロー1
[eval exp="f.Draw = 0 , f.Down = 1 , f.Path = '*ドロー1完了' "]
[jump target="*ドロー"]
[s]
*ドロー1完了
[Calc_Card]
[eval exp="f.Total = 0 + f.Cards[f.Draw1]['value']"]
[eval exp="f.Draw1_txt = f.Cards[f.Draw1]['txt'] "]
[show_score]
*抵抗コマンド選択
コマンドを選択してください[p]
[if exp="f.Rape_mode > 0"]
[glink color="gray" x=&f.pos_Comand_btn_x1 y="500" text="耐える(3)" exp="f.comand = 3 ,f.comandId = 10" target="*目標設定" ]
[s][else]
[glink color="gray" x=&f.pos_Comand_btn_x1 y="400" text="もがく(5)" exp="f.comand = 5 ,f.comandId = 11" target="*目標設定" ]
[glink color="gray" x=&f.pos_Comand_btn_x1 y="450" text="暴れる(7)" exp="f.comand = 7 ,f.comandId = 12" target="*目標設定" ]
[glink color="gray" x=&f.pos_Comand_btn_x2 y="400" text="噛み付く(9)" exp="f.comand = 9 ,f.comandId = 13" target="*目標設定" ]
[glink color="gray" x=&f.pos_Comand_btn_x2 y="450" text="金的(11)" exp="f.comand = 11 ,f.comandId = 14" target="*目標設定" ]
[s][endif]
*目標設定
[eval exp="f.Target = f.En_Hand1 + f.En_Hand2" ]
[show_score]

*拘束ドロー2
[eval exp="f.Limit=21"][show_score]
[call storage="&f.enemy_PATH" target="*レイプ序" cond="f.Rape_mode == 1"]
[call storage="&f.enemy_PATH" target="*レイプ続" cond="f.Rape_mode > 1"]
２枚目のカードを選択してください[p]
[eval exp="f.Draw = 0 , f.Down = 2 , f.Path = '*拘束ドロー2完了' "]
[jump target="*ドロー"]
[s]
*拘束ドロー2完了
[eval exp="f.Draw2 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw2]['value']"]
[eval exp="f.Draw2_txt = f.Cards[f.Draw2]['txt'] "]
[show_score]
*拘束ドロー2判定
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
[call target="*判定成功"]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Total > f.Limit "]
[call target="*判定失敗"]
[jump target="*レイプフィニッシュ" cond="f.Rape_mode > 0"]
[jump target="*拘束バースト"]
[else]
[call target="*目標未達"]
[jump target="*猥雑対抗1" cond="f.Rape_mode > 0"]
[jump target="*抵抗行動1"]
[endif]
[s]
*抵抗行動1
[call target="*抵抗行動"]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*敵拘束攻撃1"]
[s]
*猥雑対抗1
[call target="*猥雑対抗"]
[jump target="*敵拘束攻撃1"]
[s]
*敵拘束攻撃1
[call storage="&f.enemy_PATH" target="*敵拘束攻撃1" cond="f.Rape_mode == 0"]
[call storage="&f.enemy_PATH" target="*レイプ本番" cond="f.Rape_mode > 0"]


*拘束ドロー3
３枚目のカードを選択してください[p]
[eval exp="f.Draw = 0 , f.Down = 3 , f.Path = '*拘束ドロー3完了' "]
[jump target="*ドロー"]
[s]
*拘束ドロー3完了
[eval exp="f.Draw3 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw3]['value']"]
[eval exp="f.Draw3_txt = f.Cards[f.Draw3]['txt'] "]
[show_score]
*拘束ドロー3判定
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
[call target="*判定成功"]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Total > f.Limit "]
[call target="*判定失敗"]
[jump target="*レイプフィニッシュ" cond="f.Rape_mode > 0"]
[jump target="*拘束バースト"]
[else]
[call target="*目標未達"]
[jump target="*猥雑対抗2" cond="f.Rape_mode > 0"]
[jump target="*抵抗行動2"]
[endif]
[s]
*抵抗行動2
[call target="*抵抗行動"]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*敵拘束攻撃2"]
[s]
*猥雑対抗2
[call target="*猥雑対抗"]
[jump target="*敵拘束攻撃2"]
[s]
*敵拘束攻撃2
[call storage="&f.enemy_PATH" target="*敵拘束攻撃2" cond="f.Rape_mode == 0"]
[call storage="&f.enemy_PATH" target="*レイプ本番" cond="f.Rape_mode > 0"]


*拘束ドロー5
５枚目のカードを選択してください[p]
[eval exp="f.Draw = 0 , f.Down = 5 , f.Path = '*拘束ドロー5完了' "]
[jump target="*ドロー"]
[s]
*拘束ドロー5完了
[eval exp="f.Draw5 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw5]['value']"]
[eval exp="f.Draw5_txt = f.Cards[f.Draw5]['txt'] "]
[show_score]
*拘束ドロー5判定
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
[call target="*判定成功"]
[jump target="*抵抗コマンド実行"]
[else]
[call target="*判定失敗"]
[jump target="*レイプフィニッシュ" cond="f.Rape_mode > 0"]
[jump target="*拘束バースト"]
[endif]
[s]

*抵抗コマンド実行
[if  exp="f.comandId == 10"]
[jump target="*抵抗コマンド０"]
[elsif exp="f.comandId == 11"]
[jump target="*抵抗コマンド1"]
[elsif exp="f.comandId == 12"]
[jump target="*抵抗コマンド2"]
[elsif exp="f.comandId == 13"]
[jump target="*抵抗コマンド3"]
[elsif exp="f.comandId == 14"]
[jump target="*抵抗コマンド4"]
[endif]
error697
[s]

;---------------------------
*判定成功
判定成功[p]
[return][s]
*判定失敗
判定失敗[p]
[return][s]
*目標未達
目標未達[p]
[return][s]
*抵抗行動
#
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.Bind -= 20"]
拘束力が20減少[p]
[show_score][update_status]
[return][s]
*猥雑対抗
#
鈴猫は快感に耐えるために身構えた[p]
[chara_mod name="suzune" face="怒り" cond="f.ERO >= 60 && f.orgasm == 0"]
[return][s]
;---------------------------
*抵抗コマンド０
鈴猫は快感に耐えるために身構えた[p]
[eval exp="f.ERO_DEF = 1"]
[call storage="&f.enemy_PATH" target="*レイプフィニッシュ" cond="f.Rape_mode > 0"]
[jump target="*拘束脱出" ]
[s]
*抵抗コマンド1
鈴猫はもがいた[p]
[eval exp="f.Bind -= 20 ,f.En_ERO -= 2"]
[eval exp="f.En_ERO = 0 " cond="f.En_ERO < 0"]
拘束力が20減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド2
鈴猫は暴れた[p]
[eval exp="f.Bind -= 80 ,f.En_ERO -= 4"]
[eval exp="f.En_ERO = 0 " cond="f.En_ERO < 0"]
拘束力が80減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド3
鈴猫は噛み付いた[p]
[eval exp="f.Bind -= 120 ,f.En_ERO -= 6"]
[eval exp="f.En_ERO = 0 " cond="f.En_ERO < 0"]
拘束力が120減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド4
鈴猫の金的[p]
[eval exp="f.Bind -= 180 ,f.En_ERO -= 9"]
[eval exp="f.En_ERO = 0 " cond="f.En_ERO < 0"]

拘束力が180減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]

*拘束バースト
[call storage="&f.enemy_PATH" target="*拘束バースト" cond="f.Rape_mode == 0"]
[jump target="*拘束ラウンド継続"]
[s]

*レイプフィニッシュ
[eval exp="f.ERO_DEF = 0"]
[call storage="&f.enemy_PATH" target="*レイプフィニッシュ" cond="f.Rape_mode > 0"]
[jump target="*拘束脱出" ]
[s]

*拘束脱出
鈴猫は自由を取り戻した！[p]
[eval exp="f.Rt_Bind = 0"]
[eval exp="f.Rape_mode = 0" cond="f.Rape_mode > 0"]
[ptext layer="3" x="450" y="50" text="" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Bind" overwrite="true"]
[jump storage="battle.ks" target="*ラウンド終了"]
[s]

*拘束ラウンド継続
今回、使用した札は[emb exp="f.Cards[f.Hand[0]]['txt']"]、
[emb exp="f.Cards[f.Hand[1]]['txt']"]、[emb exp="f.Cards[f.Hand[2]]['txt']"]、
[emb exp="f.Cards[f.Hand[3]]['txt']"]、[emb exp="f.Cards[f.Hand[4]]['txt']"]です[p]
[eval exp="f.En_ERO += 5 "]
[update_status]
[DeActivate]
[reflesh_score]
[ReShuffle]
[jump target="*拘束ラウンド開始"]
[s]
