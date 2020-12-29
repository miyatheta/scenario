*start
@layopt layer=message0 visible=true
#鈴耶
それじゃあ、鈴耶[r]
行ってまいります！[p]

;-------------------------------------------------------------------------------
*場面転換
[cm]
@layopt layer=message0 visible=false
[chara_hide name="suzune" time=500]
[freeimage layer="base" ]
[wait time=1000]
[bg storage="japanese04_night_dark.jpg" time="500"]

;-------------------------------------------------------------------------------
@layopt layer=message0 visible=true
[chara_show name="suzune" face="普通" left="-100" top="-20"]

[if exp="f.Qt_n_intrude01 != 1"]
[jump target="*first"]
[else]
[jump target="*repeat"]
[endif]
[s]

*first
#
北条家と敵対する玄部家から密書を盗み出せ[p]
[jump storage="data_Quest/north_intrude01.ks" target="*mission_start"]
[s]

;-------------------------------
*repeat
#
[jump storage="data_Quest/north_intrude01.ks" target="*mission_start"]
[s]
;-------------------------------------------------------------------------------
