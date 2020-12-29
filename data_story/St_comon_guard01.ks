*start
#
[cm]
@layopt layer=message0 visible=false
[chara_hide name="suzune" time=500]
[freeimage layer="base" ]

[clearstack  stack="call"  ]
[freeimage layer="0" ]
@layopt layer=message0 visible=true
[wait time=1000]

[bg storage="japanese02_evening.jpg" time="500"]
[bg storage="japanese02_night_dark.jpg" time="500"]

[if exp="f.quest_ug01 != 1"]
[jump target="*first"]
[else]
[jump target="*repeat"]
[endif]

*first
#
将軍の屋敷を暗殺者が襲撃した！！[p]
至急、将軍を守り、逃げるまでの時間を稼げ！！[p]
#鈴耶
殿下！！お守りいたします！！[p]
今のうちに避難を！！[p]
[jump storage="data_Quest/comon_guard01.ks" target="*set"]
[s]
;-------------------------------------------------------------------------------
*repeat
#
将軍の屋敷を暗殺者が襲撃した！！[p]
至急、将軍を守り、逃げるまでの時間を稼げ！！[p]
[jump storage="data_Quest/comon_guard01.ks" target="*set"]
[s]
;-------------------------------------------------------------------------------
