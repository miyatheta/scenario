*start
;状態異常処理
[if exp="f.poison > 0"]
毒により鈴耶の体力が減少[p]
[eval exp="f.HP -= 5"][eval exp="f.HP = 1" cond="f.HP < 0"][WSs]
[endif]

[if exp="f.aphrodisy > 0"]
[eval exp="tf.fuck = f.aphrodisy "]
[eval exp="tf.fuck = tf.fuck * f.CURSE / 100 + tf.fuck"]
欲情効果により鈴耶の快感[emb exp="tf.fuck"]が上昇[p]
[eval exp="f.ERO = tf.fuck + f.aphrodisy"][eval exp="f.ERO = 999" cond="f.ERO < 1000"][WSs]
[endif]

;状態異常終了メッセージ--------------------------------------------------------------
[if exp="f.poison == 1"]
鈴耶は毒状態から回復した[p]
[eval exp="f.poison = 0"]
[endif]

[if exp="f.excite == 1"]
鈴耶は興奮状態から回復した[p]
[eval exp="f.excite = 0"]
[endif]

[if exp="f.slowly == 1"]
[eval exp="f.MOVE += 3"][WSs]
鈴耶は鈍足状態から回復した[p]
[eval exp="f.slowly = 0"]
[endif]

;[if exp="f.aphrodisy == 1"]
;鈴耶は欲情状態から回復した[p]
;[endif]

;表情変更
[call storage="asset/As_face.ks" target="*quest"]

;状態異常ターン減少-----------------------------------------------------------------
[eval exp="f.poison -= 1" cond="f.poison > 0"]
[eval exp="f.excite -= 1" cond="f.excite > 0"]
[eval exp="f.slowly -= 1" cond="f.slowly > 0"]
[WSs]

;スキルCTターン減少-----------------------------------------------------------------
[eval exp="f.skill_01CT -= 1" cond="f.skill_01CT > 0"]
[eval exp="f.skill_02CT -= 1" cond="f.skill_02CT > 0"]
[eval exp="f.skill_03CT -= 1" cond="f.skill_03CT > 0"]

;移動終了処理---------------------------------------------------------------------
[eval exp="f.turn += 1"]
[eval exp="f.ERO = f.ERO - f.SAN" cond="f.excite == 0"]
[eval exp="f.ERO = 0" cond="f.ERO < 0"]
[WSs]

[return]
[s]
