*use_item
[glink color="red" target="*use_item" x="450" y="100" width="" height="" text="空" cond="f.inventory1 == null"]
[glink color="blue" target="*use_inventory1" x="450" y="100" width="" height="" text="&f.inventory1['name']" cond="f.inventory1 != null"]

[glink color="red" target="*use_item" x="450" y="180" width="" height="" text="空" cond="f.inventory2 == null"]
[glink color="blue" target="*use_inventory2" x="450" y="180" width="" height="" text="&f.inventory2['name']" cond="f.inventory2 != null"]

[glink color="red" target="*use_item" x="450" y="260" width="" height="" text="空" cond="f.inventory3 == null"]
[glink color="blue" target="*use_inventory3" x="450" y="260" width="" height="" text="&f.inventory3['name']" cond="f.inventory3 != null"]

[glink color="black" target="*exit_item" x="450" y="340" width="" height="" text="戻る" ]
[s]

*use_inventory1
[emb exp="f.inventory1['name']"]を使用した[p]
[eval exp="f.inventory1['used']=1"]
[iscript]
 f.tag_item = "*" + f.inventory1['name'];
 [endscript]
[call target="&f.tag_item"]
[eval exp="f.inventory1 = null"]
[return]
[s]

*use_inventory2
[emb exp="f.inventory2['name']"]を使用した[p]
[eval exp="f.inventory2['used']=1"]
[iscript]
f.tag_item = "*" + f.inventory2['name'];
[endscript]
[call target="&f.tag_item"]
[eval exp="f.inventory2 = null"]
[return]
[s]

*use_inventory3
[emb exp="f.inventory3['name']"]を使用した[p]
[eval exp="f.inventory3['used']=1"]
[iscript]
 f.tag_item = "*" + f.inventory3['name'];
 [endscript]
[call target="&f.tag_item"]
[eval exp="f.inventory3 = null"]
[return]
[s]

*exit_item
[return][s]

*治療薬
[eval exp="f.HP += 100"][eval exp="f.HP = 2000" cond="f.HP > 2000"]
鈴耶の体力が100回復した[p]
[WSs]
[return][s]

*万能薬
[eval exp="f.poison=0, f.slowly=0, f.excite=0, f.closed=0"]
鈴耶の状態異常が全て解消した[p]
[WSs]
[return][s]

*鎮静薬
[eval exp="f.ERO = 0"]
鈴耶の欲情が解消した[p]
[return][s]

*針子道具
[if exp="f.dress != 1"][eval exp="f.dress = 1"]
忍び装束を修繕した[p]
[else]
今は使う必要がない[p]
[endif]
[return][s]

*煙玉
[eval exp="f.MP += 30"][eval exp="f.MP = 100" cond="f.MP > 100"]
鈴耶の欲情が解消した[p]
[return][s]

*旅の御守
戦闘中に使うことはできない[p]
[return][s]

*理力の御守
戦闘中に使うことはできない[p]
[return][s]

*魔除の御守
戦闘中に使うことはできない[p]
[return][s]
