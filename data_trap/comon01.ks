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
壁に空いた穴から矢が飛んできた！！[p]
直撃は避けたがかすめた傷口が痺れる[r]
どうやら毒矢のようだ[p]
毒状態になった[p]一時的に行動のたびにダメージを受ける[p]
[eval exp="f.poison = 5" ][eval exp="f.poison = 5" cond="f.poison > 5"]
[return]
