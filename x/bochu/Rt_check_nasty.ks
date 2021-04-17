*orgasm
#
絶頂による狂気判定[p]
;理性、快感総量、最後の快感ダメージ、淫気蓄積量から算出
[getrand min="&tf.fuck" max="&f.TempERO" var="f.rand"]
[eval exp="f.TAG = (f.SAN * 15 )"]
[eval exp="f.TAG = f.TAG * 2" cond="f.endure > 0"]
目標値[emb exp="f.TAG"](目標値以下で成功)[r]
出目「[emb exp="f.rand"]」[p]

[if exp="f.TAG >= f.rand"]
判定成功[p]
[else]

判定失敗[p]
鈴猫は状態異常『淫乱』になった[p]
[chara_mod name="suzune" face="レイプ目"]
[eval exp="f.nasty = 1"]
[WSs]
[endif]
;判定したらリセット
[eval exp="f.TempSAN = 0"]

[return]
[s]
