*start
[set_status]
*stage1Awave1
敵が出現した(11-1)[p]
[reset_enemy_data]
[eval exp="f.enemy_PATH = 'enemy/drunkar.ks'"]
[eval exp="f.En_name = '酔漢' "]
[eval exp="f.En_HP = 1000 ,f.En_MP_gain =　25 , f.En_ATP = 100, f.En_DEX = -10 , f.En_RES = 0 "]
[eval exp="f.En_Bind = 20 , f.En_BASE_ERO = 50"]
[eval exp="f.next_PATH = 'stage1A.ks' , f.next_tag = '*stage1Awave2'"]
[jump storage="battle.ks" ]
[s]
*stage1Awave2
敵が出現した(11-2)[p]
[reset_enemy_data]
[eval exp="f.enemy_PATH = 'enemy/drunkar.ks'"]
[eval exp="f.En_name = '酔漢' "]
[eval exp="f.En_HP = 1000 ,f.En_MP_gain =　25 , f.En_ATP = 100, f.En_DEX = -10 , f.En_RES = 0 "]
[eval exp="f.En_Bind = 20 , f.En_BASE_ERO = 50"]
[eval exp="f.next_PATH = 'stage1A.ks' , f.next_tag = '*stage1Awave3'"]
[jump storage="battle.ks" ]
[s]
*stage1Awave3
敵が出現した(11-3)[p]
[reset_enemy_data]
[eval exp="f.enemy_PATH = 'enemy/drunkar.ks'"]
[eval exp="f.En_name = '酔漢' "]
[eval exp="f.En_HP = 1000 ,f.En_MP_gain =　25 , f.En_ATP = 100, f.En_DEX = -10 , f.En_RES = 0 "]
[eval exp="f.En_Bind = 20 , f.En_BASE_ERO = 50"]
[eval exp="f.next_PATH = 'stage1A.ks' , f.next_tag = '*stage1Awave4'"]
[jump storage="battle.ks" ]
[s]
*stage1Awave4
ボスが出現した(11-4)[p]
[reset_enemy_data]
[eval exp="f.enemy_PATH = 'enemy/drunkar.ks'"]
[eval exp="f.En_name = '酔漢' "]
[eval exp="f.En_HP = 1000 ,f.En_MP_gain =　25 , f.En_ATP = 100, f.En_DEX = -10 , f.En_RES = 0 "]
[eval exp="f.En_Bind = 20 , f.En_BASE_ERO = 50"]
[eval exp="f.next_PATH = 'stage1A.ks' , f.next_tag = '*stage1Afin'"]
[jump storage="battle.ks" ]
[s]
*stage1Afin
route11をクリアした[p]
[s]
