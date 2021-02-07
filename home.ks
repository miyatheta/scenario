*home_start

[call storage="data_talk/talk.ks"]

*talk_end
[clearstack stack="call" ]
[freeimage layer="0" ]
[bg storage="syosai1-1080.jpg" time="100"]
[eval exp="f.dress=1"][call storage="asset/As_face.ks"]
[chara_mod name="suzune" face="柔らか" ]
[chara_show name="suzune" left="-100" top="-20"]
@layopt layer=message0 visible=true
@layopt layer=2 visible=true
[WriteDate][WSs]

#鈴耶
ホーム画面よ[r]
メニューを選択してね[p]
#
[cm]
[call storage="routin/Rt_setStatus.ks"]
[WSs]
;[progressbar]
;[securitybar]

*select_menu
[call target="*show_status"]
[chara_show name="suzune" fase="普通" left="-100" top="-20"]
[glink color="black" target="*mission_select1" x="450" y="100" width="" height="" text="忍務" ]
[glink color="black" target="*select_preparation" x="450" y="200" width="" height="" text="準備" ]
[glink color="black" target="*select_holiday" x="450" y="300" width="" height="" text="休息" ]
[glink color="black" target="*mission_sexparty" x="450" y="400" width="" height="" text="夜伽" ]
[s]

;------管理-------------------------------------------------------------------------
*show_status
[iscript]
tf.hptxt = "体　力：" + f.HP ;
tf.mptxt = "気　力：" + f.MP ;
tf.mndtxt = "集　中：" + f.MND ;
tf.erotxt = "欲　情：" + f.ERO ;
tf.cursetxt = "淫　気：" + f.CURSE ;
tf.strtmp = f.STR + f.arms_atp + f.acceA_atp + f.acceB_atp;
tf.atptxt = "攻撃力：" + tf.strtmp;
tf.powtmp = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow;
tf.mgptxt = "精神力：" + tf.powtmp;
tf.spdtxt = "敏　捷：" + f.SPD;
tf.mov = f.MOVE_MAX + f.arms_mov;
tf.movtxt = "移動力：" + tf.mov ;
tf.santxt = "理　性" + f.SAN;
tf.vital1 = "状態1：";
if(f.poison > 0){tf.vital1 = tf.vital1 + "毒　";}
if(f.slowly > 0){tf.vital1 = tf.vital1 + "鈍足　";}
if(f.excite > 0){tf.vital1 = tf.vital1 + "興奮　";}
tf.vital2 = "状態2：";
if(f.mazo > 0){tf.vital2 = tf.vital2 + "被虐";}
if(f.milk > 0){tf.vital2 = tf.vital2 + "爆乳";}
if(f.bags > 0){tf.vital2 = tf.vital2 + "虫憑";}
if(f.slave > 0){tf.vital2 = tf.vital2 + "隷属";}
if(f.tatoo > 0){tf.vital2 = tf.vital2 + "淫紋";}

[endscript]
[ptext layer="2" x="700" y="100" text=&tf.hptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="sshp" overwrite="true" ]
[ptext layer="2" x="700" y="130" text=&tf.mptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssmp" overwrite="true" ]
[ptext layer="2" x="700" y="160" text=&tf.mndtxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssmnd" overwrite="true" ]

[ptext layer="2" x="700" y="190" text=&tf.atptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssatp" overwrite="true" ]
[ptext layer="2" x="700" y="220" text=&tf.mgptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="sspow" overwrite="true" ]

[ptext layer="2" x="700" y="250" text=&tf.spdtxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssspd" overwrite="true" ]
[ptext layer="2" x="700" y="280" text=&tf.movtxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssmov" overwrite="true" ]
[ptext layer="2" x="700" y="310" text=&tf.noztxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssnoz" overwrite="true" ]

[ptext layer="2" x="700" y="340" text=&tf.erotxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssero" overwrite="true" ]
[ptext layer="2" x="700" y="370" text=&tf.cursetxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="sscures" overwrite="true" ]
[ptext layer="2" x="700" y="400" text=&tf.santxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="sssan" overwrite="true" ]

[ptext layer="2" x="700" y="430" text=&tf.vital1 size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssvital1" overwrite="true" ]
[ptext layer="2" x="700" y="460" text=&tf.vital2 size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssvital2" overwrite="true" ]

[return]

;------接待-------------------------------------------------------------------------
*mission_sexparty
#
誰と夜伽を行いますか[p]
[glink color="black" storage="yotogi/shogun.ks" x="450" y="150" width="" height="" text="将軍" ]
[glink color="black" storage="yotogi/kanrei.ks" x="450" y="250" width="" height="" text="管領" ]
[glink color="black" target="*mission_select1" x="450" y="350" width="" height="" text="もどる" ]
[s]

;------休息-------------------------------------------------------------------------
*select_holiday
[glink color="black" target="*rest" x="450" y="150" width="" height="" text="休養" ]
[glink color="black" target="*pray" x="450" y="250" width="" height="" text="浄化" ]
[glink color="black" target="*meditation" x="450" y="350" width="" height="" text="瞑想" ]
[glink color="black" target="*select_menu" x="450" y="450" width="" height="" text="戻る" ]
[s]

*rest
[freeimage layer=2]
体力を回復します[p]
[eval exp="f.HP = f.HP_MAX"][WSs]
[call storage="routin/Rt_dairy.ks"]
[jump target="*home_start"]
[s]

*pray
[freeimage layer=2]
淫気を祓います[p]
[eval exp="f.CURSE = 0"][WSs]
[call storage="routin/Rt_dairy.ks"]
[jump target="*home_start"]
[s]

*meditation
[freeimage layer=2]
理性を少し回復した[p]
[eval exp="f.SAN += 5"]
[eval exp="f.SAN = f.SAN_MAX" cond="f.SAN > f.SAN_MAX"][WSs]
[call storage="routin/Rt_dairy.ks"]
[jump target="*home_start"]
[s]

;------装備-------------------------------------------------------------------------
*select_preparation
[call target="*show_status"]
[glink color="black" target="*select_arms" x="450" y="150" width="" height="" text="装飾" ]
[glink color="black" target="*select_training" x="450" y="250" width="" height="" text="習得" ]
[glink color="black" target="*select_item" x="450" y="350" width="" height="" text="道具" ]
[glink color="black" target="*select_menu" x="450" y="450" width="" height="" text="戻る" ]
[s]

*select_arms
[freeimage layer=2]
[glink color="black" target="*selected_arms1" x="450" y="150" width="" height="" text="忍者刀・夜雀" ]
[glink color="black" target="*selected_arms2" x="450" y="250" width="" height="" text="退魔刀・陽炎" ]
[glink color="black" target="*selected_arms3" x="450" y="350" width="" height="" text="脇差・燕" ]
[glink color="black" target="*selected_arms4" x="450" y="450" width="" height="" text="打刀・隼" ]
[glink color="black" target="*selected_arms5" x="750" y="150" width="" height="" text="忍者刀・夜鷹" ]
[glink color="black" target="*selected_arms6" x="750" y="250" width="" height="" text="退魔刀・日天" ]
[glink color="black" target="*selected_arms7" x="750" y="350" width="" height="" text="野太刀・大鵬" ]
[s]

*selected_arms1
[eval exp="f.arms = 1 ,f.arms_name='忍者刀・夜雀' ,f.arms_type = 1 ,f.arms_atp=30 ,f.arms_pow=0 ,f.arms_mov = 1 "]
#
[emb exp="f.arms_name"]を装備した[p][WSs]
[jump target="*select_preparation"]
[s]
*selected_arms2
[eval exp="f.arms = 2 ,f.arms_name='退魔刀・陽炎' ,f.arms_type = 2 ,f.arms_atp=10 ,f.arms_pow=20 ,f.arms_mov = 0 "]
#
[emb exp="f.arms_name"]を装備した[p][WSs]
[jump target="*select_preparation"]
[s]
*selected_arms3
[eval exp="f.arms = 3 ,f.arms_name='脇差・燕' ,f.arms_type = 1 ,f.arms_atp=40 ,f.arms_pow=0 ,f.arms_mov = -1 "]
#
[emb exp="f.arms_name"]を装備した[p][WSs]
[jump target="*select_preparation"]
[s]
*selected_arms4
[eval exp="f.arms = 4 ,f.arms_name='打刀・隼' ,f.arms_type = 1 ,f.arms_atp=50 ,f.arms_pow=0 ,f.arms_mov = -2 "]
#
[emb exp="f.arms_name"]を装備した[p][WSs]
[jump target="*select_preparation"]
[s]
*selected_arms5
[eval exp="f.arms = 5 ,f.arms_name='忍者刀・夜鷹' ,f.arms_type = 1 ,f.arms_atp=40 ,f.arms_pow=10 ,f.arms_mov = 2 "]
#
[emb exp="f.arms_name"]を装備した[p][WSs]
[jump target="*select_preparation"]
[s]
*selected_arms6
[eval exp="f.arms = 6 ,f.arms_name='退魔刀・日天' ,f.arms_type = 2 ,f.arms_atp=20 ,f.arms_pow=30 ,f.arms_mov = 0 "]
#
[emb exp="f.arms_name"]を装備した[p][WSs]
[jump target="*select_preparation"]
[s]
*selected_arms7
[eval exp="f.arms = 7 ,f.arms_name='野太刀・大鵬' ,f.arms_type = 1 ,f.arms_atp=60 ,f.arms_pow=-10 ,f.arms_mov = -3 "]
#
[emb exp="f.arms_name"]を装備した[p][WSs]
[jump target="*select_preparation"]
[s]

*select_item
[glink color="black" target="*buy_item" x="450" y="100" width="" height="" text="買う"]
[glink color="black" target="*sell_item" x="450" y="180" width="" height="" text="売る"]
[glink color="black" target="*select_menu" x="450" y="260" width="" height="" text="買い物を終える"]
[glink color="black" target="*check_item" x="450" y="340" width="" height="" text="確認"]
[s]

*check_item
[emb exp="f.inventory1['name']"][p]
[emb exp="f.inventory2['name']"][p]
[emb exp="f.inventory3['name']"][p]
[cm]
[jump target=*select_item]
[s]

*sell_item
アイテムを売却できます[p]
[glink color="red" target="*sell_item" x="450" y="100" width="" height="" text="空" cond="f.inventory1 == null"]
[glink color="blue" target="*sell_inventory1" x="450" y="100" width="" height="" text="&f.inventory1['name']" cond="f.inventory1 != null"]

[glink color="red" target="*sell_item" x="450" y="180" width="" height="" text="空" cond="f.inventory2　== null"]
[glink color="blue" target="*sell_inventory2" x="450" y="180" width="" height="" text="&f.inventory2['name']" cond="f.inventory2 != null"]

[glink color="red" target="*sell_item" x="450" y="260" width="" height="" text="空" cond="f.inventory3 == null"]
[glink color="blue" target="*sell_inventory3" x="450" y="260" width="" height="" text="&f.inventory3['name']" cond="f.inventory3 != null"]

[glink color="black" target="*select_item" x="450" y="340" width="" height="" text="戻る" ]
[s]

*sell_inventory1
[emb exp="f.inventory1['name']"]を売却した[p]
[eval exp="f.inventory1['stock']=1"]
[eval exp="f.inventory1 = null"]
[jump target="*sell_item"]
[s]

*sell_inventory2
[emb exp="f.inventory2['name']"]を売却した[p]
[eval exp="f.inventory2['stock']=1"]
[eval exp="f.inventory2 = null"]
[jump target="*sell_item"]
[s]

*sell_inventory3
[emb exp="f.inventory3['name']"]を売却した[p]
[eval exp="f.inventory3['stock']=1"]
[eval exp="f.inventory3 = null"]
[jump target="*sell_item"]
[s]

*buy_item
備品庫からアイテムを持ち出すことができます[p]
[glink color="blue" target="*selected_item0" x="450" y="100" width="" height="" text="&f.item[0]['name']" cond="f.item[0]['stock'] != 0"]
[glink color="red" target="*soldout" x="450" y="100" width="" height="" text="在庫切れ" cond="f.item[0]['stock'] == 0"]

[glink color="blue" target="*selected_item1" x="450" y="180" width="" height="" text="&f.item[1]['name']" cond="f.item[1]['stock'] != 0"]
[glink color="red" target="*soldout" x="450" y="180" width="" height="" text="在庫切れ" cond="f.item[1]['stock'] == 0"]

[glink color="blue" target="*selected_item2" x="450" y="260" width="" height="" text="&f.item[2]['name']" cond="f.item[2]['stock'] != 0"]
[glink color="red" target="*soldout" x="450" y="260" width="" height="" text="在庫切れ" cond="f.item[2]['stock'] == 0"]

[glink color="blue" target="*selected_item3" x="450" y="340" width="" height="" text="&f.item[3]['name']" cond="f.item[3]['stock'] != 0"]
[glink color="red" target="*soldout" x="450" y="340" width="" height="" text="在庫切れ" cond="f.item[3]['stock'] == 0"]

[glink color="blue" target="*selected_item4" x="450" y="420" width="" height="" text="&f.item[4]['name']" cond="f.item[4]['stock'] != 0"]
[glink color="red" target="*soldout" x="450" y="420" width="" height="" text="在庫切れ" cond="f.item[4]['stock'] == 0"]

[glink color="blue" target="*selected_item5" x="750" y="100" width="" height="" text="&f.item[5]['name']" cond="f.item[5]['stock'] != 0"]
[glink color="red" target="*soldout" x="750" y="100" width="" height="" text="在庫切れ" cond="f.item[5]['stock'] == 0"]

[glink color="blue" target="*selected_item6" x="750" y="180" width="" height="" text="&f.item[6]['name']" cond="f.item[6]['stock'] != 0"]
[glink color="red" target="*soldout" x="750" y="180" width="" height="" text="在庫切れ" cond="f.item[6]['stock'] == 0"]

[glink color="blue" target="*selected_item7" x="750" y="260" width="" height="" text="&f.item[7]['name']" cond="f.item[7]['stock'] != 0"]
[glink color="red" target="*soldout" x="750" y="260" width="" height="" text="在庫切れ" cond="f.item[7]['stock'] == 0"]

[glink color="blue" target="*selected_item8" x="750" y="340" width="" height="" text="&f.item[8]['name']" cond="f.item[8]['stock'] != 0"]
[glink color="red" target="*soldout" x="750" y="340" width="" height="" text="在庫切れ" cond="f.item[8]['stock'] == 0"]

[glink color="blue" target="*selected_item9" x="750" y="420" width="" height="" text="&f.item[9]['name']" cond="f.item[9]['stock'] != 0"]
[glink color="red" target="*soldout" x="750" y="420" width="" height="" text="在庫切れ" cond="f.item[9]['stock'] == 0"]

[glink color="black" target="*select_item" x="750" y="500" width="" height="" text="戻る" ]
[s]

*soldout
今、この道具は在庫切れね・・・[p]
[jump target="*select_item"][s]

*inventory_full
持ち物がいっぱいだったわ[p]
必要なら持ち物を入れ替えないと[p]
[jump target="*select_item"][s]

*selected_item0
#
[emb exp="f.item[0]"]を所持品に加えた[p]
[if exp="f.inventory1 == null"][eval exp="f.inventory1 = f.item[0]"]
[elsif exp="f.inventory2 == null"][eval exp="f.inventory2 = f.item[0]"]
[elsif exp="f.inventory3 == null"][eval exp="f.inventory3 = f.item[0]"]
[else][jump target="*inventory_full"]
[endif]
[eval exp="f.item[0]['stock'] = 0"]
[jump target="*select_item"][s]

*selected_item1
#
[emb exp="f.item[1]"]を所持品に加えた[p]
[if exp="f.inventory1 == null"][eval exp="f.inventory1 = f.item[1]"]
[elsif exp="f.inventory2 == null"][eval exp="f.inventory2 = f.item[1]"]
[elsif exp="f.inventory3 == null"][eval exp="f.inventory3 = f.item[1]"]
[else][jump target="*inventory_full"]
[endif]
[eval exp="f.item[1]['stock'] = 0"]
[jump target="*select_item"][s]

*selected_item2
#
[emb exp="f.item[2]"]を所持品に加えた[p]
[if exp="f.inventory1 == null"][eval exp="f.inventory1 = f.item[2]"]
[elsif exp="f.inventory2 == null"][eval exp="f.inventory2 = f.item[2]"]
[elsif exp="f.inventory3 == null"][eval exp="f.inventory3 = f.item[2]"]
[else][jump target="*inventory_full"]
[endif]
[eval exp="f.item[2]['stock'] = 0"]
[jump target="*select_item"][s]

*selected_item3
#
[emb exp="f.item[3]"]を所持品に加えた[p]
[if exp="f.inventory1 == null"][eval exp="f.inventory1 = f.item[3]"]
[elsif exp="f.inventory2 == null"][eval exp="f.inventory2 = f.item[3]"]
[elsif exp="f.inventory3 == null"][eval exp="f.inventory3 = f.item[3]"]
[else][jump target="*inventory_full"]
[endif]
[eval exp="f.item[3]['stock'] = 0"]
[jump target="*select_item"][s]

*selected_item4
#
[emb exp="f.item[4]"]を所持品に加えた[p]
[if exp="f.inventory1 == null"][eval exp="f.inventory1 = f.item[4]"]
[elsif exp="f.inventory2 == null"][eval exp="f.inventory2 = f.item[4]"]
[elsif exp="f.inventory3 == null"][eval exp="f.inventory3 = f.item[4]"]
[else][jump target="*inventory_full"]
[endif]
[eval exp="f.item[4]['stock'] = 0"]
[jump target="*select_item"][s]

*selected_item5
#
[emb exp="f.item[5]"]を所持品に加えた[p]
[if exp="f.inventory1 == null"][eval exp="f.inventory1 = f.item[5]"]
[elsif exp="f.inventory2 == null"][eval exp="f.inventory2 = f.item[5]"]
[elsif exp="f.inventory3 == null"][eval exp="f.inventory3 = f.item[5]"]
[else][jump target="*inventory_full"]
[endif]
[eval exp="f.item[5]['stock'] = 0"]
[jump target="*select_item"][s]

*selected_item6
#
[emb exp="f.item[6]"]を所持品に加えた[p]
[if exp="f.inventory1 == null"][eval exp="f.inventory1 = f.item[6]"]
[elsif exp="f.inventory2 == null"][eval exp="f.inventory2 = f.item[6]"]
[elsif exp="f.inventory3 == null"][eval exp="f.inventory3 = f.item[6]"]
[else][jump target="*inventory_full"]
[endif]
[eval exp="f.item[6]['stock'] = 0"]
[jump target="*select_item"][s]

*selected_item7
#
[if exp="f.inventory1 == null"][eval exp="f.inventory1 = f.item[7]"]
[elsif exp="f.inventory2 == null"][eval exp="f.inventory2 = f.item[7]"]
[elsif exp="f.inventory3 == null"][eval exp="f.inventory3 = f.item[7]"]
[else][jump target="*inventory_full"]
[endif]
[eval exp="f.item[7]['stock'] = 0"]
[jump target="*select_item"][s]

*selected_item8
#
[emb exp="f.item[8]"]を所持品に加えた[p]
[if exp="f.inventory1 == null"][eval exp="f.inventory1 = f.item[8]"]
[elsif exp="f.inventory2 == null"][eval exp="f.inventory2 = f.item[8]"]
[elsif exp="f.inventory3 == null"][eval exp="f.inventory3 = f.item[8]"]
[else][jump target="*inventory_full"]
[endif]
[eval exp="f.item[8]['stock'] = 0"]
[jump target="*select_item"][s]

*selected_item9
#
[emb exp="f.item[9]"]を所持品に加えた[p]
[if exp="f.inventory1 == null"][eval exp="f.inventory1 = f.item[9]"]
[elsif exp="f.inventory2 == null"][eval exp="f.inventory2 = f.item[9]"]
[elsif exp="f.inventory3 == null"][eval exp="f.inventory3 = f.item[9]"]
[else][jump target="*inventory_full"]
[endif]
[eval exp="f.item[9]['stock'] = 0"]
[jump target="*select_item"][s]

[s]

;------習得-------------------------------------------------------------------------
*select_training
戦功を消費してスキルを習得します[p]
[glink color="blue" target="*selected_skill0" x="450" y="100" width="" height="" text="&f.skill[0]['name']" cond="f.skill[0]['learn'] == 0"]
[glink color="red" target="*soldout" x="450" y="100" width="" height="" text="習得済み" cond="f.skill[0]['learn'] != 0"]

[glink color="blue" target="*selected_skill1" x="450" y="180" width="" height="" text="&f.skill[1]['name']" cond="f.skill[1]['learn'] == 0"]
[glink color="red" target="*soldout" x="450" y="180" width="" height="" text="習得済み" cond="f.skill[1]['learn'] != 0"]

[glink color="blue" target="*selected_skill2" x="450" y="260" width="" height="" text="&f.skill[2]['name']" cond="f.skill[2]['learn'] == 0"]
[glink color="red" target="*soldout" x="450" y="260" width="" height="" text="習得済み" cond="f.skill[2]['learn'] != 0"]

[glink color="blue" target="*selected_skill3" x="450" y="340" width="" height="" text="&f.skill[3]['name']" cond="f.skill[3]['learn'] == 0"]
[glink color="red" target="*soldout" x="450" y="340" width="" height="" text="習得済み" cond="f.skill[3]['learn'] != 0"]

[glink color="blue" target="*selected_skill4" x="450" y="420" width="" height="" text="&f.skill[4]['name']" cond="f.skill[4]['learn'] == 0"]
[glink color="red" target="*soldout" x="450" y="420" width="" height="" text="習得済み" cond="f.skill[4]['learn'] != 0"]

[glink color="blue" target="*selected_skill5" x="450" y="500" width="" height="" text="&f.skill[5]['name']" cond="f.skill[5]['learn'] == 0"]
[glink color="red" target="*soldout" x="450" y="500" width="" height="" text="習得済み" cond="f.skill[5]['learn'] != 0"]

[glink color="blue" target="*selected_skill6" x="450" y="580" width="" height="" text="&f.skill[6]['name']" cond="f.skill[6]['learn'] == 0"]
[glink color="red" target="*soldout" x="450" y="580" width="" height="" text="習得済み" cond="f.skill[6]['learn'] != 0"]

[glink color="black" target="*select_menu" x="750" y="100" width="" height="" text="習得を終える"]
[s]

*selected_skill0
#
[emb exp="f.skill[0]['name']"]を習得します（戦功200消費）[p]
[glink color="blue" target="*learning_skill0" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*select_training" x="450" y="250" width="" height="" text="いいえ" ]
[s]
*learning_skill0
[if exp="f.EXP < 200"]
戦功が足りません[p]
[jump target="*select_training"]
[endif]
[emb exp="f.skill[0]['name']"]を習得した[p]
[eval exp="f.skill[0]['learn'] = 1"]
[eval exp="f.EXP -= 200"][WriteEXP]
[jump target="*select_menu"][s]

*selected_skill1
#
[emb exp="f.skill[1]['name']"]を習得します（戦功200消費）[p]
[glink color="blue" target="*learning_skill1" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*select_training" x="450" y="250" width="" height="" text="いいえ" ]
[s]
*learning_skill1
[if exp="f.EXP < 200"]
戦功が足りません[p]
[jump target="*select_training"]
[endif]
[emb exp="f.skill[1]['name']"]を習得した[p]
[eval exp="f.skill[1]['learn'] = 1"]
[eval exp="f.EXP -= 200"][WriteEXP]
[jump target="*select_menu"][s]

*selected_skill2
#
[emb exp="f.skill[2]['name']"]を習得します（戦功200消費）[p]
[glink color="blue" target="*learning_skill2" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*select_training" x="450" y="250" width="" height="" text="いいえ" ]
[s]
*learning_skill2
[if exp="f.EXP < 200"]
戦功が足りません[p]
[jump target="*select_training"]
[endif]
[emb exp="f.skill[2]['name']"]を習得した[p]
[eval exp="f.skill[2]['learn'] = 1"]
[eval exp="f.EXP -= 200"][WriteEXP]
[jump target="*select_menu"][s]

*selected_skill3
#
[emb exp="f.skill[3]['name']"]を習得します（戦功200消費）[p]
[glink color="blue" target="*learning_skill3" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*select_training" x="450" y="250" width="" height="" text="いいえ" ]
[s]
*learning_skill3
[if exp="f.EXP < 200"]
戦功が足りません[p]
[jump target="*select_training"]
[endif]
[emb exp="f.skill[3]['name']"]を習得した[p]
[eval exp="f.skill[3]['learn'] = 1"]
[eval exp="f.EXP -= 200"][WriteEXP]
[jump target="*select_menu"][s]

*selected_skill4
#
[emb exp="f.skill[4]['name']"]を習得します（戦功200消費）[p]
[glink color="blue" target="*learning_skill4" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*select_training" x="450" y="250" width="" height="" text="いいえ" ]
[s]
*learning_skill4
[if exp="f.EXP < 200"]
戦功が足りません[p]
[jump target="*select_training"]
[endif]
[emb exp="f.skill[4]['name']"]を習得した[p]
[eval exp="f.skill[4]['learn'] = 1"]
[eval exp="f.EXP -= 200"][WriteEXP]
[jump target="*select_menu"][s]

*selected_skill5
#
[emb exp="f.skill[5]['name']"]を習得します（戦功200消費）[p]
[glink color="blue" target="*learning_skill5" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*select_training" x="450" y="250" width="" height="" text="いいえ" ]
[s]
*learning_skill5
[if exp="f.EXP < 200"]
戦功が足りません[p]
[jump target="*select_training"]
[endif]
[emb exp="f.skill[5]['name']"]を習得した[p]
[eval exp="f.skill[5]['learn'] = 1"]
[eval exp="f.EXP -= 200"][WriteEXP]
[jump target="*select_menu"][s]

*selected_skill6
#
[emb exp="f.skill[6]['name']"]を習得します（戦功200消費）[p]
[glink color="blue" target="*learning_skill6" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*select_training" x="450" y="250" width="" height="" text="いいえ" ]
[s]
*learning_skill6
[if exp="f.EXP < 200"]
戦功が足りません[p]
[jump target="*select_training"]
[endif]
[emb exp="f.skill[6]['name']"]を習得した[p]
[eval exp="f.skill[6]['learn'] = 1"]
[eval exp="f.EXP -= 200"][WriteEXP]
[jump target="*select_menu"][s]

;------忍務-------------------------------------------------------------------------
*mission_select1
[freeimage layer=2]
[iscript]
tf.rootA = "シナリオA：";
tf.rootB = "シナリオB：";
tf.rootC = "シナリオC：";
if(f.keibi>75){
 tf.sexparty = "接待 警備体制：厳重" ;
}else if(f.keibi>50){
 tf.sexparty = "接待 警備体制：普通" ;
}else if(f.keibi>25){
 tf.sexparty = "接待 警備体制：緩い" ;
}else {
 tf.sexparty = "接待 警備体制：ザル" ;
}

[endscript]
[glink color="black" target="*mission_region_north" x="450" y="110" width="300" height="30" text="&tf.rootA" ]
[glink color="black" target="*mission_region_south" x="450" y="190" width="300" height="30" text="&tf.rootB" ]
[glink color="black" target="*mission_region_east" x="450" y="270" width="300" height="30" text="&tf.rootC" ]
[glink color="black" target="*select_menu" x="450" y="510" width="300" height="30" text="戻る" ]
[s]

*mission_region_north
[glink color="black" target="*mission_north_expr01" x="450" y="110" width="" height="" text="密書（丑ノ国・序）" ]
[glink color="black" target="*mission_north_guard01" x="450" y="190" width="" height="" text="護衛（丑ノ国・序）" cond="f.Qt_n_expr01 >= 1"]
[glink color="black" target="*mission_intrude_ushi01" x="450" y="270" width="" height="" text="潜入（丑ノ国・序）" cond="f.Qt_n_guard01 >= 1"]
[glink color="black" target="*mission_trace_ushi01" x="450" y="350" width="" height="" text="追跡（丑ノ国・序）" ]
[glink color="black" target="*mission_undercover_ushi01" x="450" y="430" width="" height="" text="合戦（丑ノ国・序）" ]
[s]

*mission_region_south
[glink color="black" target="*mission_express_saru01" x="450" y="150" width="" height="" text="密書配達（申ノ国・序）" ]
[glink color="black" target="*mission_north_guard01" x="450" y="250" width="" height="" text="護衛（丑ノ国・序）" ]
[glink color="black" target="*mission_intrude_ushi01" x="450" y="350" width="" height="" text="潜入（丑ノ国・序）" ]
[glink color="black" target="*mission_trace_ushi01" x="450" y="450" width="" height="" text="追跡（丑ノ国・序）" ]
[glink color="black" target="*mission_undercover_ushi01" x="450" y="550" width="" height="" text="破壊（丑ノ国・序）" ]
[s]

*mission_region_east
[glink color="black" target="*mission_express_hebi01" x="450" y="150" width="" height="" text="密書配達（巳ノ国・序）" ]
[glink color="black" target="*mission_north_guard01" x="450" y="250" width="" height="" text="護衛（丑ノ国・序）" ]
[glink color="black" target="*mission_intrude_ushi01" x="450" y="350" width="" height="" text="潜入（丑ノ国・序）" ]
[glink color="black" target="*mission_trace_ushi01" x="450" y="450" width="" height="" text="追跡（丑ノ国・序）" ]
[glink color="black" target="*mission_undercover_ushi01" x="450" y="550" width="" height="" text="破壊（丑ノ国・序）" ]
[s]

*mission_region_west
[glink color="black" target="*mission_express_tori01" x="450" y="150" width="" height="" text="密書配達（酉ノ国・序）" ]
[glink color="black" target="*mission_north_guard01" x="450" y="250" width="" height="" text="護衛（丑ノ国・序）" ]
[glink color="black" target="*mission_intrude_ushi01" x="450" y="350" width="" height="" text="潜入（丑ノ国・序）" ]
[glink color="black" target="*mission_trace_ushi01" x="450" y="450" width="" height="" text="追跡（丑ノ国・序）" ]
[glink color="black" target="*mission_undercover_ushi01" x="450" y="550" width="" height="" text="破壊（丑ノ国・序）" ]
[s]

;-----丑ノ国
*mission_north_expr01
[glink color="black" storage="data_story/St_north_expr01.ks"  x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*mission_select1" x="450" y="250" width="" height="" text="もどる" ]
[s]

*mission_north_guard01
[glink color="black" storage="data_story/St_north_guard01.ks" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*mission_select1" x="450" y="250" width="" height="" text="もどる" ]
[s]

*mission_intrude_ushi01
[glink color="black" storage="data_story/St_north_intrude01.ks" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*mission_select1" x="450" y="250" width="" height="" text="もどる" ]
[s]

*mission_trace_ushi01
[glink color="black" storage="data_story/St_north_trace01.ks" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*mission_select1" x="450" y="250" width="" height="" text="もどる" ]
[s]

*mission_assasin_ushi01
[glink color="black" storage="data_story/St_north_expr01.ks" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*mission_select1" x="450" y="250" width="" height="" text="もどる" ]
[s]

;-----申ノ国
*mission_express_saru01
[glink color="black" storage="data_Quest/north_expr01.ks" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*mission_select1" x="450" y="250" width="" height="" text="もどる" ]
[s]

;-----巳ノ国
*mission_express_hebi01
[glink color="black" storage="data_Quest/north_expr01.ks" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*mission_select1" x="450" y="250" width="" height="" text="もどる" ]
[s]

;-----酉ノ国
*mission_express_tori01
[glink color="black" storage="data_Quest/north_expr01.ks" x="450" y="150" width="" height="" text="はい" ]
[glink color="black" target="*mission_select1" x="450" y="250" width="" height="" text="もどる" ]
[s]
