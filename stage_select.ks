*start
[freeimage layer="3"][freeimage layer="0"]
[chara_mod name="suzune" face="default" ]
[chara_show name="suzune" left="-100" top="-20"]
[bg2 storage="stage-select.png" time="100"]
#
森を抜け、京へと向かうには立ちはだかる８人すべての忍を撃破する必要がありますp[p]
途中でHPが０になった場合、勝った忍が鈴羽を砦で拷問にかけます[p]
拷問を受けるとペナルティとなる状態異常が付いた状態で一からやり直しになります[p]
HPが０になってもゲームオーバーにはなりませんが、戦闘中に絶頂したり拷問を受けるたびに
正気度が減少し、０になるとゲームオーバーになります[p]
正気度は敵を撃破することで回復します[p]
正気を失い、心が折れる前に全ての敵を連続撃破して森を抜けてください[p]

*stage_select
[glink color="black" size="18" x="400" y="300" text="蟲使い" exp="" cond="" target="*insector"]
[glink color="black" size="18" x="400" y="350" text="獣使い" exp="" cond="" target="*beaster"]
[glink color="black" size="18" x="400" y="400" text="催眠使い" exp="" cond="" target="*hypnos"]
[glink color="black" size="18" x="400" y="450" text="分身使い" exp="" cond="" target="*doubles"]
[glink color="black" size="18" x="600" y="300" text="呪術使い" exp="" cond="" target="*wizard"]
[glink color="black" size="18" x="600" y="350" text="毒使い" exp="" cond="" target="*poizoner"]
[glink color="black" size="18" x="600" y="400" text="鞭使い" exp="" cond="" target="*tamer"]
[glink color="black" size="18" x="600" y="450" text="針使い" exp="" cond="" target="*grappler"]
[s]

*insector
蟲使いと戦いますか？[p]
敗北ペナルティ：寄生蟲[p]
[glink color="black" size="18" x="600" y="300" text="は　い" exp="" cond="" storage="stage/insector_pre.ks" target="*start"]
[glink color="black" size="18" x="600" y="400" text="いいえ" exp="" cond="" target="*stage_select"]
[s]

*beaster
獣使いと戦いますか？[p]
敗北ペナルティ：発情[p]
[glink color="black" size="18" x="300" y="300" text="は　い" exp="" cond="" target="*start"]
[glink color="black" size="18" x="300" y="400" text="いいえ" exp="" cond="" target="*stage_select"]
[s]

*hypnos
瞳術使いと戦いますか？[p]
敗北ペナルティ：催淫[p]
[glink color="black" size="18" x="300" y="300" text="は　い" exp="" cond="" target="*start"]
[glink color="black" size="18" x="300" y="400" text="いいえ" exp="" cond="" target="*stage_select"]
[s]

*doubles
分身使いと戦いますか？[p]
敗北ペナルティ：幻覚[p]
[glink color="black" size="18" x="300" y="300" text="は　い" exp="" cond="" target="*start"]
[glink color="black" size="18" x="300" y="400" text="いいえ" exp="" cond="" target="*stage_select"]
[s]

*wizard
呪術使いと戦いますか？[p]
敗北ペナルティ：淫紋[p]
[glink color="black" size="18" x="300" y="300" text="は　い" exp="" cond="" target="*start"]
[glink color="black" size="18" x="300" y="400" text="いいえ" exp="" cond="" target="*stage_select"]
[s]

*poizoner
蟲使いと戦いますか？[p]
敗北ペナルティ：寄生蟲[p]
[glink color="black" size="18" x="300" y="300" text="は　い" exp="" cond="" target="*start"]
[glink color="black" size="18" x="300" y="400" text="いいえ" exp="" cond="" target="*stage_select"]
[s]

*tamer
鞭使いと戦いますか？[p]
敗北ペナルティ：被虐[p]
[glink color="black" size="18" x="300" y="300" text="は　い" exp="" cond="" target="*start"]
[glink color="black" size="18" x="300" y="400" text="いいえ" exp="" cond="" target="*stage_select"]
[s]

*grappler
針使いと戦いますか？[p]
敗北ペナルティ：膨乳[p]
[glink color="black" size="18" x="300" y="300" text="は　い" exp="" cond="" target="*start"]
[glink color="black" size="18" x="300" y="400" text="いいえ" exp="" cond="" target="*stage_select"]
[s]
