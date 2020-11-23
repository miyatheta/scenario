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
[eval exp="tf.fack_milk = f.milkpoint + 50"]
[eval exp="tf.fack_milk = tf.fack_milk * f.CURSE / 100 + tf.fack_milk"]
[eval exp="tf.argment = tf.fack_milk * f.BOOB / 100 "]
[getMathRound var="tf.fack_milk"]
射乳により追加で[emb exp="tf.fack_milk"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack_milk"][WSs]
[eval exp="f.milkpoint = 0"]
[return]
[s]
