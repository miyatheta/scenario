*bochu_select
[glink color="rosy" target="*bochu01" x="450" y="190" width="" height="" text="吸精の術" ]
[glink color="rosy" target="*bochu02" x="450" y="280" width="" height="" text="毒身の術" ]
[glink color="rosy" target="*bochu03" x="450" y="370" width="" height="" text="爛心の術" ]
[glink color="rosy" target="*bochu04" x="450" y="460" width="" height="" text="骨抜の術" ]
[glink color="rosy" target="*bochu05" x="450" y="550" width="" height="" text="魂喰の術" ]
[s]

*bochu01
#鈴耶
「吸精の術！」[p]
#
鈴耶の膣がさらなる射精を促すように肉棒を搾り上げる[p]
あまりの快感に敵は魔羅を中心に全身の力が抜けけていくような感覚を覚えた[p]
鈴耶は敵から体力を吸収した[p]
[eval exp="f.MP -= 50"]
[eval exp="f.HP += 100" ][eval exp="f.HP = 2000" cond="f.HP > 2000"]
[eval exp="f.en_HP -= 100" ][eval exp="f.en_HP = 1" cond="f.en_HP < 1"][WSs]
[jump target="*shasei"][s]

*bochu02
#鈴耶
「毒身の術！」[p]
#
鈴耶の肌を濡らす汗が、熱い吐息がたちまち毒へと変じる[p]
甘い吐息に敵が目眩を覚えたときには、触れ合う肌から毒の侵蝕が始まっていた[p]
敵から毒状態になった[p]
[eval exp="f.MP -= 50"]
[eval exp="f.En_Poison += 1 " ][WSs]
[jump target="*shasei"][s]

*bochu03
#鈴耶
「爛心の術！」[p]
#
鈴耶の膣が蠢き、複雑怪奇な刺激に射精したまま魔羅が異常な勃起を起こす[p]
陰茎を中心に体中の血が沸き立ち、獣性に満ちた衝動が理性を塗りつぶした[p]
敵の攻撃力が上昇、命中率が減少した[p]
[eval exp="f.MP -= 50"]
[eval exp="f.En_Bersuk = 1 ,f.En_Bersuk_Time = 5 " ][WSs]
[jump target="*shasei"][s]

*bochu04
#鈴耶
「骨抜の術！」[p]
#
鈴耶の愛液で濡れそぼった膣がうねり、射精を続ける魔羅を熱く包み込んだ[p]
十重二十重に打ち寄せる快感は敵の脳裏を桃色に染め上げ、その意識に霞をかけた[p]
敵の攻撃力、防御力が減少した[p]
[eval exp="f.MP -= 50"]
[eval exp="f.En_Weaken = 1 ,f.En_Weaken_Time = 5 " ][WSs]
[jump target="*shasei"][s]

*bochu05
#鈴耶
「魂喰の術！」[p]
#
鈴耶の膣が収縮を繰り返し、射精を続ける魔羅を猛然と扱き上げる[p]
終わることのない快楽に、敵は精魂を貪られていくような感覚に襲われた[p]
鈴耶の気力が増加した[p]
[eval exp="f.MP -= 50"]
[eval exp="f.MP += 100" ][eval exp="f.MP = 100" cond="f.MP > 100"][WSs]
[jump target="*shasei"][s]

*shasei
[getrand min="10" max="&f.SEX" var="f.rand"]
[eval exp="f.EN_SAN -= f.rand"]
敵の理性が[emb exp="f.rand"]低下[p]
[WriteEnemy]
[return]
[s]
