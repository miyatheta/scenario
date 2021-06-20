;敵の基礎ステータス設定

;敵のデータ呼び出し時にリセット実施
*reset_enemy_data
[eval exp="f.En_ATP_Plus = 0, f.En_DFP_Plus = 0 , f.En_DEX_Plus = 0 , f.RES_Plus = 0"]
[eval exp="f.En_Hand1 = 0 , f.En_Hand2 = 0 "]
[eval exp="f.En_Pary = 0"]
[eval exp="f.En_Impotenz= 0"]
[return][s]

*tutor
[call target="*reset_enemy_data"]
[eval exp="f.En_name = '忍者' "]
[eval exp="f.En_HP = 2000 ,f.En_MP_gain =　30 , f.En_ATP = 100, f.En_DEX = 0 , f.En_RES = 10 "]
[eval exp="f.En_Bind = 20 , f.En_BASE_ERO = 30"]
[return][s]

*dogs
[call target="*reset_enemy_data"]
[eval exp="f.En_name = '野犬' "]
[eval exp="f.En_HP = 800 ,f.En_MP_gain =　20 , f.En_ATP = 70, f.En_DEX = 0 , f.En_RES = 20 "]
[eval exp="f.En_Bind = 18 , f.En_BASE_ERO = 30"]
[return][s]

*drunkar
[call target="*reset_enemy_data"]
[eval exp="f.En_name = '酔漢' "]
[eval exp="f.En_HP = 1000 ,f.En_MP_gain =　25 , f.En_ATP = 100, f.En_DEX = -10 , f.En_RES = 0 "]
[eval exp="f.En_Bind = 20 , f.En_BASE_ERO = 50"]
[return][s]

*insect
[call target="*reset_enemy_data"]
[eval exp="f.En_name = '怪虫' "]
[eval exp="f.En_HP = 300 ,f.En_MP_gain =　35 , f.En_ATP = 50, f.En_DEX = 10 , f.En_RES = 30 "]
[eval exp="f.En_Bind = 18 , f.En_BASE_ERO = 0"]
[return][s]

*insector
[call target="*reset_enemy_data"]
[eval exp="f.En_name = '魔怪蟲' "]
[eval exp="f.En_HP = 2000 ,f.En_MP_gain = 24 , f.En_ATP = 100, f.En_DEX = 0 , f.En_RES = 10 "]
[eval exp="f.En_Bind = 22 , f.En_BASE_ERO = 30"]
[return][s]
