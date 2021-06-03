#
;メッセージウィンドウの表示
@layopt layer=message0 visible=true
[bg storage="mori_yoru.jpg" time="100"]
@layopt layer=2 visible=true

[chara_mod name="suzune" face="怒り" ]
[chara_show name="suzune" left="-100" top="-20"]

#鈴猫
戦の影響で港から船は出ない[p]
陸路を行くにしてもバカ正直に街道を行くわけにもいかない[p]
下道を強行軍するしかなさそうね…[p]
でも、その前に…[p]

[chara_mod name="suzune" face="厳しい" ]

#鈴猫
出てきなさい！！尾けているのは気づいてるわよ！！[p]

[chara_mod name="suzune" face="怒り" ]
[image layer=2 visible="true" x=800 y=0 folder="fgimage/chara/sample" storage="180616_npc_t_01d.png"]

#尾行していた忍者
ほう。くのいちごときと甘く見たが…[p]
なかなかやるな[p]

#鈴猫
（武田軍の陣中に潜っていた間諜か）[p]
（水攻めの工事で雇った労働者に紛れていたのかしら）[p]
（それにしてもこんなに早く気づかれるなんて）[p]

#尾行していた忍者
こんな夜更けに慌てて出立するなど[r]
余程の大事と見える[p]
いかなる用向きか、誰が主か[p]
あらいざらい吐いてもらうぞ！！[p]

#鈴猫
ふん！！やれるもんならやってみなさい！！[p]

[cm][clearfix]
@layopt layer=message0 visible=false
[glink x="400" y="400" text="通常" storage="battle.ks" exp="f.enemy_PASS = 'enemy/tutor.ks'"]
[s]
