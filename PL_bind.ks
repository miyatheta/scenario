*start
[if exp="f.Quest_type == 3"][call storage="routin/Rt_progress.ks" target="*guard"][endif]
[if exp="f.Quest_type == 4"][call storage="routin/Rt_progress.ks" target="*trace"][endif]
[eval exp="f.endure = 0 , f.rapture = 0"]
;-------------------------------------------------------------------------------

*PL_comand_select
[glink color="black" target="*PL_resist1" x="450" y="100" width="" height="" text="もがく" ]
[glink color="black" target="*PL_resist2" x="450" y="200" width="" height="" text="暴れる" ]
[glink color="black" target="*PL_bochu" x="450" y="300" width="" height="" text="房中術" ]
[glink color="black" target="*PL_endure" x="450" y="400" width="" height="" text="耐える" ]
[s]

*PL_resist1
[if exp="f.HP <= 1"]
体力が足りない！！[p]
[jump target="*PL_comand_select"]
[endif]
鈴耶は敵から逃れようともがいた[p]
[getrand min="5" max="10" var="f.damage"]
[eval exp="f.damage = f.HP - 1" cond="f.HP <= f.damage"]
[eval exp="f.HP = f.HP - f.damage - 5"]
鈴耶の体力が[emb exp="f.damage"]減少[p][WSs]
・・・・・・・・・・・・・・・[p]
[eval exp="f.bind -= f.damage"]
[getrand min="10" max="100" var="f.rand"][TESTER]
[if exp="f.bind < f.rand"]
鈴耶は敵の拘束を振りほどいた！！[p]
[eval exp="f.bind = 0"]
[return]
[else]
しかし、敵の拘束は解けない！[p]
[return]
[endif]
[s]

*PL_resist2
[if exp="f.HP <= 1"]
体力が足りない！！[p]
[jump target="*PL_comand_select"]
[endif]
鈴耶は敵から逃れようともがいた[p]
[getrand min="20" max="30" var="f.damage"]
[eval exp="f.damage = f.HP - 1" cond="f.HP <= f.damage"]
[eval exp="f.HP -= f.damage"]
鈴耶の体力が[emb exp="f.damage"]減少[p][WSs]
・・・・・・・・・・・・・・・[p]
[eval exp="f.bind -= f.damage"]
[getrand min="20" max="100" var="f.rand"][TESTER]
[if exp="f.bind < f.rand"]
鈴耶は敵の拘束を振りほどいた！！[p]
[eval exp="f.bind = 0"]
[return]
[else]
しかし、敵の拘束は解けない！[p]
[return]
[endif]
[s]

*PL_bochu
鈴耶の房中術[p]
[eval exp="f.rapture = 1"]
[return]
[s]

*PL_endure
[if exp="f.MP < 20"]
気力が足りない[p]
[jump target="*PL_comand_select"]
[endif]
鈴耶は快感に備えて気を引き締めた[p]
[eval exp="f.endure = 1 , f.MP -= 20"][WSs]
[return]
[s]
