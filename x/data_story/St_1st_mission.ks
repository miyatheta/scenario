*導入
[freeimage layer="0" ]
[bg storage="炎.jpg" time="100"]
@layopt layer=message0 visible=true
@layopt layer=2 visible=true
時は戦国、下剋上の横行する乱世の時代[r]
各地の大名たちは領地を求めて戦に明け暮れた[p]
田畑は荒れ果て、寺社は打ち壊され、[r]
戦火は帝のおわす都にまで及んだ[p]
溢れる怨嗟は数多の怪異・妖怪を呼び起こし[r]
和ノ国は末世の様相を呈していた[p]
[freeimage layer="base" time=1000 wait=true]
そんな昏い時代の夜を駆ける影たち[p]
有力な大名を主人として戴き[r]
諜報・伝令・斥候・破壊・暗殺を担う者[p]
忍（しのび）である[p]
そして、ここにも夜闇を走る一人の忍[r]
否、それは女であるからして[r]
一人のくノ一がいた[p]
[cm]
[freeimage layer="0" ]
[freeimage layer="base" ]

[wait time=1000]
[bg storage="mori_yoru.jpg" time="600"]
[chara_show name="suzune" face="怒り" left="-600" top="-20"]
[chara_move name="suzune" time="600" left="-100"]

[chara_mod name="suzune" face="怒り"]
#??
早く殿様からの文を届けないといけないのに・・・
#
[chara_hide name="suzune" ]
[image storage="chara/suzune/1/怒り.png" left="200" top="0" width="770" height="1034" layer="2"]
[ptext layer="2" x="800" y="400" size="36" color="red" bold="bold" text="くのいち" ]
[ptext layer="2" x="800" y="450" size="72" color="white" bold="bold" text="鈴猫" ]
[wait time=900]
[p]
#鈴猫
（長引く戦で追い剥ぎ目当ての野武士や野盗は増える一方・・・）[p]
（こっちは戦を治めるために働いてるのに、邪魔しないでほしいわ！まったく！）[p]
さあ、急がないと夜が明けちゃう！！[p]
[freeimage layer="2" ]
[chara_show name="suzune" face="普通" left="-100" top="-20"]
[jump storage="data_Quest/1st_expr.ks"]
[s]
