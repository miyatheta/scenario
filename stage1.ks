*start
[freeimage layer="3"][freeimage layer="0"]
[chara_mod name="suzune" face="default" ]
[chara_show name="suzune" left="-100" top="-20"]
#鈴猫
「分かれ道ね・・・」[p]
「さて、どの道を行こうかしら?」[p]
#
*ステージ１ルート選択
[glink color="black" size="16" x="400" y="300" target="*ルート11確認" text="街道をゆく"]
[glink color="black" size="16" x="400" y="350" target="*ルート12確認" text="林道をゆく"]
[glink color="black" size="16" x="400" y="400" target="*ルート13確認" text="川沿いをゆく"]
[s]
*ルート11確認
#
街道をゆくのは目立つかもしれないが、走りやすくはある。
獣や賊の心配も比較的少ないだろう[p]
出現する敵:人型×3[r]
ボス：催眠術師[l]
[glink x="400" y="300" text="この道をゆく" target="*ルート11" ]
[glink x="400" y="400" text="いいえ" target="*ステージ１ルート選択" ]
[s]

*ルート12確認
#
木立の並ぶ林の中を突っ切る。多少は人目を偲ぶ効果はあるだろう。
ただし、獣はいるかもしれないが[p]
出現する敵:獣型×3[r]
ボス：獣使い[l]
[glink x="400" y="300" text="この道をゆく" target="*ルート12" ]
[glink x="400" y="400" text="いいえ" target="*ステージ１ルート選択" ]
[s]

*ルート13確認
#
川沿いにゆけば迷う心配はない。街道に比べれば人目も避けられる。
多少、蛇行しているかもしれないが[p]
出現する敵:虫型×３[r]
ボス：蟲使い[l]
[glink x="400" y="300" text="この道をゆく" target="*ルート12" ]
[glink x="400" y="400" text="いいえ" target="*ステージ１ルート選択" ]
[s]

*ルート11
[set_status]
*ルート11wave1
敵が出現した(11-1)[p]
[eval exp="f.enemy_PATH = 'enemy/tutor.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート11wave2'"]
[jump storage="battle.ks" ]
[s]
*ルート11wave2
敵が出現した(11-2)[p]
[eval exp="f.enemy_PATH = 'enemy/tutor.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート11wave3'"]
[jump storage="battle.ks" ]
[s]
*ルート11wave3
敵が出現した(11-3)[p]
[eval exp="f.enemy_PATH = 'enemy/tutor.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート11wave4'"]
[jump storage="battle.ks" ]
[s]
*ルート11wave4
ボスが出現した(11-4)[p]
[eval exp="f.enemy_PATH = 'enemy/tutor.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート11fin'"]
[jump storage="battle.ks" ]
[s]
*ルート11fin
ルート11をクリアした[p]
[s]


*ルート12
[set_status]
*ルート12wave1
敵が出現した(12-1)[p]
[eval exp="f.enemy_PATH = 'enemy/insect.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート12wave2'"]
[jump storage="battle.ks" ]
[s]
*ルート12wave2
敵が出現した(12-2)[p]
[eval exp="f.enemy_PATH = 'enemy/insect.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート12wave3'"]
[jump storage="battle.ks" ]
[s]
*ルート12wave3
敵が出現した(12-3)[p]
[eval exp="f.enemy_PATH = 'enemy/insect.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート12wave4'"]
[jump storage="battle.ks" ]
[s]
*ルート12wave4
ボスが出現した(12-4)[p]
[eval exp="f.enemy_PATH = 'enemy/insect.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート12fin'"]
[jump storage="battle.ks" ]
[s]
*ルート12fin
ルート12をクリアした[p]
[s]


*ルート13
[set_status]
*ルート13wave1
[glink x="400" y="400" text="通常" storage="battle.ks" exp="f.enemy_PATH = 'enemy/tutor.ks'"]
敵が出現した(13-1)[p]
[eval exp="f.enemy_PATH = 'enemy/tutor.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート13wave2'"]
[jump storage="battle.ks" ]
[s]
*ルート13wave2
敵が出現した(13-2)[p]
[eval exp="f.enemy_PATH = 'enemy/tutor.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート13wave3'"]
[jump storage="battle.ks" ]
[s]
*ルート13wave3
敵が出現した(13-3)[p]
[eval exp="f.enemy_PATH = 'enemy/tutor.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート13wave4'"]
[jump storage="battle.ks" ]
[s]
*ルート13wave4
ボスが出現した(13-4)[p]
[eval exp="f.enemy_PATH = 'enemy/tutor.ks'"]
[eval exp="f.next_PATH = 'stage1.ks' , f.next_tag = '*ルート13fin'"]
[jump storage="battle.ks" ]
[s]
*ルート13fin
ルート13をクリアした[p]
[s]
