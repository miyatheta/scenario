*start
[freeimage layer="3"][freeimage layer="0"]
[chara_mod name="suzune" face="default" ]
[chara_show name="suzune" left="-100" top="-20"]
#鈴猫
「分かれ道ね・・・」[p]
「さて、どの道を行こうかしら?」[p]
#
*route選択1
[glink color="black" size="16" x="400" y="300" target="*routeA確認" text="街道をゆく"]
[glink color="black" size="16" x="400" y="350" target="*routeB確認" text="山道をゆく"]
[glink color="black" size="16" x="400" y="400" target="*routeC確認" text="港へゆく"]
[s]
*routeA確認
#
街道をゆくのは目立つかもしれないが、走りやすくはある。
獣や賊の心配も比較的少ないだろう[p]
出現する敵:人型×3[r]
ボス：催眠術師[l]
[glink x="400" y="300" text="この道をゆく" storage="routeA/stage1A.ks" target="*start" ]
[glink x="400" y="400" text="いいえ" target="*route選択1" ]
[s]

*routeB確認
#
木立の並ぶ林の中を突っ切る。多少は人目を偲ぶ効果はあるだろう。
ただし、獣はいるかもしれないが[p]
出現する敵:虫型×３[r]
ボス：蟲使い[l]
[glink x="400" y="300" text="この道をゆく" storage="routeB/stage1B.ks" target="*start" ]
[glink x="400" y="400" text="いいえ" target="*route選択1" ]
[s]

*routeC確認
#
海に出てしまえば追手も付いてこれないだろう[p]
出現する敵:獣型×3[r]
ボス：獣使い[l]
[glink x="400" y="300" text="この道をゆく" storage="routeC/stage1C.ks" target="*start" ]
[glink x="400" y="400" text="いいえ" target="*route選択1" ]
[s]
