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
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < f.En_ERO"]
[eval exp="f.Rape_mode = 1"]
[eval exp="f.En_DEF = 16"]
[elsif exp="f.rand<33"]
[eval exp="f.En_DEF = 15"]
[elsif exp="f.rand<66"]
[eval exp="f.En_DEF = 14"]
[else]
[eval exp="f.En_DEF = 13"]
[endif]
[show_score]
[show_score]
;手札作成
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]"]
[iscript]
f.Deck.splice(0,5);
[endscript]
[call target="*レイプ１" cond="f.Rape_mode > 0"]

*拘束ドロー１
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y text="&f.Cards[f.Hand[0]]['txt']" exp="f.Draw1=f.Hand[0],f.Cards[f.Hand[0]]['active']=0" cond="f.Cards[f.Hand[0]]['active']>0" target="*抵抗コマンド選択" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー１" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー１" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー１" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー１" ]
[s]
*抵抗コマンド選択
[eval exp="f.Total = 0 + f.Cards[f.Draw1]['value']"]
[eval exp="f.Draw1_txt = f.Cards[f.Draw1]['txt'] "]
[show_score]
コマンドを選択してください[p]
[glink color="gray" x="550" y="350" text="暴れる(6)" exp="f.comand=6" target="*拘束ドロー２" ]
[glink color="gray" x="550" y="400" text="噛みつき(7)" exp="f.comand=7" target="*拘束ドロー２" ]
[glink color="gray" x="550" y="450" text="頭突(8)" exp="f.comand=8" target="*拘束ドロー２" ]
[glink color="gray" x="550" y="500" text="金的(9)" exp="f.comand=9" target="*拘束ドロー２" ]
[s]
*拘束ドロー２
[eval exp="f.Limit=21"][show_score]
[call target="*レイプ２" cond="f.Rape_mode > 0"]
２枚目のカードを選択してください[p]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw2=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw2=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw2=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw2=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー２完了" ]
[s]
*拘束ドロー２完了
[eval exp="f.Total = f.Total + f.Cards[f.Draw2]['value']"]
[eval exp="f.Draw2_txt = f.Cards[f.Draw2]['txt'] "]
[show_score]
*拘束判定１
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*拘束バースト"]
[else]
目標未達[p]
[jump target="*抵抗攻撃１"]
[endif]
[s]
*抵抗攻撃１
#
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.Bind -= 20"]
拘束力が20減少[r]
守備力が-１された[p]
[eval exp="f.En_DEF-- "]
[show_score][update_status]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[show_score]

*敵拘束攻撃１
[getrand min="1" max="100" var="f.rand"]
[if exp="f.Rape_mode > 0"]
[call target="*レイプ３"]
[elsif exp="f.rand < 60"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.ERO += 5" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 5"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[else]
#敵
暴れんじゃねえよ！[p]
#
敵の攻撃[r]
１０のダメージを受けた[p]
[eval exp="f.HP -= 10"]
[endif]
[update_status]

*敵拘束ドロー３
３枚目のカードを選択してください[p]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw3=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw3=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw3=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw3=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー３完了" ]
[s]
*拘束ドロー３完了
[eval exp="f.Total = f.Total + f.Cards[f.Draw3]['value']"]
[eval exp="f.Draw3_txt = f.Cards[f.Draw3]['txt'] "]
[show_score]
*拘束判定２
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*拘束バースト"]
[else]
目標未達[p]
[jump target="*抵抗攻撃２"]
[endif]
[s]
*抵抗攻撃２
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.Bind -= 20"]
拘束力が20減少[r]
守備力が-１された[p]
[eval exp="f.En_DEF-- "]
[show_score][update_status]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[show_score]

*敵拘束攻撃２
[getrand min="1" max="100" var="f.rand"]
[if exp="f.Rape_mode > 0"]
[call target="*レイプ３"]
[elsif exp="f.rand < 60"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.ERO += 5" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 5"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[else]
#敵
暴れんじゃねえよ！[p]
#
敵の攻撃[r]
１０のダメージを受けた[p]
[eval exp="f.HP -= 10"]
[endif]
[update_status]

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
*拘束判定３
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*拘束バースト"]
[else]
目標未達[p]
[jump target="*抵抗攻撃３"]
[endif]
[s]
*抵抗攻撃３
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.Bind -= 20"]
拘束力が20減少[r]
守備力が-１された[p]
[eval exp="f.En_DEF-- "]
[show_score][update_status]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[show_score]

*敵拘束攻撃３
[getrand min="1" max="100" var="f.rand"]
[if exp="f.Rape_mode > 0"]
[call target="*レイプ３"]
[elsif exp="f.rand < 60"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.ERO += 5" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 5"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[else]
#敵
暴れんじゃねえよ！！[p]
#
敵の攻撃[r]
１０のダメージを受けた[p]
[eval exp="f.HP -= 10"]
[endif]
[update_status]

*抵抗ドロー５
５枚目のカードを選択してください[p]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw5=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw5=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw5=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw5=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*抵抗ドロー５完了" ]
[s]
*抵抗ドロー５完了
[eval exp="f.Total = f.Total + f.Cards[f.Draw5]['value']"]
[eval exp="f.Draw5_txt = f.Cards[f.Draw5]['txt'] "]
[show_score]
*拘束判定４
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[else]
判定失敗[p]
[jump target="*拘束バースト"]
[endif]
[s]
*抵抗コマンド実行
[if exp="f.comand == 6"]
[jump target="*抵抗コマンド６"]
[elsif exp="f.comand == 7"]
[jump target="*抵抗コマンド７"]
[elsif exp="f.comand == 8"]
[jump target="*抵抗コマンド８"]
[elsif exp="f.comand == 9"]
[jump target="*抵抗コマンド９"]
[endif]
error697
[s]

*抵抗コマンド６
鈴猫は暴れた[p]
[eval exp="f.Bind -= 40 ,f.En_ERO -= 2"]
拘束力が40減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド７
鈴猫は噛み付いた[p]
[eval exp="f.Bind -= 80 ,f.En_ERO -= 4"]
拘束力が80減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド８
鈴猫の頭突き[p]
[eval exp="f.Bind -= 120 ,f.En_ERO -= 6"]
拘束力が120減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド９
鈴猫の金的[p]
[eval exp="f.Bind -= 200 ,f.En_ERO -= 8"]
拘束力が200減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]

*拘束脱出
鈴猫は自由を取り戻した！[p]
[eval exp="f.Rt_Bind = 0"]
[eval exp="f.Rape_mode = 0" cond="f.Rape_mode > 0"]
[ptext layer="3" x="450" y="50" text="" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Bind" overwrite="true"]
[jump target="*ラウンド終了"]
[s]

*拘束バースト
[if exp="f.Rape_mode > 0"]
[jump target="*レイプ４"]
[endif]
#敵
敵は鈴猫の秘所を弄った[p]
#鈴猫
いやぁっ！！[p]
#
鈴猫は２０の快感を受けた[p]
[eval exp="f.ERO += 20"][eval exp="f.ERO += 10" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 5"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
[jump target="*拘束ラウンド継続"]
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

;レイプ----------------------------------------------------------------------
*レイプ１
#敵
もう！我慢できねえぜ！！[r]
このまま本番に行かせてもらうぜ！！[p]
#鈴猫
ちょっ！！やめーーーーーー[p]
#
忍者はマラを鈴猫の秘裂に挿入した[p]
[chara_mod name="suzune" face="泣き"]
#鈴猫
（ーーーーーーーッ！！）[p]
[chara_mod name="suzune" face="苦しみ"]
[return]

*レイプ２
#忍者
どうだ！俺のマラの感触は！！[p]
[chara_mod name="suzune" face="苦しみ"]
#鈴猫
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#忍者
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
#
[return]
[s]

*レイプ３
忍者はしっかりと鈴猫の腰を抱え込むと激しく腰を打ち付けた[p]
[chara_mod name="suzune" face="喘ぎ"]
#忍者
オラオラ、オラァ！！[p]
#鈴猫
んっ！！こんな奴にぃ！！ううんっ！！[p]
#
鈴猫は３０の快感を受けた[p]
[eval exp="f.ERO += 30"][eval exp="f.ERO += 15" cond="f.orgasm > 0"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
[return]
[s]

*レイプ４
#
忍者は魔羅で鈴猫の膣を荒々しく突き上げた[p]
[chara_mod name="suzune" face="喘ぎ"]
#鈴猫
あんっ！！あんっ！！ひあっ！！[p]
#忍者
へへっ！！いい声で鳴くようになってきたじゃねえか！！[p]
#鈴猫
う、うるさっ！！ひぃぃん！！！[p]
#忍者
よしっ！！このまま中でぶちまけてやるぜ！！[p]
#鈴猫
！！やめろぉっ！！ばかぁ！！んうううっ！！[p]
#忍者
うおおおおおっ！！出すぞ！！[p]
#
忍者は鈴猫の中で射精した[p]
[chara_mod name="suzune" face="泣き"]
#鈴猫
いやあああああっ！！！[p]
#
鈴猫は精の迸りを子宮に感じながら嬌声を上げた[r]
#
鈴猫は５０の快感を受けた[p]
[eval exp="f.ERO += 50"][eval exp="f.ERO += 25" cond="f.orgasm > 0"]
[jump target="*絶頂フェイタル" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
#忍者
へへへ、なかなか良かったぜ[p]
#
忍者は嫌らしく笑いながらマラを引き抜くと鈴猫の尻を叩いた[p]
#鈴猫
ああんっ！！[p]
#
その場にくずおれた鈴猫の秘裂からごぽりと精液が溢れた[p]
[chara_mod name="suzune" face="厳しい"]
#鈴猫
くっ！絶対許さないんだから！！[p]
#
鈴猫はよろよろと立ち上がると敵を睨みつけた[p]
[jump target="*拘束脱出"]
[s]
;絶頂----------------------------------------------------------------------
*絶頂
[chara_mod name="suzune" face="絶頂"]
#鈴猫
いやあああっ！！らめぇぇぇぇっ！！[p]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴猫は絶頂した[r]
体力が50減少[p]
[eval exp="f.HP -= 50"]
[eval exp="f.HP = 1" cond="f.HP <= 0"]
絶頂状態になった[r]
理性が１減少した[p]
[eval exp="f.SAN -= 1 , f.orgasm = 1 , f.Rt_orgasm = 2 , f.ERO = 0"]
[chara_mod name="suzune" face="レイプ目"]
[return]
[s]

;フェイタル----------------------------------------------------------------------
*絶頂フェイタル
[chara_mod name="suzune" face="絶頂"]
#鈴猫
いやあああっ！！らめぇぇぇぇっ！！[p]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴猫は絶頂した[r]
体力が100減少[p]
[eval exp="f.HP -= 100"]
[if exp="f.HP <= 0"][jump target="*気絶フェイタル"][endif]
絶頂状態になった[r]
理性が１減少した[p]
[eval exp="f.SAN -= 1 , f.orgasm = 1 , f.Rt_orgasm = 2 , f.ERO = 0"]
[chara_mod name="suzune" face="レイプ目"]
#忍者
へへへ、なかなか良かったぜ[p]
#
忍者は嫌らしく笑いながらマラを引き抜くと鈴猫の尻を叩いた[p]
#鈴猫
ああんっ！！[p]
#
その場にくずおれた鈴猫の秘裂からごぽりと精液が溢れた[p]
#鈴猫
んっ！このぉ……ぜったい、ゆるさないんらからぁっ！[p]
#
鈴猫はよろよろと立ち上がると敵を睨みつけた[p]
[jump target="*拘束脱出"]
[s]

*気絶フェイタル
[chara_mod name="suzune" face="レイプ目"]
[eval exp="f.bind = 0"]
#
鈴猫は気絶した！[p]
#忍者
へへへ、なかなか良かったぜ[p]
#
忍者は白目を剥いて痙攣する鈴猫からマラを引き抜いた[p]
#鈴猫
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴猫はその場に崩折れる[r]
どろりと鈴猫の秘裂から精液がこぼれた[p]
#忍者
このままヤリ捨てるのは勿体ねえ上玉だな[r]
ねぐらまでお持ち帰りさせてもらおうか！！[p]
#
忍者はニヤリとほくそ笑むと鈴猫を担ぎ上げて意気揚々と闇の中へ消えていった[p]
ゲームオーバー（実際には忍者の住処へ続きます）
[s]
