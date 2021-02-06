;このファイルは削除しないでください！
;
;make.ks はデータをロードした時に呼ばれる特別なKSファイルです。
;Fixレイヤーの初期化など、ロード時点で再構築したい処理をこちらに記述してください。
;
;-------------------------------------------------------------------------------
[chara_config pos_mode="false" ]

@call storage="macro.ks"
;このゲームで登場するキャラクターを宣言
;suzune
[chara_new name="suzune" storage="chara/suzune/1/普通.png" jname="鈴耶" width=660]
;キャラクターの表情登録
[chara_face name="suzune" face="喘ぎ" storage="chara/suzune/1/喘ぎ.png"]
[chara_face name="suzune" face="普通" storage="chara/suzune/1/普通.png"]
[chara_face name="suzune" face="怒り" storage="chara/suzune/1/怒り.png"]
[chara_face name="suzune" face="絶頂" storage="chara/suzune/1/絶頂.png"]
[chara_face name="suzune" face="柔らか" storage="chara/suzune/1/柔らか.png"]
[chara_face name="suzune" face="厳しい" storage="chara/suzune/1/厳しい.png"]
[chara_face name="suzune" face="苦しみ" storage="chara/suzune/1/苦しみ.png"]
[chara_face name="suzune" face="泣き" storage="chara/suzune/1/泣き.png"]
[chara_face name="suzune" face="レイプ目" storage="chara/suzune/1/レイプ目.png"]

[chara_new name="shogun" storage="chara/shogun/shogun仮.png" jname="善照" ]

[iscript]
f.item=[0,1,2,3,4,5,6,7,8,9];
f.item[0]={name:"治療薬",value:100,stock:1,used:0,cooltime:7};
f.item[1]={name:"治療薬",value:100,stock:1,used:0,cooltime:7};
f.item[2]={name:"治療薬",value:100,stock:1,used:0,cooltime:7};
f.item[3]={name:"万能薬",value:100,stock:1,used:0,cooltime:7};
f.item[4]={name:"鎮静薬",value:100,stock:1,used:0,cooltime:7};
f.item[5]={name:"神気湯",value:100,stock:1,used:0,cooltime:7};
f.item[6]={name:"煙玉",value:100,stock:1,used:0,cooltime:7};
f.item[7]={name:"旅の御守",value:100,stock:1,used:0,cooltime:7};
f.item[8]={name:"理力の御守",value:100,stock:1,used:0,cooltime:7};
f.item[9]={name:"魔除の御守",value:100,stock:1,used:0,cooltime:7};
[endscript]

;[chara_show x="815" y="0" layer="0"]
;make.ks はロード時にcallとして呼ばれるため、return必須です。
[return]
