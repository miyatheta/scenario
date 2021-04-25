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

[call storage="&f.enemy_PASS" target="*レイプ開始" cond="f.Rape_mode > 0"]
[eval exp="f.En_DEF = 17"]
[show_score]
;手札作成
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]"]
[iscript]
f.Deck.splice(0,5);
[endscript]


*拘束ドロー１
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y text="&f.Cards[f.Hand[0]]['txt']" exp="f.Draw1=f.Hand[0],f.Cards[f.Hand[0]]['active']=0" cond="f.Cards[f.Hand[0]]['active']>0" target="*抵抗コマンド選択" ]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー１" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー１" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー１" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー１" ]
[s]
*抵抗コマンド選択
[eval exp="f.Total = 0 + f.Cards[f.Draw1]['value']"]
[eval exp="f.Draw1_txt = f.Cards[f.Draw1]['txt'] "]
[show_score]
コマンドを選択してください[p]
[if exp="f.Rape_mode > 0"]
[glink color="gray" x="550" y="500" text="耐える(3)" exp="f.comand = 1" target="*目標設定" ]
[s][else]
[glink color="gray" x="550" y="350" text="耐える(３)" exp="f.comand = 1" target="*目標設定" ]
[glink color="gray" x="550" y="400" text="暴れる(6)" exp="f.comand = 2" target="*目標設定" ]
[glink color="gray" x="550" y="450" text="噛みつき(8)" exp="f.comand = 3" target="*目標設定" ]
[glink color="gray" x="550" y="500" text="金的(10)" exp="f.comand = 4" target="*目標設定" ]
[s][endif]

*目標設定
[eval exp="f.Target = f.En_DEF + f.comand" ]
[show_score]

*拘束ドロー２
[eval exp="f.Limit=21"][show_score]
[call storage="&f.enemy_PASS" target="*レイプ序" cond="f.Rape_mode > 0"]
２枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw2=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw2=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw2=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw2=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー２完了" ]
[s]
*拘束ドロー２完了
[eval exp="f.Total = f.Total + f.Cards[f.Draw2]['value']"]
[eval exp="f.Draw2_txt = f.Cards[f.Draw2]['txt'] "]
[show_score]
*抵抗判定１
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*拘束バースト"]
[else]
目標未達[p]
[jump target="*猥雑耐久１" cond="f.Rape_mode > 0"]
[jump target="*抵抗行動１"]
[endif]
[s]
*抵抗行動１
#
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.Bind -= 20"]
拘束力が20減少[r]
守備力が-１された[p]
[eval exp="f.En_DEF-- "]
[show_score][update_status]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[show_score]
[jump target="*敵拘束攻撃１"]
[s]
*猥雑耐久１
#
鈴猫は快感に耐えるために身構えた[p]
[chara_mod name="suzune" face="怒り" cond="f.ERO >= 60 && f.orgasm == 0"]
[eval exp="f.ERO_DEF = 1"]
[jump target="*敵拘束攻撃１"]
[s]

*敵拘束攻撃１
[call storage="&f.enemy_PASS" target="*敵拘束攻撃１" cond="f.Rape_mode == 0"]
[call storage="&f.enemy_PASS" target="*レイプ本番" cond="f.Rape_mode > 0"]

*拘束ドロー３
３枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw3=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw3=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw3=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw3=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー３完了" ]
[s]
*拘束ドロー３完了
[eval exp="f.Total = f.Total + f.Cards[f.Draw3]['value']"]
[eval exp="f.Draw3_txt = f.Cards[f.Draw3]['txt'] "]
[show_score]
*抵抗判定２
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*拘束バースト"]
[else]
目標未達[p]
[jump target="*猥雑耐久２" cond="f.Rape_mode > 0"]
[jump target="*抵抗行動２"]
[endif]
[s]
*抵抗行動２
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.Bind -= 20"]
拘束力が20減少[r]
守備力が-１された[p]
[eval exp="f.En_DEF-- "]
[show_score][update_status]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[show_score]
[jump target="*敵拘束攻撃２"]
[s]
*猥雑耐久２
#
鈴猫は快感に耐えるために身構えた[p]
[chara_mod name="suzune" face="怒り" cond="f.ERO >= 60 && f.orgasm == 0"]
[eval exp="f.ERO_DEF = 1"]
[jump target="*敵拘束攻撃２"]
[s]

*敵拘束攻撃２
[call storage="&f.enemy_PASS" target="*敵拘束攻撃２" cond="f.Rape_mode == 0"]
[call storage="&f.enemy_PASS" target="*レイプ本番" cond="f.Rape_mode > 0"]

*拘束ドロー４
４枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw4=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー４完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw4=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー４完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw4=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー４完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw4=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー４完了" ]
[s]
*拘束ドロー４完了
[eval exp="f.Total = f.Total + f.Cards[f.Draw4]['value']"]
[eval exp="f.Draw4_txt = f.Cards[f.Draw4]['txt'] "]
[show_score]
*抵抗判定３
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*拘束バースト"]
[else]
目標未達[p]
[jump target="*猥雑耐久３" cond="f.Rape_mode > 0"]
[jump target="*抵抗行動３"]
[endif]
[s]
*抵抗行動３
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.Bind -= 20"]
拘束力が20減少[r]
守備力が-１された[p]
[eval exp="f.En_DEF-- "]
[show_score][update_status]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[show_score]
[jump target="*敵拘束攻撃３"]
[s]
*猥雑耐久３
#
鈴猫は快感に耐えるために身構えた[p]
[chara_mod name="suzune" face="怒り" cond="f.ERO >= 60 && f.orgasm == 0"]
[eval exp="f.ERO_DEF = 1"]
[jump target="*敵拘束攻撃３"]
[s]

*敵拘束攻撃３
[call storage="&f.enemy_PASS" target="*敵拘束攻撃３" cond="f.Rape_mode == 0"]
[call storage="&f.enemy_PASS" target="*レイプ本番" cond="f.Rape_mode > 0"]

*抵抗ドロー５
５枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw5=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw5=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw5=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw5=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*抵抗ドロー５完了" ]
[s]
*抵抗ドロー５完了
[eval exp="f.Total = f.Total + f.Cards[f.Draw5]['value']"]
[eval exp="f.Draw5_txt = f.Cards[f.Draw5]['txt'] "]
[show_score]
*抵抗判定４
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[else]
判定失敗[p]
[jump target="*拘束バースト"]
[endif]
[s]
*抵抗コマンド実行
[if exp="f.comand == 1"]
[jump target="*抵抗コマンド１"]
[elsif exp="f.comand == 2"]
[jump target="*抵抗コマンド２"]
[elsif exp="f.comand == 3"]
[jump target="*抵抗コマンド３"]
[elsif exp="f.comand == 4"]
[jump target="*抵抗コマンド４"]
[endif]
error697
[s]
;---------------------------
*抵抗コマンド１
鈴猫は暴れた[p]
[eval exp="f.Bind -= 40 ,f.En_ERO -= 2"]
拘束力が40減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド２
鈴猫は噛み付いた[p]
[eval exp="f.Bind -= 80 ,f.En_ERO -= 4"]
拘束力が80減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド３
鈴猫の頭突き[p]
[eval exp="f.Bind -= 120 ,f.En_ERO -= 6"]
拘束力が120減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド４
鈴猫の金的[p]
[eval exp="f.Bind -= 200 ,f.En_ERO -= 8"]
拘束力が200減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]

*拘束バースト
[call storage="&f.enemy_PASS" target="*拘束バースト" cond="f.Rape_mode == 0"]
[call storage="&f.enemy_PASS" target="*レイプフィニッシュ" cond="f.Rape_mode > 0"]
[jump target="*拘束脱出" cond="f.Rape_mode > 0"]
[jump target="*拘束ラウンド継続"]
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
[DeActivate]
[reflesh_score]
[ReShuffle]
[jump target="*拘束ラウンド開始"]
[s]
