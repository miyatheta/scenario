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
[eval exp="f.HP = 2000 , f.MP = 0 , f.SAN = 60 , f.orgasm = 0"]
[eval exp="f.ATP = 50 , f.ATP_red = 0 , f.RES = 40 , f.RES_green = 0 ,f.DEF_Yellow = 0"]
[eval exp="f.ERO_DEF = 0"]
[eval exp="f.En_DEF ='' ,f.En_MP = 0 ,f.En_ERO = 0 ,f.Rape_mode = 0 ,f.En_BURST = 0"]
[eval exp="f.round=0"]
[call storage="&f.enemy_PASS" target="*エネミーデータ" ]

;カード構築
[Initialize_Cards]
;初回シャッフル
[DeckShuffle]

[jump target="*ラウンド開始"]
;サブルーチン-----------------------------------------------------------------------
*ドローボーナス
[call storage="tutorial.ks" target="*ドローボーナス" cond="f.tutorial01 != 1"]
[if exp="f.drawColor == 'red' "]
攻撃力アップ[wt2]
[eval exp="f.ATP_red += 10"]
[elsif exp="f.drawColor == 'blue' "]
気力アップ[wt2]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[elsif exp="f.drawColor == 'green' "]
回避アップ[wt2]
[eval exp="f.RES_green += 40"]
[elsif exp="f.drawColor == 'orange' "]
守備力ダウン[wt2]
[eval exp="f.En_DEF -= 1 , f.Target -= 1"]
[else]
[endif]
[show_score][update_status]
[return][s]

*ドロー
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw =f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="&f.Path" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw =f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="&f.Path" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw =f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="&f.Path" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw =f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="&f.Path" ]
[s]

*ドロー判定
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*バースト"]
[else]
目標未達[p]
[jump storage="&f.enemy_PASS" target="&f.Path"]
[endif]
[s]

*反撃
反撃[wt2]
[eval exp="f.damage = (f.ATP + f.ATP_red) - (f.orgasm * 30)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[show_score][update_status]
[return][s]
;--------------------------------------------------------------------------------
*ラウンド開始
[eval exp="f.round++"]
[eval exp="f.Limit=21"]

[show_score][update_status]

*敵パターン抽選
敵の守備力が表示されます[p]
[call storage="&f.enemy_PASS" target="*行動パターン" ]

[show_score]
;手札作成
[make_hand]

*ドロー１
１枚目のカードが表示されます[wt2]
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y text="&f.Cards[f.Hand[0]]['txt']" exp="f.Draw1=f.Hand[0],f.Cards[f.Hand[0]]['active']=0" cond="f.Cards[f.Hand[0]]['active']>0" target="*ドロー１完了" ]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y cond="f.Cards[f.Hand[1]]['active']>0" target="*ドロー１" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y cond="f.Cards[f.Hand[2]]['active']>0" target="*ドロー１" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y cond="f.Cards[f.Hand[3]]['active']>0" target="*ドロー１" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y cond="f.Cards[f.Hand[4]]['active']>0" target="*ドロー１" ]
[s]
*ドロー１完了
[eval exp="f.Total = 0 + f.Cards[f.Draw1]['value']"]
[eval exp="f.Draw1_txt = f.Cards[f.Draw1]['txt'] "]
[show_score][update_status]
*ドロー１ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw1]['color']"][call target="*ドローボーナス"]
[call storage="tutorial.ks" target="*目標値" cond="f.tutorial02 != 1"]
*コマンド選択
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="拳(3)" exp="f.comand=3" target="*目標設定"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" text="下段蹴り(4)" exp="f.comand=4" target="*目標設定"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" text="回し蹴り(5)" exp="f.comand=5" target="*目標設定"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" text="踵落とし(6)" exp="f.comand=6" target="*目標設定"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="450" text="飛び蹴り(7)" exp="f.comand=7" target="*目標設定"]
[s]
*目標設定
[if exp="21 < f.En_DEF + f.comand"]
コストオーバーです。コマンドを再選択してください[p]
[jump target="*コマンド選択"]
[endif]
[eval exp="f.Target = f.En_DEF + f.comand" ]
[show_score]

*ドロー２
２枚目のカードを選択してください[l]
[eval exp="f.Draw = 0 , f.Path = '*ドロー２完了' "]
[jump target="*ドロー"]
*ドロー２完了
[call storage="tutorial.ks" target="*ドロー２" cond="f.tutorial03 != 1"]
[eval exp="f.Draw2 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw2]['value']"]
[eval exp="f.Draw2_txt = f.Cards[f.Draw2]['txt'] "]
[show_score]
*ドロー２ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw2]['color']"]
[call target="*ドローボーナス"]
*ドロー２判定
[call storage="tutorial.ks" target="*判定１" cond="f.tutorial04 != 1"]
[eval exp="f.Path = '*敵攻撃１' "]
[jump target="*ドロー判定"]
*反撃１
[call storage="tutorial.ks" target="*反撃１" cond="f.tutorial05 != 1"]
[call target="*反撃"]
[jump target="*勝利" cond="f.En_HP <= 0"]

*ドロー３
３枚目のカードを選択してください[l]
[eval exp="f.Draw = 0 , f.Path = '*ドロー３完了' "]
[jump target="*ドロー"]
*ドロー３完了
[call storage="tutorial.ks" target="*ドロー３" cond="f.tutorial06 != 1"]
[eval exp="f.Draw3 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw3]['value']"]
[eval exp="f.Draw3_txt = f.Cards[f.Draw3]['txt'] "]
[show_score]
*ドロー３ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw3]['color']"]
[call target="*ドローボーナス"]
*ドロー３判定
[eval exp="f.Path = '*敵攻撃２' "]
[jump target="*ドロー判定"]
*反撃２
[call target="*反撃"]
[jump target="*勝利" cond="f.En_HP <= 0"]

*ドロー４
４枚目のカードを選択してください[l]
[eval exp="f.Draw = 0 , f.Path = '*ドロー４完了' "]
[jump target="*ドロー"]
*ドロー４完了
[call storage="tutorial.ks" target="*ドロー４" cond="f.tutorial07 != 1"]
[eval exp="f.Draw4 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw4]['value']"]
[eval exp="f.Draw4_txt = f.Cards[f.Draw4]['txt'] "]
[show_score]
*ドロー４ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw4]['color']"]
[call target="*ドローボーナス"]
*ドロー４判定
[eval exp="f.Path = '*敵攻撃３' "]
[jump target="*ドロー判定"]
*反撃３
[call target="*反撃"]
[jump target="*勝利" cond="f.En_HP <= 0"]

*ドロー５
５枚目のカードを選択してください[p]
[eval exp="f.Draw = 0 , f.Path = '*ドロー４完了' "]
[jump target="*ドロー"]
*ドロー５完了
[call storage="tutorial.ks" target="*ドロー５" cond="f.tutorial08 != 1"]
[eval exp="f.Draw5 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw5]['value']"]
[eval exp="f.Draw5_txt = f.Cards[f.Draw5]['txt'] "]
[show_score]
*ドロー５ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw5]['color']"]
[call target="*ドローボーナス"]
*ドロー５判定
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*コマンド実行"]
[else]
判定失敗[p]
[jump target="*バースト"]
[endif]
[s]

*コマンド実行
[if exp="f.comand == 3"]
[jump target="*コマンド３"]
[elsif exp="f.comand == 4"]
[jump target="*コマンド４"]
[elsif exp="f.comand == 5"]
[jump target="*コマンド５"]
[elsif exp="f.comand == 6"]
[jump target="*コマンド６"]
[elsif exp="f.comand == 7"]
[jump target="*コマンド７"]
[endif]
[s]

;----------------------------------
*コマンド３
鈴猫の拳[r]
[eval exp="f.damage = (2 * f.ATP + f.ATP_red) - (f.orgasm * 50)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[jump target="*勝利" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド４
鈴猫の下段蹴り[r]
[eval exp="f.damage = (4 * f.ATP + f.ATP_red) - (f.orgasm * 100)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[jump target="*勝利" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド５
鈴猫の回し蹴り[r]
[eval exp="f.damage = (6 * f.ATP + f.ATP_red) - (f.orgasm * 150)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[jump target="*勝利" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド６
鈴猫の踵落とし[r]
[eval exp="f.damage =  (8 * f.ATP + f.ATP_red) - (f.orgasm * 200)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[jump target="*勝利" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド７
鈴猫の飛び蹴り[r]
[eval exp="f.damage = (10 * f.ATP + f.ATP_red) - (f.orgasm * 250)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[jump target="*勝利" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]

*バースト
[call storage="&f.enemy_PASS" target="*バースト"]
[jump target="*ラウンド終了"]
[s]

*ラウンド終了
今回、使用した札は[emb exp="f.Cards[f.Hand[0]]['txt']"]、
[emb exp="f.Cards[f.Hand[1]]['txt']"]、[emb exp="f.Cards[f.Hand[2]]['txt']"]、
[emb exp="f.Cards[f.Hand[3]]['txt']"]、[emb exp="f.Cards[f.Hand[4]]['txt']"]です[p]
[if exp="f.Rt_orgasm ==1"]
[eval exp="f.Rt_orgasm = 0 , f.orgasm = 0"]
[chara_mod name="suzune" face="怒り" cond="f.ERO < 70"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 70"]
[elsif exp="f.Rt_orgasm ==2"]
[eval exp="f.Rt_orgasm--"]
[endif]
[eval exp="f.En_MP += f.En_MP_gain"]
[eval exp="f.En_MP = 0" cond="f.En_BURST > 0"]
[DeActivate]
[reflesh_score]
[ReShuffle]
[jump target="*ラウンド開始"]
[s]

*勝利
敵を倒した[p]
[s]
