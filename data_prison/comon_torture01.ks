*start
[cm]
[bg storage="nc172885.jpg" time="100"]
#
人売りの調教により鈴猫の理性が減少した[p]
[eval exp="f.SAN -= 3"][eval exp="f.SAN = 0" cond="f.SAN < 0"]

鈴猫は人売りの調教により状態異常『被虐性癖』になった[p]
戦闘でダメージを受けるごとに快感が発生するようになります[r]
[eval exp="f.mazo = 1" ]
Homeに戻ります[p]
[eval exp="f.turn = 0"]
[call storage="routin/Rt_dairy.ks"]
[eval exp="f.HP = 1"]
[jump storage="home.ks" target="*home_start"]
