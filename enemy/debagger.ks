*エネミーデータ
[eval exp="f.En_HP = 2000 ,f.En_MP_gain =　20"]
[return][s]

*行動パターン
;敵の行動パターン選定
[eval exp="f.En_BURST = 0" cond="f.En_BURST > 0"]
[if exp="f.En_MP >= 100"]
[eval exp="f.En_BURST = 1"]
敵は力を溜めている[p]
[endif]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand<25"]
[eval exp="f.En_DEF = 15"]
[elsif exp="f.rand<50"]
[eval exp="f.En_DEF = 14"]
[elsif exp="f.rand<75"]
[eval exp="f.En_DEF = 13"]
[else]
[eval exp="f.En_DEF = 12"]
[endif]
[return][s]

*敵攻撃１
敵の攻撃！[p]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < (f.RES + f.Bonus_Green) - (f.orgasm * 30)"]
鈴猫は敵の攻撃を回避した[p]
[return]
[endif]

[if exp="f.En_DEF <= 11"]
[eval exp="f.HP -= 150"]
１5０のダメージを受けた[p]
[elsif exp="f.En_DEF <= 12"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
敵のスキル使用[r]
「守備体勢」[r]
敵の守備力が＋１された[p]
[eval exp="f.En_DEF += 1"]
[show_score]
[elsif exp="f.En_DEF <= 13"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
[else]
[eval exp="f.HP -= 50"]
５０のダメージを受けた[p]
[endif]
[update_status]
[return][s]

*敵攻撃２
敵の攻撃！[p]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < (f.RES + f.Bonus_Green) - (f.orgasm * 30)"]
鈴猫は敵の攻撃を回避した[p]
[return]
[endif]

[if exp="f.En_DEF <= 11"]
[eval exp="f.HP -= 150"][eval exp="f.En_MP += 10"]
１5０のダメージを受けた[p]
[elsif exp="f.En_DEF <= 12"]
[eval exp="f.HP -= 100"][eval exp="f.En_MP += 10"]
１００のダメージを受けた[p]
敵のスキル使用[r]
「守備体勢」[r]
敵の守備力が＋１された[p]
[eval exp="f.En_DEF += 1"]
[elsif exp="f.En_DEF <= 13"]
[eval exp="f.HP -= 100"][eval exp="f.En_MP += 10"]
１００のダメージを受けた[p]
[else]
[eval exp="f.HP -= 50"][eval exp="f.En_MP += 10"]
５０のダメージを受けた[p]
[endif]
[update_status]
[return][s]

*敵攻撃３
敵の攻撃！[p]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < (f.RES + f.Bonus_Green) - (f.orgasm * 30)"]
鈴猫は敵の攻撃を回避した[p]
[return]
[endif]

[if exp="f.En_DEF <= 11"]
[eval exp="f.HP -= 150"][eval exp="f.En_MP += 10"]
１5０のダメージを受けた[p]
[elsif exp="f.En_DEF <= 12"]
[eval exp="f.HP -= 100"][eval exp="f.En_MP += 10"]
１００のダメージを受けた[p]
敵のスキル使用[r]
「守備体勢」[r]
敵の守備力が＋１された[p]
[eval exp="f.En_DEF += 1"]
[elsif exp="f.En_DEF <= 13"]
[eval exp="f.HP -= 100"][eval exp="f.En_MP += 10"]
１００のダメージを受けた[p]
[else]
[eval exp="f.HP -= 50"][eval exp="f.En_MP += 10"]
５０のダメージを受けた[p]
[endif]
[update_status]
[return][s]

*バースト
敵の攻撃[r]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.En_BURST > 0"]
敵のチャージ攻撃[r]
[eval exp="f.HP -= 200"]
２００のダメージを受けた[p]
[update_status]
[else]
敵は鈴猫を拘束した[p]
[jump storage="battle/bind.ks" target="*拘束開始"]
[endif]
[jump target="*敗北" cond="f.HP <= 0"]
[return][s]

*敗北
鈴猫は敗北した[p]
[s]

;拘束----------------------------------------------------------------------------

*敵拘束攻撃１
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 90"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.ERO += 5" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 10"]
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
[return][s]

*敵拘束攻撃２
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 90"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.ERO += 5" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 10"]
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
[return][s]

*敵拘束攻撃３
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 90"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.ERO += 5" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 10"]
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
[return][s]

*拘束バースト
#敵
敵は鈴猫の秘所を弄った[p]
#鈴猫
いやぁっ！！[p]
#
鈴猫は２０の快感を受けた[p]
[eval exp="f.ERO += 20"][eval exp="f.ERO += 10" cond="f.orgasm > 0"]
[eval exp="f.En_ERO += 20"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
[return][s]

;レイプ----------------------------------------------------------------------
*レイプ開始
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
[return][s]

*レイプ序
#忍者
どうだ！俺のマラの感触は！！[p]
[chara_mod name="suzune" face="苦しみ"]
#鈴猫
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#忍者
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
#
[return][s]

*レイプ本番
忍者はしっかりと鈴猫の腰を抱え込むと激しく腰を打ち付けた[p]
[chara_mod name="suzune" face="喘ぎ"]
#忍者
オラオラ、オラァ！！[p]
#鈴猫
んっ！！こんな奴にぃ！！ううんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.ERO += 15" cond="f.orgasm > 0"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
[return][s]

*レイプフィニッシュ
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
[eval exp="f.En_MP = 0"]
[eval exp="f.ERO += 50"][eval exp="f.ERO += 25" cond="f.orgasm > 0"]
[jump target="*絶頂フィニッシュ" cond="f.ERO >= 100"]
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
[return]
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

;フィニッシュ----------------------------------------------------------------------
*絶頂フィニッシュ
[chara_mod name="suzune" face="絶頂"]
#鈴猫
いやあああっ！！らめぇぇぇぇっ！！[p]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴猫は絶頂した[r]
体力が100減少[p]
[eval exp="f.HP -= 100"]
[if exp="f.HP <= 0"][jump target="*気絶フィニッシュ"][endif]
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
[return][s]

*気絶フィニッシュ
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
