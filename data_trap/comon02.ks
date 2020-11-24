*start
#
踏んだ床板から作動音がした[r]罠だ！！[p]
[glink color="black" target="*trap_01try" x="400" y="250" width="" height="" text="気力を使って回避に挑む" ]
[glink color="black" target="*trapped_01" x="400" y="350" width="" height="" text="おとなしく罠にかかる" ]
[s]

*trap_01try
[if exp="f.MP < 10"]
#
気力が足りない！！[p]
[jump target="*trapped_01"]
[endif]
;------------------------------------------------------------------------------
[eval exp="f.MP -= 10"][WSs]
[getrand min="1" max="100" var="f.rand"]

[if exp="f.rand > 50"]
鈴耶は罠を回避することに成功した！！[p]
[return]

[else]
鈴耶は罠を回避できなかった！！[p]
[endif]
;------------------------------------------------------------------------------

*trapped_01
天井から謎の液体が降り注いだ[p]
液体を浴びた服の繊維が崩れ落ちてゆく！！[r]
[eval exp="f.dress = 1" ][call storage="asset_face.ks"]
[chara_mod  name="suzune"  face="苦しみ"  ]
鈴耶は脱衣状態になった[p]
[return]
