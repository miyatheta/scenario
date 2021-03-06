*start
[if exp="f.Quest_type == 3"][call storage="routin/Rt_progress.ks" target="*guard"][endif]
[if exp="f.Quest_type == 4"][call storage="routin/Rt_progress.ks" target="*trace"][endif]
[eval exp="f.endure = 0 , f.rapture = 0"]
[eval exp="f.orgasm = 0"]
[call storage="asset/As_face.ks" target="*battle"]

*PL_comand_select
[glink color="black" target="*PL_resist1" x="450" y="100" width="" height="" text="もがく" ]
[glink color="black" target="*PL_resist2" x="450" y="190" width="" height="" text="暴れる" ]
[glink color="black" target="*PL_endure" x="450" y="280" width="" height="" text="耐え忍ぶ" ]
[glink color="black" target="*PL_onanie" x="450" y="370" width="" height="" text="身を委ねる" ]
[s]

;-------------------------------------------------------------------------------
*fase4
[if exp="f.Quest_type == 3"][call storage="routin/Rt_progress.ks" target="*guard"][endif]
[if exp="f.Quest_type == 4"][call storage="routin/Rt_progress.ks" target="*trace"][endif]
[eval exp="f.endure = 0 , f.rapture = 0"]
[eval exp="f.orgasm = 0"]
[call storage="asset/As_face.ks" target="*battle"]

*PL_comand_select4
[glink color="black" target="*PL_resist1" x="450" y="100" width="" height="" text="もがく" ]
[glink color="black" target="*PL_resist2" x="450" y="190" width="" height="" text="暴れる" ]
[glink color="black" target="*PL_endure" x="450" y="280" width="" height="" text="耐え忍ぶ" ]
[glink color="black" target="*PL_onanie" x="450" y="370" width="" height="" text="身を委ねる" ]
[glink color="black" target="*PL_bochu" x="450" y="460" width="" height="" text="房中術(要MP50)" ]
[s]

;-------------------------------------------------------------------------------

*PL_resist1
[if exp="f.HP <= 10"]
体力が足りない！！[p]
[jump target="*PL_comand_select"]
[endif]
鈴猫は敵から逃れようともがいた[p]
[getrand min="5" max="10" var="f.damage"]
[eval exp="f.damage = f.HP - 1" cond="f.HP <= f.damage"]
[eval exp="f.HP = f.HP - f.damage - 5"]
鈴猫の体力が[emb exp="f.damage"]減少[p][WSs]
・・・・・・・・・・・・・・・[p]
[eval exp="f.bind -= f.damage"]
[getrand min="10" max="100" var="f.rand"][TESTER]
[if exp="f.bind < f.rand"]
鈴猫は敵の拘束を振りほどいた！！[p]
[eval exp="f.bind = 0"]
[return]
[else]
しかし、敵の拘束は解けない！[p]
[return]
[endif]
[s]

*PL_resist2
[if exp="f.acme > 0"]
絶頂により力が出ない[p]
[jump target="*PL_comand_select"]
[endif]
[if exp="f.HP <= 30"]
体力が足りない！！[p]
[jump target="*PL_comand_select"]
[endif]
鈴猫は敵から逃れようともがいた[p]
[getrand min="20" max="30" var="f.damage"]
[eval exp="f.damage = f.HP - 1" cond="f.HP <= f.damage"]
[eval exp="f.HP -= f.damage"]
鈴猫の体力が[emb exp="f.damage"]減少[p][WSs]
・・・・・・・・・・・・・・・[p]
[eval exp="f.bind -= f.damage"]
[getrand min="20" max="100" var="f.rand"][TESTER]
[if exp="f.bind < f.rand"]
鈴猫は敵の拘束を振りほどいた！！[p]
[eval exp="f.bind = 0"]
[return]
[else]
しかし、敵の拘束は解けない！[p]
[return]
[endif]
[s]

*PL_endure
鈴猫は快感に備えて気を引き締めた[p]
[eval exp="f.endure = 1"]
[eval exp="f.MP += 5" ][eval exp="f.MP = 100" cond="f.MP > 100"]
[WSs]
[return]
[s]

*PL_onanie
[eval exp="f.onanie=1"]
[return]
[s]

*PL_bochu
[if exp="f.MP <= 50"]
気力が足りない！！[p]
[jump target="*PL_comand_select"]
[endif]
鈴猫の房中術[p]
[eval exp="f.rapture = 1"]
[return]
[s]
