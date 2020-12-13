;Good
*heal_potion
#
回復薬を見つけた[r]
鈴耶の体力が回復した[p]
[eval exp="f.HP += 100" ][eval exp="f.HP = 1000" cond="f.HP > 1000"]
[return]
[s]

*Witness_meating
#
通りがかった部屋の中から声がするので覗いてみた[p]
どうやら重要な話し合いのようだ[r]
念の為に内容と人相を覚えておくことにした[p]
鈴耶の集中力が増加した[p]
[eval exp="f.MND += 1" ][eval exp="f.MND = 5" cond="f.MND > 5"]
[return]
[s]

*get_fruits
#
果物を見つけた[r]
鈴耶の気力が増加した[p]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[return]
[s]

*sleeping_guard
#
見回りが居眠りをしている[r]
進行度が上昇した[p]
[eval exp="f.progress += 10"][eval exp="f.progress = f.goal" cond="f.progress > f.goal"]
[progressbar]
[return]
[s]

*forest_shortcut
#
抜け道を発見した[r]
進行度が上昇した[p]
[eval exp="f.progress += 10"][eval exp="f.progress = f.goal" cond="f.progress > f.goal"]
[return]
[s]

*spring_water
#
湧き水を見つけた[r]
鈴耶の集中力が増加した[p]
[eval exp="f.MND += 1" ][eval exp="f.MND = 5" cond="f.MND > 5"]
[return]
[s]

*stone_statue
#
お地蔵様を見つけた[r]
鈴耶の気力が増加した[p]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[return]
[s]

*healing_herbs
#
薬草を見つけた[r]
鈴耶の体力が回復した[p]
[eval exp="f.HP += 100" ][eval exp="f.HP = 1000" cond="f.HP > 1000"]
[return]
[s]

;Bad------------------------------------------------------------------------------

*ghost_room
#
通りがかった部屋の中から声がするので覗いてみた[p]
しかし、誰もいなかった[r]背筋がゾクッとした[p]
鈴耶の気力が減少した[p]
[eval exp="f.MP -= 10" ][eval exp="f.MP = 0" cond="f.MP < 0"][WSs]
[return]
[s]

*sm_room
#
通りがかった部屋の中から声がするので覗いてみた[p]
荒縄で縛られた全裸の男が女中に踏まれている[p]
鈴耶の気力が減少した[p]
[eval exp="f.MP -= 10" ][eval exp="f.MP = 0" cond="f.MP < 0"][WSs]
[return]
[s]

*standing_guard
#
見廻りが立っている[p]
仕方がないので迂回することにした[p]
[eval exp="f.progress -= 10"][eval exp="f.progress = 0" cond="f.progress < 0"]
[return]
[s]

*torimochi
#
トリモチに足を取られた[p]
鈴耶は鈍足状態になった[r]一時的に移動力が低下した[p]
[if exp="f.slowly == 0"]
;効果は重複しないのでf.slowly == 0のときだけ減算する
[eval exp="f.MOVE -= 3"][eval exp="f.MOVE = 1" cond="f.MOVE < 1"]
[endif]
[eval exp="f.slowly = 5" ][eval exp="f.slowly = 5" cond="f.slowly > 5"][WSs]
[return]
[s]

*screaming_cat
#
うっかり猫の尾を踏んでしまった[p]
猫が悲鳴を上げた[r]周囲の警戒度が上昇した[p]
[eval exp="f.warning += 10" ][WSs]
[return]
[s]

*romance_room
#
通りがかった部屋の中から声がするので覗いてみた[p]
女中と侍が情事の最中だった[p]
鈴耶は興奮状態になった[r]一時的に快感が減少しなくなった[p]
[eval exp="f.excite = 5" ][eval exp="f.excite = 5" cond="f.excite > 5"][WSs]
[return]
[s]

*strange_flower
#
あやしげな花の花粉を吸った[p]
興奮状態になった[p]一時的に快感が減少しなくなった[p]
[eval exp="f.excite = 5" ][eval exp="f.excite = 5" cond="f.excite > 5"][WSs]
[return]
[s]

*poison_spider
#
毒蜘蛛に噛まれた[p]
毒状態になった[p]一時的に行動のたびにダメージを受ける[p]
[eval exp="f.poison = 5" ][eval exp="f.poison = 5" cond="f.poison > 5"][WSs]
[return]
[s]

*muddy_swanp
#
ぬかるみに足を取られた[p]
鈍足状態になった[p]一時的に移動力が低下した[p]
[if exp="f.slowly == 0"]
;効果は重複しないのでf.slowly == 0のときだけ減算する
[eval exp="f.MOVE -= 3"][eval exp="f.MOVE = 1" cond="f.MOVE < 1"]
[endif]
[eval exp="f.slowly = 5" ][eval exp="f.slowly = 5" cond="f.slowly > 5"][WSs]
[return]
[s]

*landslide_roundabout
#
足場が崩れている[l]仕方ないので回り道をした[p]進行度が減少した[p]
[eval exp="f.progress -= 10"][eval exp="f.progress = 0" cond="f.progress < 0"][WSs]
[return]
[s]

*watch_ghost
#
動く影を見つけた[l][r]
影はこちらを見るとニタリと笑って消えた[p]
鈴耶の気力が減少した[p]
[eval exp="f.MP -= 15" ][eval exp="f.MP = 0" cond="f.MP < 0"][WSs]
[return]
[s]
