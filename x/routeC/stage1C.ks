*start
[set_status]
夜空に浮かぶのは薄い三日月[p]
その儚い輝きも鍛え上げた夜目を持つ鈴猫にとっては十分な明かりとなる[p]
むしろ[p]
（・・・いっそ新月か曇りなら好都合だったのに）[p]
鈴猫は眉根を寄せながら河原を疾風のごとく駆けていく[p]
余人には見通せぬ夜闇だが、それは尋常な人が相手であればだ[p]
特殊な修練を積んだ者、鼻の利く獣、人外の妖物[p]
そうしたものが相手なら話は別だ[p]
鈴猫はそうしたものを十分に警戒しながら走っていた[p]
だが、次の瞬間に彼女の前に立ちふさがったものは完全に予想外のものだった[p]
いや、そいつらは立っていなかった[p]
羽を羽ばたかせ、茂みの中から飛びだしてきたのだ[p]
「きゃあっ！！」[p]
顔めがけて突進してきた虫の群れをすんでのところで躱す[p]
受け身を取って振り返った鈴猫が目にしたのは子供の拳大の甲虫の群れだった[p]
「何なの！？こいつらは！！」[p]
*stage1Cwave1
怪虫(丙)が出現した(13-1)[p]
[reset_enemy_data]
[eval exp="f.enemy_PATH = 'enemy/insect.ks'"]
[eval exp="f.En_name = '怪虫' "]
[eval exp="f.En_HP = 300 ,f.En_MP_gain =　35 , f.En_ATP = 30, f.En_DEX = 10 , f.En_RES = 30 "]
[eval exp="f.En_Bind = 18 , f.En_BASE_ERO = 0"]
[eval exp="f.next_PATH = 'stage1C.ks' , f.next_tag = '*stage1C-2' , f.defeat_tag = '*stage1C道中敗北' "]
[jump storage="battle.ks" ]
[s]
*stage1C-2
#鈴猫
いったい何なのこいつらは・・・？[p]
（真っ当な生き物じゃないわね・・・）[p]
#
忍びの中には獣から果ては妖物に近いものまでを操る「口寄せの術」の使い手もいる[p]
これも何者かが口寄せしたものかもしれない[p]
推測を巡らす鈴猫は近づいてくる羽音を察知した[p]
#鈴猫
くっ！また来たわね？[p]
#
*stage1Cwave2
怪虫乙が出現した(13-2)[p]
[reset_enemy_data]
[eval exp="f.enemy_PATH = 'enemy/insect.ks'"]
[eval exp="f.En_name = '怪虫' "]
[eval exp="f.En_HP = 450 ,f.En_MP_gain =　35 , f.En_ATP = 40, f.En_DEX = 10 , f.En_RES = 30 "]
[eval exp="f.En_Bind = 18 , f.En_BASE_ERO = 0"]
[eval exp="f.next_PATH = 'stage1C.ks' , f.next_tag = '*stage1C-3' , f.defeat_tag = '*stage1C道中敗北' "]
[jump storage="battle.ks" ]
[s]
*stage1C-3
#鈴猫
(さっきより大きい！？)[p]
#
早くこの場を離れたほうが良い[p]
鈴猫はそう判断して即座に走り出した[p]
耳を澄まし、茂みの動きに神経を尖らせながら疾風のごとく駆ける鈴猫[p]
しかし、彼女は敵が羽を持つことにもう少し気をつけるべきだったかもしれない[p]
虫の知らせ。皮肉な表現だが、嫌な予感に従い鈴猫が身を投げだすと[p]
同時に中空から急降下した虫が頭上を掠めていった[p]
その速度と外皮の硬さを思えば、もし直撃したら石礫ほどの威力があっただろう[p]
#鈴猫
簡単には巻けないというワケね[p]
#
ぞっとしながら鈴猫はこれまでより更に大きな虫に向き合った[p]
*stage1Cwave3
怪虫甲が出現した(13-3)[p]
[reset_enemy_data]
[eval exp="f.enemy_PATH = 'enemy/insect.ks'"]
[eval exp="f.En_name = '怪虫' "]
[eval exp="f.En_HP = 600 ,f.En_MP_gain =　35 , f.En_ATP = 50, f.En_DEX = 10 , f.En_RES = 30 "]
[eval exp="f.En_Bind = 18 , f.En_BASE_ERO = 0"]
[eval exp="f.next_PATH = 'stage1C.ks' , f.next_tag = '*stage1C-4' , f.defeat_tag = '*stage1C道中敗北' "]
[jump storage="battle.ks" ]
[s]
*stage1C-4

*stage1Cwave4
ボスが出現した(13-4)[p]
[reset_enemy_data]
[eval exp="f.enemy_PATH = 'enemy/insector.ks'"]
[eval exp="f.En_name = '怪虫' "]
[eval exp="f.En_HP = 300 ,f.En_MP_gain =　35 , f.En_ATP = 50, f.En_DEX = 10 , f.En_RES = 30 "]
[eval exp="f.En_Bind = 18 , f.En_BASE_ERO = 0"]
[eval exp="f.next_PATH = 'stage1C.ks' , f.next_tag = '*stage1Cfin' , f.defeat_tag = '*stage1Cボス敗北' "]
[jump storage="battle.ks" ]
[s]

*stage1C道中敗北
#？？？
ほう・・・。索敵用の虫だけで片がつくとは拍子抜けだな・・・[p]
#
奇怪な虫に敗北し倒れ伏した鈴猫の前に何者かが立った[p]
#鈴猫
だ、誰・・・？[p]
#
鈴猫は朦朧としたまま這って距離を取ろうとする[p]
#？？？
ほう、まだ意識があるのか？[p]
#
声とともに鈴猫の首筋に鋭い痛みが走ると、急速に視界が闇に閉ざされていく[p]
#鈴猫
（ま、まずい・・・。う、上様・・・）[p]
#
蟲忍の麻酔により鈴猫は完全に意識を失った[p]
[jump storage="prison/Mushi.ks"]
;どこで捕まったかによって情景が変わるので情景描写はここに入れる
;敵と初対面かどうかの条件分岐も行う
[s]

*stage1Cボス敗北
#蟲忍
ふふふ、勝負あったな[p]
#鈴猫
うっ・・・、こ、こんなところでぇ・・・[p]
#蟲忍
ほう、まだ意識があるのか？[p]
#
驚きの声を漏らした蟲忍は這いつくばった鈴猫を覗き込んでニヤリと笑った[p]
#蟲忍
ひょっとしたら、お前には情報を吐いてもらう以外の使い途もあるかもしれんな[p]
#鈴猫
くっ！！・・・[p]
#蟲忍
おおっと！自害などされては敵わんな[p]
#
言葉とともに鈴猫の首筋に鋭い痛みが走った[p]
#鈴猫
（ま、まずい・・・。う、上様・・・）[p]
#
何らかの薬物の効果か、鈴猫の意識は一瞬で闇の中へと沈んでしまった[p]
[jump storage="prison/Mushi.ks"]
;場面転換にアイキャッチを入れたほうが良い
;どこで捕まったかによって情景が変わるので情景描写はここに入れる
[s]

*stage1Cfin
route13をクリアした[p]
;クリアレコードを表示

;ステージ２へのインタールード
#妖術師
蟲忍がやられたようだな[p]
#獣忍
しかし、奴は最弱・・・云々[p]
#
蟲忍以外の二人からルート選択[p]
[eval exp="f.past_route = 3"]
[jump storage="stage2/stage2.ks"]
[s]
