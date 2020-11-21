*orgasm
#
[if exp="f.ERO >= 1000 && f.endure > 0"]
『耐える』の効果により、鈴耶は絶頂をぎりぎりで堪えた[p]
[eval exp="f.ERO = 999 , f.endure = 0"]
[WSs]

[elsif exp="f.ERO >= 1000"]
鈴耶は絶頂した[p]
[eval exp="f.orgasmpoint += 1"]
[endif]

[return]
[s]

*milk
#
『乳牛化』していた鈴耶の胸からは母乳が迸った[p]
#鈴耶
いやあああああああああっ！！[r]おっぱいでちゃううううっ！！[p]
[eval exp="tf.fack = f.milkpoint + 50"]
[eval exp="tf.fack = tf.fack * f.CURSE / 100 + tf.fack"]
[eval exp="tf.arg = tf.fack * f.BOOB / 100 "]
[getMathRound var="tf.fack"]
射乳により追加で[emb exp="tf.fack"]の快感を受けた[p]
[eval exp="f.ERO = f.ERO + tf.fack"][WSs]
[eval exp="f.milkpoint = 0"]
[return]
[s]
