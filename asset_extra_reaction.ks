*orgasm
#
[if exp="f.ERO >= 1000 && f.endure > 0"]
『耐える』の効果により、鈴耶は絶頂をぎりぎりで堪えた[p]
[eval exp="f.ERO = 999 , f.endure = 0"]
[WSs]

[elsif exp="f.ERO >= 1000"]
「鈴耶の絶頂」[p]
[eval exp="f.orgasmpoint += 1"]
[endif]

[return]
[s]

*milk
#
『爆乳化』していた鈴耶の胸からは母乳が迸った[p]
#鈴耶
いやあああああああああっ！！[r]おっぱいでちゃううううっ！！[p]
[eval exp="tf.fuck_milk = f.milkpoint + 50"]
[eval exp="tf.fuck_milk = tf.fuck_milk * f.CURSE / 100 + tf.fuck_milk"]
[eval exp="tf.argment = tf.fuck_milk * f.BOOB / 100 "]
[getMathRound var="tf.fuck_milk"]
射乳により追加で[emb exp="tf.fuck_milk"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fuck_milk"][WSs]
[eval exp="f.milkpoint = 0"]
[return]
[s]
