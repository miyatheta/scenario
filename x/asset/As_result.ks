*cleared
[cm][clearfix][freeimage layer=1]
#
[eval exp="f.skill_01CT=0 , f.skill_02CT=0 , f.skill_03CT=0"]
[eval exp="f.keibi -= 8"]
[eval exp="f.turn = 0"]
[eval exp="f.dress=1"][call storage="asset/As_face.ks"]
[chara_mod name="suzune" face="柔らか" ]
[return]

*failed
[cm][clearfix][freeimage layer=1]
#
[eval exp="f.skill_01CT=0 , f.skill_02CT=0 , f.skill_03CT=0"]
[eval exp="f.keibi -= 8"]
[eval exp="f.turn = 0"]
[eval exp="f.dress=2"][call storage="asset/As_face.ks"]
[chara_mod name="suzune" face="泣き" ]
[return]
