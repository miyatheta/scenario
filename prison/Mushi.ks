*start
;分岐
[if exp="f.MushiKanLv > 2"]
[jump target="*Lv3"]
[elsif exp="f.MushiKanLv == 1"]
[jump target="*Lv2"]
[else]
[jump target="*Lv1"]
[endif]

*Lv1
蟲を植え付けられた鈴猫は状態異常「寄生蟲」になった[p]
花札が蟲札に変化、蟲札を引くと一時的に感度が大幅に上昇します[p]
[eval exp="f.Parasite = 1"]
[s]
*Lv2
蟲の卵を植え付けられた鈴猫は状態異常「孕腹」になった[p]
回避率が減少し、回避成功時に感度が一時的に上昇します[p]
[eval exp="f.Pregnant = 1"]
[s]
*Lv3
蟲が孵化したことで状態異常「孕腹」が解消した[p]
蟲を植え付けられた鈴猫は状態異常「蟲姫」になった[p]
気力の蓄積量に応じて感度が上昇します[p]
[p]
[eval exp="f.BugsQueen = 1"]
[s]
