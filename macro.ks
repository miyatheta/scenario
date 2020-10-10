*macros

[eval exp="f.PL_MOVE=10"]

[macro name="progressbar"]
[eval exp="f.progress = f.goal" cond="f.progress > f.goal"]
[iscript]
f.progressbar = f.progress + "/" + f.goal;
f.pos_pb = f.progressbar.length * (-30) + 1280;
[endscript]
[ptext  layer="0"  x=&f.pos_pb  y="540"  text=&f.progressbar 　size="50"  color="black"  bold="bold"  name="progressbar"  overwrite="true" ]
[endmacro]

[return]
