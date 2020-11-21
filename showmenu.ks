*show_status
[iscript]
tf.hp = "体力：" + f.HP ;
tf.mp = "気力：" + f.MP ;
tf.mnd = "集中：" + f.MND ;
tf.ero = "欲情：" + f.ERO ;
tf.curse = "淫気：" + f.CURSE ;
f.ATP = f.STR + f.arms_atp + f.acceA_atp + f.acceB_atp;
tf.atp = "攻撃力" + f.ATP;
f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow;
tf.pow = "精神力" + f.MGP;
tf.spd = "敏　捷" + f.SPD;
tf.mov = f.MOVE + f.arms_mov;
tf.movtxt = "移動力：" + tf.mov ;
tf.san = "理性" + f.SAN;
tf.vital1 = "状態：";
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
[ptext layer="2" x="700" y="100" text=&tf.hp size="30" color="0x333631" edge="white" bold="bold" align="left" name="sshp" overwrite="true" ]
[ptext layer="2" x="700" y="130" text=&tf.mp size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssmp" overwrite="true" ]
[ptext layer="2" x="700" y="160" text=&tf.mnd size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssmnd" overwrite="true" ]

[ptext layer="2" x="700" y="190" text=&tf.atp size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssatp" overwrite="true" ]
[ptext layer="2" x="700" y="220" text=&tf.pow size="30" color="0x333631" edge="white" bold="bold" align="left" name="sspow" overwrite="true" ]

[ptext layer="2" x="700" y="250" text=&tf.spd size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssspd" overwrite="true" ]
[ptext layer="2" x="700" y="280" text=&tf.movtxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssmov" overwrite="true" ]

[ptext layer="2" x="700" y="310" text=&tf.ero size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssero" overwrite="true" ]
[ptext layer="2" x="700" y="340" text=&tf.curse size="30" color="0x333631" edge="white" bold="bold" align="left" name="sscures" overwrite="true" ]
[ptext layer="2" x="700" y="370" text=&tf.san size="30" color="0x333631" edge="white" bold="bold" align="left" name="sssan" overwrite="true" ]

[ptext layer="2" x="700" y="400" text=&tf.vital1 size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssvital1" overwrite="true" ]
[ptext layer="2" x="700" y="430" text=&tf.vital2 size="30" color="0x333631" edge="white" bold="bold" align="left" name="ssvital2" overwrite="true" ]

[glink  color="black"  target="*close_menu"  x="700"  y="500"  width=""  height=""  text=閉じる ]
[s]

*close_menu
[freeimage layer=2]
[return]
