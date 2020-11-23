;WriteStatus
;[Milk]
[iscript]
tf.mov = f.MOVE + f.arms_mov ;
tf.movtxt = "移動力：" + tf.mov ;
tf.turntxt = "手番数：" + f.turn ;
tf.hptxt = "体力：" + f.HP ;
tf.mptxt = "気力：" + f.MP ;
tf.mndtxt = "集中：" + f.MND ;
tf.erotxt = "欲情：" + f.ERO ;
tf.cursetxt = "淫気：" + f.CURSE ;
tf.vital = "状態：";
if(f.poison > 0){tf.vital = tf.vital + "毒　";}
if(f.slowly > 0){tf.vital = tf.vital + "鈍足　";}
if(f.excite > 0){tf.vital = tf.vital + "興奮　";}
if(f.mazo > 0){tf.vital = tf.vital + "被虐性癖　";}
if(f.milk > 0){tf.vital = tf.vital + "爆乳化　";}
if(f.bags > 0){tf.vital = tf.vital + "虫憑き　";}
if(f.slave > 0){tf.vital = tf.vital + "隷属　";}
if(f.tatoo > 0){tf.vital = tf.vital + "淫紋　";}
if(f.unescape > 0){tf.vital = tf.vital + "逃走封印　";}
if(f.cantescape > 0){tf.vital = tf.vital + "逃走不能　";}
if(f.aphrodisy > 0){tf.vital = tf.vital + "欲情　";}
[endscript]
[ptext layer="0" x="10" y="580" text=&tf.hptxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="hitpoint" overwrite="true" ]
[ptext layer="0" x="10" y="600" text=&tf.mptxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="magicpoint" overwrite="true" ]
[ptext layer="0" x="10" y="620" text=&tf.mndtxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="concentration" overwrite="true" ]
[ptext layer="0" x="10" y="640" text=&tf.erotxt size="20" color="0xff00ff" edge="white" bold="bold" align="left" name="ero" overwrite="true" ]
[ptext layer="0" x="10" y="660" text=&tf.cursetxt size="20" color="0x9400d3" edge="white" bold="bold" align="left" name="curse" overwrite="true" ]
[ptext layer="0" x="10" y="680" text=&tf.vital size="20" color="0xdc143c" edge="white" bold="bold" align="left" name="health" overwrite="true" ]
[ptext layer="0" x="150" y="580" text=&tf.movtxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="movepower" overwrite="true" ]
[ptext layer="0" x="150" y="620" text=&tf.turntxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="noisevolume" overwrite="true" ]

[return]
