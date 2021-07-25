*start
[freeimage layer="3"][freeimage layer="0"]
[chara_mod name="suzune" face="default" ]
[chara_show name="suzune" left="-100" top="-20"]
[bg2 storage="mori_yoru.jpg" time="100"]
[set_status]

*1stStage
;初遭遇の場合
#
森をゆく鈴羽は異様な音を聞きつける[p]
何かが這いずるような音[p]
異様な生き物が襲いかかってくる[p]
#鈴羽
何なの！？こいつは！？[p]
#蟲使い
・・・そいつは鬼岩蟲という[p]
われわれが代々、育てている生きた忍具よ[p]
#
虫の背後の闇から男が進み出てくる[p]
#蟲使い
顎は骨を砕き、巻き付けば窒息に至らしめる奈落の虫[p]
獲物はけして逃さん[p]
[call target="*1stContact"]
#鈴羽
どいてもらうわよ！！[p]
[jump target="*battle_start"]
[s]

*1stContact
;初めての対戦相手の場合
#蟲使い
・・・ようこそ、くノ一。われらが外縛陣に[p]
#
げばくじん[r]
忍びが侵入者を捉えるために敷く包囲陣形のことである[p]
#鈴羽
（さっきの橋の発破もこの山に追い込むためだったのね？）[p]
（まんまと誘い込まれた）[p]
#蟲使い
武多家の伝令。その内容を吐いてもらおうか？[p]
#鈴羽
（こちらの動向は掴まれてる、と・・・）[p]
#
状況は良くない。男の言葉は偶然どこかの斥候に見つかったのではなく
鈴羽を待ち伏せていたことを物語っている[p]
#鈴羽
（それでも・・・）[p]
#
隙を探るべくすり足で動く鈴羽を威嚇するように２引きの虫が鎌首をもたげた[p]
[return]

*Upper2ndStage
;遭遇が２回目以降の場合
森を走る鈴羽は突如、木の幹を蹴りつけ背後に蜻蛉返りを打った[p]
間髪入れずに樹上から降ってきた虫の顎が、本来鈴羽の頭があった場所を通過していった[p]
#蟲使い
・・・ほう。鋭い女だ。我が鬼岩蟲の奇襲を躱すとは[p]
#
陰鬱な声とともに闇の中から男が現れる[p]
#蟲使い
こんどこそ逃さぬぞくノ一[p]
捕らえて我が虫の餌食としてくれよう[p]
#鈴羽
やれるものならやってみなさい！！
[jump target="*battle_start"]
[s]

;７回戦以降の場合
[jump target="*battle_start"]
[s]

;最終戦の場合
[jump target="*battle_start"]
[s]

*battle_start
敵が出現した[p]
[reset_enemy_data]
[eval exp="f.enemy_PATH = 'enemy/insector.ks'"]
[eval exp="f.En_name = '蟲使い' "]
[eval exp="f.En_HP = 2000 ,f.En_MP_gain =　25 , f.En_ATP = 100, f.En_DEX = -10 , f.En_RES = 0 "]
[eval exp="f.En_Bind = 20 , f.En_BASE_ERO = 50"]
[eval exp="f.next_PATH = 'stage/win_insector.ks' , f.next_tag = '*start'"]
[jump storage="battle.ks" ]
[s]
