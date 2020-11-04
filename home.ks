*home_start
[cm]
[bg storage="syosai1-1080.jpg" time="100"]
[chara_show  name="suzune"  left="-100" top="-20"]
@layopt layer=message0 visible=true
@layopt layer=2 visible=true
[WriteDate]
#鈴耶
ホーム画面よ[r]
メニューを選択してね[p]
#
[cm]

*select_menu
[call target="*show_status"]
[glink  color="black"  target="*mission_select1"  x="450"  y="100"  width=""  height=""  text="忍務" ]
[glink  color="black"  target="*select_preparation"  x="450"  y="200"  width=""  height=""  text="装備" ]
[glink  color="black"  target="*select_holiday"  x="450"  y="300"  width=""  height=""  text="休息" ]
[s]

;------管理-------------------------------------------------------------------------
*show_status
[iscript]
tf.hp = "体力：" + f.HP ;
tf.mp = "気力：" + f.MP ;
tf.mnd = "集中：" + f.MND ;
tf.ero = "欲情：" + f.ERO ;
tf.curse = "淫気：" + f.CURSE ;
f.ATP = f.STR + f.arms_atp + f.acce_atp;
tf.atp = "攻撃力" + f.ATP;
f.MGP = f.POW + f.arms_pow + f.acce_pow;
tf.pow = "精神力" + f.MGP;
tf.spd = "すばやさ" + f.SPD;
tf.mov = "移動力：" + f.MOVE ;
tf.san = "理性" + f.SAN;
tf.vital1 = "状態：";
if(f.poison > 0){tf.vital1 = tf.vital1 + "毒　";}
if(f.slowly > 0){tf.vital1 = tf.vital1 + "鈍足　";}
if(f.excite > 0){tf.vital1 = tf.vital1 + "興奮　";}
tf.vital2 = "状態2：";
if(f.mazo > 0){tf.vital2 = tf.vital2 + "被虐";}
if(f.boob > 0){tf.vital2 = tf.vital2 + "爆乳";}
if(f.bags > 0){tf.vital2 = tf.vital2 + "虫憑";}
if(f.slave > 0){tf.vital2 = tf.vital2 + "隷属";}
if(f.tatoo > 0){tf.vital2 = tf.vital2 + "淫紋";}

[endscript]
[ptext layer="2" x="700" y="100" text=&tf.hp size="30" color="0x333631" edge="white" bold="bold" align="left" name="sshp" overwrite="true" ]
[ptext layer="2" x="700" y="130" text=&tf.mp size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssmp" overwrite="true" ]
[ptext layer="2" x="700" y="160" text=&tf.mnd size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssmnd" overwrite="true" ]

[ptext layer="2" x="700" y="190" text=&tf.atp size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssatp" overwrite="true" ]
[ptext layer="2" x="700" y="220" text=&tf.pow size="30" color="0x333631" edge="white" bold="bold" align="left" name="sspow" overwrite="true" ]

[ptext layer="2" x="700" y="250" text=&tf.spd size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssspd" overwrite="true" ]
[ptext layer="2" x="700" y="280" text=&tf.mov size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssmov" overwrite="true" ]

[ptext layer="2" x="700" y="310" text=&tf.ero size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssero" overwrite="true" ]
[ptext layer="2" x="700" y="340" text=&tf.curse size="30" color="0x333631" edge="white" bold="bold" align="left" name="sscures" overwrite="true" ]
[ptext layer="2" x="700" y="370" text=&tf.san size="30" color="0x333631" edge="white" bold="bold" align="left" name="sssan" overwrite="true" ]

[ptext layer="2" x="700" y="400" text=&tf.vital1 size="20" color="0x333631" edge="white" bold="bold" align="left" name="ssvital1" overwrite="true" ]
[ptext layer="2" x="700" y="420" text=&tf.vital2 size="20" color="0x333631" edge="white" bold="bold" align="left" name="ssvital2" overwrite="true" ]

[return]

;------休養-------------------------------------------------------------------------
*select_holiday
[glink  color="black"  target="*rest"  x="450"  y="150"  width=""  height=""  text="休養" ]
[glink  color="black"  target="*pray"  x="450"  y="250"  width=""  height=""  text="浄化" ]
[glink  color="black"  target="*meditation"  x="450"  y="350"  width=""  height=""  text="瞑想" ]
[glink  color="black"  target="*select_menu"  x="450"  y="450"  width=""  height=""  text="戻る" ]
[s]

*rest
[freeimage layer=2]
体力を回復します[p]
[eval exp="f.HP = f.HP_MAX"][WSs]
[eval exp="f.date += 1"]
[jump target="*home_start"]
[s]

*pray
[freeimage layer=2]
淫気を祓います[p]
[eval exp="f.CURSE = 0"][WSs]
[eval exp="f.date += 1"]
[jump target="*home_start"]
[s]

*meditation
[freeimage layer=2]
理性を少し回復した[p]
[eval exp="f.SAN += 5"]
[eval exp="f.SAN = f.SAN_MAX" cond="f.SAN > f.SAN_MAX"][WSs]
[eval exp="f.date += 1"]
[jump target="*home_start"]
[s]

;------装備-------------------------------------------------------------------------
*select_preparation
[call target="*show_status"]
[glink  color="black"  target="*select_arms"  x="450"  y="100"  width=""  height=""  text="武器" ]
[glink  color="black"  target="*select_acceA"  x="450"  y="180"  width=""  height=""  text="具足1" ]
[glink  color="black"  target="*select_acceB"  x="450"  y="260"  width=""  height=""  text="具足2" ]
[glink  color="black"  target="*select_item"  x="450"  y="340"  width=""  height=""  text="道具" ]
[glink  color="black"  target="*select_menu"  x="450"  y="420"  width=""  height=""  text="戻る" ]
[s]

*select_arms
[freeimage layer=2]
[glink  color="black"  target="*selected_arms1"  x="450"  y="150"  width=""  height=""  text="忍者刀・夜雀" ]
[glink  color="black"  target="*selected_arms2"  x="450"  y="250"  width=""  height=""  text="退魔刀・陽炎" ]
[glink  color="black"  target="*selected_arms3"  x="450"  y="350"  width=""  height=""  text="脇差・燕" ]
[glink  color="black"  target="*selected_arms4"  x="450"  y="450"  width=""  height=""  text="打刀・隼" ]
[glink  color="black"  target="*selected_arms5"  x="750"  y="150"  width=""  height=""  text="忍者刀・夜鷹" ]
[glink  color="black"  target="*selected_arms6"  x="750"  y="250"  width=""  height=""  text="退魔刀・日天" ]
[glink  color="black"  target="*selected_arms7"  x="750"  y="350"  width=""  height=""  text="野太刀・大鵬" ]
[s]

*selected_arms1
[eval exp="f.arms = 1 , f.arms_name='忍者刀・夜雀' , f.arms_atp=30 ,f.arms_pow=0 ,f.arms_noz=10"]
#
[emb exp="f.arms_name"]を装備した[p]
[jump target="*select_preparation"]
[s]
*selected_arms2
[eval exp="f.arms = 2 , f.arms_name='退魔刀・陽炎' , f.arms_atp=10 ,f.arms_pow=20 ,f.arms_noz=10"]
#
[emb exp="f.arms_name"]を装備した[p]
[jump target="*select_preparation"]
[s]
*selected_arms3
[eval exp="f.arms = 3 , f.arms_name='脇差・燕' , f.arms_atp=40 ,f.arms_pow=0 ,f.arms_noz=20"]
#
[emb exp="f.arms_name"]を装備した[p]
[jump target="*select_preparation"]
[s]
*selected_arms4
[eval exp="f.arms = 4 , f.arms_name='打刀・隼' , f.arms_atp=50 ,f.arms_pow=0 ,f.arms_noz=30"]
#
[emb exp="f.arms_name"]を装備した[p]
[jump target="*select_preparation"]
[s]
*selected_arms5
[eval exp="f.arms = 5 , f.arms_name='忍者刀・夜鷹' , f.arms_atp=40 ,f.arms_pow=10 ,f.arms_noz=10"]
#
[emb exp="f.arms_name"]を装備した[p]
[jump target="*select_preparation"]
[s]
*selected_arms6
[eval exp="f.arms = 6 , f.arms_name='退魔刀・日天' , f.arms_atp=20 ,f.arms_pow=30 ,f.arms_noz=25"]
#
[emb exp="f.arms_name"]を装備した[p]
[jump target="*select_preparation"]
[s]
*selected_arms7
[eval exp="f.arms = 7 , f.arms_name='野太刀・大鵬' , f.arms_atp=60 ,f.arms_pow=-10 ,f.arms_noz=50"]
#
[emb exp="f.arms_name"]を装備した[p]
[jump target="*select_preparation"]
[s]


*select_acceA
[freeimage layer=2]
[glink  color="black"  target="*selected_acceA1"  x="450"  y="150"  width=""  height=""  text="理力の宝珠" cond="f.acceB != 1"]
[glink  color="black"  target="*selected_acceA2"  x="450"  y="250"  width=""  height=""  text="魔除けの鈴" cond="f.acceB != 2"]
[glink  color="black"  target="*selected_acceA3"  x="450"  y="350"  width=""  height=""  text="忍びの具足" cond="f.acceB != 3"]
[glink  color="black"  target="*selected_acceA4"  x="450"  y="450"  width=""  height=""  text="革の小手" cond="f.acceB != 4"]
[glink  color="black"  target="*selected_acceA5"  x="450"  y="550"  width=""  height=""  text="剛力の腕輪" cond="f.acceB != 5"]
[glink  color="black"  target="*selected_acceA6"  x="750"  y="150"  width=""  height=""  text="法力の数珠" cond="f.acceB != 6"]
[glink  color="black"  target="*selected_acceA7"  x="750"  y="250"  width=""  height=""  text="浄化の護符" cond="f.acceB != 7"]
[glink  color="black"  target="*selected_acceA8"  x="750"  y="350"  width=""  height=""  text="夜天の首輪" cond="f.acceB != 8"]
[glink  color="black"  target="*selected_acceA9"  x="750"  y="450"  width=""  height=""  text="貞淑の髪飾" cond="f.acceB != 9"]
[glink  color="black"  target="*selected_acceA10"  x="750"  y="550"  width=""  height=""  text="木彫りの仏像" cond="f.acceB != 10"]
[glink  color="black"  target="*selected_acceA11"  x="750"  y="650"  width=""  height=""  text="達人の証" cond="f.acceB != 11"]
[s]

*selected_acceA0
[freeimage layer=2]
[eval exp="f.acceA = 0 , f.acceA_name='なし' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
装飾を外した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceA1
[eval exp="f.acceA = 1 , f.acceA_name='理力の宝珠' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceA_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceA2
[eval exp="f.acceA = 2 , f.acceA_name='魔除けの鈴' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceA_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceA3
[eval exp="f.acceA = 3 , f.acceA_name='忍びの具足' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceA_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceA4
[eval exp="f.acceA = 4 , f.acceA_name='革の小手' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceA_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceA5
[eval exp="f.acceA = 5 , f.acceA_name='剛力の腕輪' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceA_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceA6
[eval exp="f.acceA = 6 , f.acceA_name='法力の数珠' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=5"]
[emb exp="f.acceA_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceA7
[eval exp="f.acceA = 7 , f.acceA_name='浄化の護符' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceA_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceA8
[eval exp="f.acceA = 8 , f.acceA_name='夜天の首輪' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceA_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceA9
[eval exp="f.acceA = 9 , f.acceA_name='貞淑の髪飾' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceA_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceA10
[eval exp="f.acceA = 10 , f.acceA_name='木彫りの仏像' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceA_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceA11
[eval exp="f.acceA = 11 , f.acceA_name='達人の証' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceA_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]


*select_acceB
[glink  color="black"  target="*selected_acceB1"  x="450"  y="150"  width=""  height=""  text="理力の宝珠" cond="f.acceA != 1"]
[glink  color="black"  target="*selected_acceB2"  x="450"  y="250"  width=""  height=""  text="魔除けの鈴" cond="f.acceA != 2"]
[glink  color="black"  target="*selected_acceB3"  x="450"  y="350"  width=""  height=""  text="忍びの具足" cond="f.acceA != 3"]
[glink  color="black"  target="*selected_acceB4"  x="450"  y="450"  width=""  height=""  text="革の小手" cond="f.acceA != 4"]
[glink  color="black"  target="*selected_acceB5"  x="450"  y="550"  width=""  height=""  text="剛力の腕輪" cond="f.acceA != 5"]
[glink  color="black"  target="*selected_acceB0"  x="450"  y="550"  width=""  height=""  text="剛力の腕輪" ]
[glink  color="black"  target="*selected_acceB6"  x="750"  y="150"  width=""  height=""  text="法力の数珠" cond="f.acceA != 6"]
[glink  color="black"  target="*selected_acceB7"  x="750"  y="250"  width=""  height=""  text="浄化の護符" cond="f.acceA != 7"]
[glink  color="black"  target="*selected_acceB8"  x="750"  y="350"  width=""  height=""  text="夜天の首輪" cond="f.acceA != 8"]
[glink  color="black"  target="*selected_acceB9"  x="750"  y="450"  width=""  height=""  text="貞淑の髪飾" cond="f.acceA != 9"]
[glink  color="black"  target="*selected_acceB20"  x="750"  y="550"  width=""  height=""  text="木彫りの仏像" cond="f.acceA != 10"]
[glink  color="black"  target="*selected_acceB21"  x="750"  y="650"  width=""  height=""  text="達人の証" cond="f.acceA != 11"]
[s]

*selected_acceB0
[eval exp="f.acceB = 0 , f.acceB_name='なし' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
装飾を外した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceB1
[eval exp="f.acceB = 1 , f.acceB_name='理力の宝珠' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceB_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceB2
[eval exp="f.acceB = 2 , f.acceB_name='魔除けの鈴' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceB_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceB3
[eval exp="f.acceB = 3 , f.acceB_name='忍びの具足' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceB_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceB4
[eval exp="f.acceB = 4 , f.acceB_name='革の小手' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceB_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceB5
[eval exp="f.acceB = 5 , f.acceB_name='剛力の腕輪' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceB_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceB6
[eval exp="f.acceB = 6 , f.acceB_name='法力の数珠' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=5"]
[emb exp="f.acceB_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceB7
[eval exp="f.acceB = 7 , f.acceB_name='浄化の護符' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceB_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceB8
[eval exp="f.acceB = 8 , f.acceB_name='夜天の首輪' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceB_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceB9
[eval exp="f.acceB = 9 , f.acceB_name='貞淑の髪飾' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceB_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceB20
[eval exp="f.acceB = 10 , f.acceB_name='木彫りの仏像' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceB_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]
*selected_acceB21
[eval exp="f.acceB = 11 , f.acceB_name='達人の証' , f.acce_atp=0 ,f.acce_pow=0 ,f.acce_noz=0"]
[emb exp="f.acceB_name"]を装備した[p]
[jump target="*select_preparation"][s]
[s]

*select_item

;------忍務-------------------------------------------------------------------------
*mission_select1
[freeimage layer=2]
[glink  color="black"  target="*mission_select_region"  x="450"  y="150"  width=""  height=""  text="地域で選ぶ" ]
[glink  color="black"  target="*select_menu"  x="450"  y="250"  width=""  height=""  text="戻る" ]
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
