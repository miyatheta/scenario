*orgasm
#
鈴猫の理性が5減少した[p]
[eval exp="f.TempERO = f.ERO"]
[eval exp="f.ERO = 0 , f.SAN -= 5 , f.TempSAN += 5 , f.MND = 0"]
[eval exp="f.acme = 3"]
[eval exp="f.SAN = 0" cond="f.SAN < 0"]
[eval exp=" tf.argment = tf.fuck / 10"][getMathRound var="f.damage"]
[eval exp="f.HP -= f.damage"][eval exp="f.HP = 0" cond="f.HP < 0"]
鈴猫の体力が[emb exp="f.damage"]減少した[p]

[call storage="bochu/Rt_check_nasty.ks" cond="f.TempSAN >= 5"]

[return]
[s]

*endure
#
鈴猫の理性が1減少した[p]
[eval exp="f.ERO = 0 , f.SAN -= 1 , f.TempSAN += 1"]
[eval exp="f.SAN = 0" cond="f.SAN < 0"]
[return]
[s]
