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
[eval exp="f.HP = 2000 , f.MP = 0 , f.SAN = 60 , f.orgasm = 0 , f.dress = 1"]
[eval exp="f.shingan = 0 , f.invincible = 0"]
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
[call storage="tutorial.ks" target="*ドローボーナスについて" cond="f.tutorial01 != 1"]
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

;１回目のみ
;選択後
;未選択、心眼使用
;通常
*ドロー
[if exp="f.Cards[f.Hand[0]]['active']==0"]
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y text="&f.Cards[f.Hand[0]]['txt']" exp="f.Draw =f.Hand[0],f.Cards[f.Hand[0]]['active']=0" target="*ドロー" ]
[else]
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y text="&f.Cards[f.Hand[0]]['txt']" exp="f.Draw1=f.Hand[0],f.Cards[f.Hand[0]]['active']=0" target="&f.Path" ]
[endif]

[if exp="f.Down == 1"]
[glink color="black"                         size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[1],f.Cards[f.Hand[1]]['active']=1" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[1]]['active']==0"]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y text="&f.Cards[f.Hand[1]]['txt']" exp="f.Draw =f.Hand[1],f.Cards[f.Hand[1]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[1]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y text="&f.Cards[f.Hand[1]]['txt']" exp="f.Draw =f.Hand[1],f.Cards[f.Hand[1]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[1],f.Cards[f.Hand[1]]['active']=0" target="&f.Path" ]
[endif]

[if exp="f.Down == 1"]
[glink color="black"                        size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[2],f.Cards[f.Hand[2]]['active']=1" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[2]]['active']==0"]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y text="&f.Cards[f.Hand[2]]['txt']" exp="f.Draw =f.Hand[2],f.Cards[f.Hand[2]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[2]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y text="&f.Cards[f.Hand[2]]['txt']" exp="f.Draw =f.Hand[2],f.Cards[f.Hand[2]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[2],f.Cards[f.Hand[2]]['active']=0" target="&f.Path" ]
[endif]

[if exp="f.Down == 1"]
[glink color="black"                        size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[3],f.Cards[f.Hand[3]]['active']=1" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[3]]['active']==0"]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y text="&f.Cards[f.Hand[3]]['txt']" exp="f.Draw =f.Hand[3],f.Cards[f.Hand[3]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[3]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y text="&f.Cards[f.Hand[3]]['txt']" exp="f.Draw =f.Hand[3],f.Cards[f.Hand[3]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[3],f.Cards[f.Hand[3]]['active']=0" target="&f.Path" ]
[endif]

[if exp="f.Down == 1"]
[glink color="black"                        size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[4],f.Cards[f.Hand[4]]['active']=1" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[4]]['active']==0"]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y text="&f.Cards[f.Hand[4]]['txt']" exp="f.Draw =f.Hand[4],f.Cards[f.Hand[4]]['active']=0" target="*ドロー" ]
[elsif exp="f.Cards[f.Hand[4]]['active']> 0 && f.shingan>0"]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y text="&f.Cards[f.Hand[4]]['txt']" exp="f.Draw =f.Hand[4],f.Cards[f.Hand[4]]['active']=0" target="&f.Path" ]
[else]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y text=""                           exp="f.Draw =f.Hand[4],f.Cards[f.Hand[4]]['active']=0" target="&f.Path" ]
[endif]
[glink color="red" size="18" x="0" y="450" text="スキル" exp="f.skillCase=1 , f.returnStr='battle.ks' , f.returnTag='*ドロー'" storage="skill.ks" target="*"]
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
[jump storage="&f.enemy_PASS"  target="&f.Path"]
[endif]
[s]

*攻撃
鈴猫の攻撃[wt2]
[eval exp="f.damage = (f.ATP + f.ATP_red) - (f.orgasm * 30)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[show_score][update_status]
[return][s]

*反撃
反撃[wt2]
[eval exp="f.damage = (f.ATP + f.ATP_red) - (f.orgasm * 30)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[show_score][update_status]
[return][s]

[macro name="skillButton"]
[button folder="image/button" graphic="skill.png" storage="skill.ks" width="50" height="50" x="0" y="300" fix="true" ]
[endmacro]
;--------------------------------------------------------------------------------
*ラウンド開始
[eval exp="f.round++"]
[eval exp="f.Limit=21"]
[show_score][update_status]

*敵パターン抽選
;敵の守備力が表示されます[p]
[call storage="&f.enemy_PASS" target="*行動パターン" ]
[show_score]
;手札作成
[make_hand]

*カード配布
;１枚目のカードが表示されます[wt2]
[glink color="rosy" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y text="手札配布" target="*ドロー1" ]
[s]
*ドロー1
[eval exp="f.Draw = 0 , f.Down = 1 , f.Path = '*ドロー1完了' "]
[jump target="*ドロー"]
*ドロー1完了
[Calc_Card]
[eval exp="f.Total = 0 + f.Cards[f.Draw1]['value']"]
[eval exp="f.Draw1_txt = f.Cards[f.Draw1]['txt'] "]
[show_score][update_status]
*ドロー1ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw1]['color']"][call target="*ドローボーナス"]
[call storage="tutorial.ks" target="*目標値について" cond="f.tutorial02 != 1"]
*コマンド選択
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="疾風の構え(7)" exp="f.comand=7" target="*目標設定"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" text="流水の構え(8)" exp="f.comand=8" target="*目標設定"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" text="円月の構え(9)" exp="f.comand=9" target="*目標設定"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" text="火影の構え(10)" exp="f.comand=10" target="*目標設定"]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="450" text="紫電の構え(11)" exp="f.comand=11" target="*目標設定"]
[glink color="red" size="18" x="0" y="450" text="スキル" exp="f.skillCase=1 , f.returnStr='battle.ks' , f.returnTag='*コマンド選択'" storage="skill.ks" target="*"]
[s]
*目標設定
[if exp="21 < f.En_DEF + f.comand"]
コストオーバーです。コマンドを再選択してください[p]
[jump target="*コマンド選択"]
[endif]
[eval exp="f.Target = f.En_DEF + f.comand" ]
[show_score]

*ドロー2
;２枚目のカードを選択してください[l]
[eval exp="f.Draw = 0 , f.Down = 2 , f.Path = '*ドロー2完了' "]
[jump target="*ドロー"]
*ドロー2完了
[call storage="tutorial.ks" target="*ドローについて" cond="f.tutorial03 != 1"]
[eval exp="f.Draw2 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw2]['value']"]
[eval exp="f.Draw2_txt = f.Cards[f.Draw2]['txt'] "]
[show_score]
*ドロー2ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw2]['color']"]
[call target="*ドローボーナス"]
*ドロー2判定
[call storage="tutorial.ks" target="*判定について" cond="f.tutorial04 != 1"]
[eval exp="f.Path = '*敵行動' "]
[jump target="*ドロー判定"]

*ドロー3
;３枚目のカードを選択してください[l]
[eval exp="f.Draw = 0 , f.Down = 3 , f.Path = '*ドロー3完了' "]
[jump target="*ドロー"]
*ドロー3完了
[eval exp="f.Draw3 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw3]['value']"]
[eval exp="f.Draw3_txt = f.Cards[f.Draw3]['txt'] "]
[show_score]
*ドロー3ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw3]['color']"]
[call target="*ドローボーナス"]
*ドロー3判定
[eval exp="f.Path = '*敵行動' "]
[jump target="*ドロー判定"]

*ドロー4
;４枚目のカードを選択してください[l]
[eval exp="f.Draw = 0 , f.Down = 4 , f.Path = '*ドロー4完了' "]
[jump target="*ドロー"]
*ドロー4完了
[eval exp="f.Draw4 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw4]['value']"]
[eval exp="f.Draw4_txt = f.Cards[f.Draw4]['txt'] "]
[show_score]
*ドロー4ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw4]['color']"]
[call target="*ドローボーナス"]
*ドロー4判定
[eval exp="f.Path = '*敵行動' "]
[jump target="*ドロー判定"]

*ドロー5
;５枚目のカードを選択してください[p]
[eval exp="f.Draw = 0 , f.Down = 5 , f.Path = '*ドロー5完了' "]
[jump target="*ドロー"]
*ドロー5完了
[eval exp="f.Draw5 = f.Draw"]
[eval exp="f.Total = f.Total + f.Cards[f.Draw5]['value']"]
[eval exp="f.Draw5_txt = f.Cards[f.Draw5]['txt'] "]
[show_score]
*ドロー5ボーナス
[eval exp="f.drawColor = f.Cards[f.Draw5]['color']"]
[call target="*ドローボーナス"]
*ドロー5判定
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[wt2]
[jump target="*コマンド実行"]
[else]
判定失敗[wt2]
[jump target="*バースト"]
[endif]
[s]

*コマンド実行
[if exp="f.comand == 7"]
[jump target="*コマンド1"]
[elsif exp="f.comand == 8"]
[jump target="*コマンド2"]
[elsif exp="f.comand == 9"]
[jump target="*コマンド3"]
[elsif exp="f.comand == 10"]
[jump target="*コマンド4"]
[elsif exp="f.comand == 11"]
[jump target="*コマンド5"]
[endif]
[s]

;----------------------------------
*ダメージ計算
[eval exp="f.damage = f.BASE * (f.ATP + f.ATP_red) - (f.orgasm * 50) "]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた。[p]
[return][s]


*コマンド1
鈴猫の攻撃[wt2]
#鈴猫
疾風迅雷！！付いてこれるかしら！？[wt2]
#
[eval exp="f.BASE = 2"]
[call target="*ダメージ計算"]
[update_status]
[jump target="*勝利" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド2
鈴猫の攻撃[wt2]
#鈴猫
流水行雲。捉えてみなさい！[wt2]
#
[eval exp="f.BASE = 4"]
[call target="*ダメージ計算"]
[update_status]
[jump target="*勝利" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド3
鈴猫の攻撃[wt2]
#鈴猫
食らいなさい！円月殺法！！[wt2]
#
[eval exp="f.BASE = 6"]
[call target="*ダメージ計算"]
[update_status]
[jump target="*勝利" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド4
鈴猫の攻撃[wt2]
#鈴猫
星火燎原！！いっくわよーー！！[wt2]
[eval exp="f.BASE = 8"]
[call target="*ダメージ計算"]
[update_status]
[jump target="*勝利" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド5
鈴猫の攻撃[wt2]
#鈴猫
これで決める！雷轟閃電！！！[wt2]
#
[eval exp="f.BASE = 10"]
[call target="*ダメージ計算"]
[update_status]
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
[jump target="&f.returnTag"]
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

*バースト
[jump storage="&f.enemy_PASS" target="*バースト"]
[s]

*ラウンド終了
今回、使用した札は[emb exp="f.Cards[f.Hand[0]]['txt']"]、
[emb exp="f.Cards[f.Hand[1]]['txt']"]、[emb exp="f.Cards[f.Hand[2]]['txt']"]、
[emb exp="f.Cards[f.Hand[3]]['txt']"]、[emb exp="f.Cards[f.Hand[4]]['txt']"]です[p]
[eval exp="f.shingan=0"]
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
[DeActivate]
[reflesh_score]
[ReShuffle]
[jump target="*ラウンド開始"]
[s]

*勝利
敵を倒した[p]
[s]
