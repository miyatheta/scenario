*home_start
[chara_show  name="suzune"  left="-100" top="-50"]
#鈴猫
ホーム画面よ[r]
メニューを選択してね[p]

@layopt layer=message0 visible=false

[glink  color="black"  target="*mission_select1"  x="350"  y="650"  width=""  height=""  text="忍務" ]
[glink  color="black"  target="*mission_select1"  x="550"  y="650"  width=""  height=""  text="装備" ]
[glink  color="black"  target="*mission_select1"  x="750"  y="650"  width=""  height=""  text="管理" ]
[glink  color="black"  target="*mission_select1"  x="950"  y="650"  width=""  height=""  text="休息" ]
[s]

*mission_select1
[glink  color="black"  target="*mission_select_region"  x="350"  y="150"  width=""  height=""  text="地域で選ぶ" ]
[glink  color="black"  target="*mission_select_category"  x="350"  y="350"  width=""  height=""  text="種類で選ぶ" ]
[s]

*mission_select_region
[glink  color="black"  target="*mission_region_ushi"  x="350"  y="150"  width=""  height=""  text="丑ノ国" ]
[glink  color="black"  target="*mission_region_saru"  x="350"  y="250"  width=""  height=""  text="申ノ国" ]
[glink  color="black"  target="*mission_region_hebi"  x="350"  y="350"  width=""  height=""  text="巳ノ国" ]
[glink  color="black"  target="*mission_region_tori"  x="350"  y="450"  width=""  height=""  text="酉ノ国" ]
[s]

*mission_select_category
[glink  color="black"  target="*mission_category_express"  x="350"  y="150"  width=""  height=""  text="伝令" ]
[glink  color="black"  target="*mission_category_intlude"  x="350"  y="250"  width=""  height=""  text="潜入" ]
[glink  color="black"  target="*mission_category_bodyguard"  x="350"  y="350"  width=""  height=""  text="護衛" ]
[glink  color="black"  target="*mission_category_undercover"  x="350"  y="450"  width=""  height=""  text="破壊" ]
[glink  color="black"  target="*mission_category_assasin"  x="350"  y="550"  width=""  height=""  text="暗殺" ]
[s]

*mission_region_ushi
[glink  color="black"  target="*mission_express_ushi01"  x="350"  y="150"  width=""  height=""  text="密書配達（丑ノ国・序）" ]
[glink  color="black"  target="*mission_express_ushi02"  x="350"  y="250"  width=""  height=""  text="密書配達（丑ノ国・破）" ]
[glink  color="black"  target="*mission_intlude_ushi01"  x="350"  y="350"  width=""  height=""  text="潜入工作（丑ノ国・序）" ]
[glink  color="black"  target="*mission_bodyguard_ushi01"  x="350"  y="450"  width=""  height=""  text="密使護衛（丑ノ国・序）" ]
[glink  color="black"  target="*mission_undercover_ushi01"  x="350"  y="550"  width=""  height=""  text="破壊工作（丑ノ国・序）" ]
[s]

*mission_region_saru
[glink  color="black"  target="*mission_express_saru01"  x="350"  y="150"  width=""  height=""  text="密書配達（申ノ国・序）" ]
[s]

*mission_region_hebi
[glink  color="black"  target="*mission_express_hebi01"  x="350"  y="150"  width=""  height=""  text="密書配達（巳ノ国・序）" ]
[s]

*mission_region_tori
[glink  color="black"  target="*mission_express_tori01"  x="350"  y="150"  width=""  height=""  text="密書配達（酉ノ国・序）" ]
[s]


*mission_category_express
[glink  color="black"  target="*mission_express_ushi01"  x="350"  y="150"  width=""  height=""  text="密書配達（丑ノ国・序）" ]
[glink  color="black"  target="*mission_express_ushi02"  x="350"  y="250"  width=""  height=""  text="密書配達（丑ノ国・破）" ]
[glink  color="black"  target="*mission_express_saru02"  x="350"  y="350"  width=""  height=""  text="密書配達（申ノ国・序）" ]
[glink  color="black"  target="*mission_express_habi02"  x="350"  y="450"  width=""  height=""  text="密書配達（巳ノ国・序）" ]
[glink  color="black"  target="*mission_express_tori02"  x="350"  y="550"  width=""  height=""  text="密書配達（酉ノ国・序）" ]
[s]
*mission_category_intlude
[glink  color="black"  target="*mission_intlude_ushi01"  x="350"  y="150"  width=""  height=""  text="潜入工作（丑ノ国・序）" ]
[s]
*mission_category_bodyguard
[glink  color="black"  target="*mission_bodyguard_ushi01"  x="350"  y="150"  width=""  height=""  text="密使護衛（丑ノ国・序）" ]
[s]
*mission_category_undercover
[glink  color="black"  target="*mission_undercover_ushi01"  x="350"  y="150"  width=""  height=""  text="破壊工作（丑ノ国・序）" ]
[s]
*mission_category_assasin
[glink  color="black"  target="*mission_assasin_ushi01"  x="350"  y="150"  width=""  height=""  text="暗殺忍務（丑ノ国・序）" ]
[s]

;-----丑ノ国
*mission_express_ushi01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="350"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="350"  y="250"  width=""  height=""  text="もどる" ]
[s]

*mission_express_ushi02
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="350"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="350"  y="250"  width=""  height=""  text="もどる" ]
[s]

*mission_intlude_ushi01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="350"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="350"  y="250"  width=""  height=""  text="もどる" ]
[s]

*mission_undercover_ushi01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="350"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="350"  y="250"  width=""  height=""  text="もどる" ]
[s]

*mission_assasin_ushi01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="350"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="350"  y="250"  width=""  height=""  text="もどる" ]
[s]

;-----申ノ国
*mission_express_saru01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="350"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="350"  y="250"  width=""  height=""  text="もどる" ]
[s]

;-----巳ノ国
*mission_express_hebi01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="350"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="350"  y="250"  width=""  height=""  text="もどる" ]
[s]

;-----酉ノ国
*mission_express_tori01
[glink  color="black"  storage="express_ushi01.ks"  target="*mission_start"  x="350"  y="150"  width=""  height=""  text="はい" ]
[glink  color="black"  target="*mission_select1"  x="350"  y="250"  width=""  height=""  text="もどる" ]
[s]
