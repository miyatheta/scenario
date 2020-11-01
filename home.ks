*home_start
[cm]
[bg storage="syosai1-1080.jpg" time="100"]
[chara_show  name="suzune"  left="-70" top="-30"]
[WriteDate]
#鈴耶
ホーム画面よ[r]
メニューを選択してね[p]

@layopt layer=message0 visible=false

[glink  color="black"  target="*mission_select1"  x="450"  y="150"  width=""  height=""  text="忍務" ]
[glink  color="black"  target="*mission_select1"  x="450"  y="250"  width=""  height=""  text="装備" ]
[glink  color="black"  target="*mission_select1"  x="450"  y="350"  width=""  height=""  text="管理" ]
[glink  color="black"  target="*select_holiday"  x="450"  y="450"  width=""  height=""  text="休息" ]
[s]

*mission_select1
[glink  color="black"  target="*mission_select_region"  x="450"  y="150"  width=""  height=""  text="地域で選ぶ" ]
[s]

*mission_select_region
[glink  color="black"  target="*mission_region_ushi"  x="450"  y="150"  width=""  height=""  text="丑ノ国" ]
[glink  color="black"  target="*mission_region_saru"  x="450"  y="250"  width=""  height=""  text="申ノ国" ]
[glink  color="black"  target="*mission_region_hebi"  x="450"  y="350"  width=""  height=""  text="巳ノ国" ]
[glink  color="black"  target="*mission_region_tori"  x="450"  y="450"  width=""  height=""  text="酉ノ国" ]
[s]

*mission_region_ushi
[glink  color="black"  target="*mission_express_ushi01"  x="450"  y="150"  width=""  height=""  text="密書配達（丑ノ国・序）" ]
[glink  color="black"  target="*mission_express_ushi02"  x="450"  y="250"  width=""  height=""  text="密書配達（丑ノ国・破）" ]
[glink  color="black"  target="*mission_intlude_ushi01"  x="450"  y="350"  width=""  height=""  text="潜入工作（丑ノ国・序）" ]
[glink  color="black"  target="*mission_bodyguard_ushi01"  x="450"  y="450"  width=""  height=""  text="密使護衛（丑ノ国・序）" ]
[glink  color="black"  target="*mission_undercover_ushi01"  x="450"  y="550"  width=""  height=""  text="破壊工作（丑ノ国・序）" ]
[s]

*mission_region_saru
[glink  color="black"  target="*mission_express_saru01"  x="450"  y="150"  width=""  height=""  text="密書配達（申ノ国・序）" ]
[s]

*mission_region_hebi
[glink  color="black"  target="*mission_express_hebi01"  x="450"  y="150"  width=""  height=""  text="密書配達（巳ノ国・序）" ]
[s]

*mission_region_tori
[glink  color="black"  target="*mission_express_tori01"  x="450"  y="150"  width=""  height=""  text="密書配達（酉ノ国・序）" ]
[s]

;-----丑ノ国
*mission_express_ushi01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="450"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="450"  y="250"  width=""  height=""  text="もどる" ]
[s]

*mission_express_ushi02
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="450"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="450"  y="250"  width=""  height=""  text="もどる" ]
[s]

*mission_intlude_ushi01
[glink  color="black"  storage="intlude_ushi01.ks"  target="*mission_start"  x="450"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="450"  y="250"  width=""  height=""  text="もどる" ]
[s]

*mission_undercover_ushi01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="450"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="450"  y="250"  width=""  height=""  text="もどる" ]
[s]

*mission_assasin_ushi01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="450"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="450"  y="250"  width=""  height=""  text="もどる" ]
[s]

;-----申ノ国
*mission_express_saru01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="450"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="450"  y="250"  width=""  height=""  text="もどる" ]
[s]

;-----巳ノ国
*mission_express_hebi01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="450"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="450"  y="250"  width=""  height=""  text="もどる" ]
[s]

;-----酉ノ国
*mission_express_tori01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="450"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="450"  y="250"  width=""  height=""  text="もどる" ]
[s]

;------休養-------
*select_holiday
[glink  color="black"  target="*rest"  x="450"  y="150"  width=""  height=""  text="休養" ]
[glink  color="black"  target="*pray"  x="450"  y="250"  width=""  height=""  text="浄化" ]
[glink  color="black"  target="*meditation"  x="450"  y="350"  width=""  height=""  text="瞑想" ]
[s]

*rest
体力を回復します[p]
[eval exp="f.HP = f.HP_MAX"][WSs]
[eval exp="f.date += 1"]
[jump target="*home_start"]
[s]

*pray
淫気を祓います[p]
[eval exp="f.CURSE = 0"][WSs]
[eval exp="f.date += 1"]
[jump target="*home_start"]
[s]

*meditation
理性を少し回復した[p]
[eval exp="f.SAN += 5"]
[eval exp="f.SAN = f.SAN_MAX" cond="f.SAN > f.SAN_MAX"][WSs]
[eval exp="f.date += 1"]
[jump target="*home_start"]
[s]
