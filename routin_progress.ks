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
護衛対象が[emb exp="f.Gd_MOVE"]逃走[p]
[WSs]
[eval exp="f.progress += f.Gd_MOVE"]
[eval exp="f.progress = f.goal"]
[endif]

[if exp="f.progress > f.goal && f.Cleared != 1"]
護衛対象は無事逃げおおせた！！[p]
[eval exp="f.Cleared = 1"]
;逃走完了のアイコン表示
[endif]

[iscript]
f.progressbar = "逃走距離：" + f.progress + "/" + f.goal;
[endscript]
[ptext layer="0" x="150" y="600" text=&f.progressbar size="20" color="black" edge="white" bold="bold" align="left" name="progressbar" overwrite="true" ]

[return]
[s]
