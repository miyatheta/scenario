*start
[eval exp="f.MOVE = f.MOVE_MAX + f.arms_mov"]
[eval exp="f.MOVE -= 3 " cond="f.slowly > 0"]
[WSs]
[eval exp="f.progress += f.MOVE"]

[if exp="f.progress > f.goal"]
[eval exp="f.progress = f.goal"]
[endif]
[progressbar]
[return]
[s]

*guard
[if exp="f.Cleared != 1"]
[eval exp="f.Gd_MOVE = f.Gd_MOVE_MAX "]
[eval exp="f.Gd_MOVE -= 3 " cond="f.Gd_slowly > 0"]
[eval exp="f.progress += f.Gd_MOVE"]
護衛対象が[emb exp="f.Gd_MOVE"]逃走[p]
[WSs]
[call target="*select_event"]
[endif]

[if exp="f.progress > f.goal"]
[eval exp="f.progress = f.goal"]
[endif]

[if exp="f.progress >= f.goal && f.Cleared != 1"]
護衛対象は無事逃げおおせた！！[p]
[eval exp="f.Cleared = 1"]
;逃走完了のアイコン表示
[eval exp="f.cantescape = 0"]
逃走が可能になった！！[p]
[endif]

[iscript]
f.progressbar = "逃走距離：" + f.progress + "/" + f.goal;
[endscript]
[ptext layer="0" x="150" y="600" text=&f.progressbar size="20" color="black" edge="white" bold="bold" align="left" name="progressbar" overwrite="true" ]

[return]
[s]

;-------------------------------------------------------------------------------

*select_event
;[eval exp="f.Pre_event = 0"]
[getrand min="1" max="100" var="f.event"]

[if exp="f.event<=20 && f.Pre_event != 1"]
[eval exp="f.Pre_event = 1"]
しかし、慌てた護衛対象は転倒してしまった[p]
逃走距離が3減少[p]
[eval exp="f.progress -= 3"][WSs]
[return]

[elsif exp="f.event<=40 && f.Pre_event != 2"]
[eval exp="f.Pre_event = 2"]
護衛対象は必死に走った[p]
逃走距離が2上昇[p]
[eval exp="f.progress += 2"]
[return]

[else]
;普通に前進
[return]

[endif]
[return]
[s]
