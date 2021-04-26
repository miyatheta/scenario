*macros

;----------------------------------------------------------------------------------------
;カード関係
;----------------------------------------------------------------------------------------
[macro name="Initialize_Cards"]
;Cards=カードの情報を収めた連想(ハッシュ・辞書)配列(=オブジェクト)を収めた配列(多次元配列)を作成。
;Deck=カードのidを並べたもの。
[iscript]
f.Cards=[
{color:"red",value:1,active:1,txt:"赤1"},
{color:"red",value:2,active:1,txt:"赤2"},
{color:"red",value:3,active:1,txt:"赤3"},
{color:"red",value:4,active:1,txt:"赤4"},
{color:"red",value:5,active:1,txt:"赤5"},
{color:"red",value:6,active:1,txt:"赤6"},
{color:"red",value:7,active:1,txt:"赤7"},
{color:"red",value:8,active:1,txt:"赤8"},
{color:"red",value:9,active:1,txt:"赤9"},
{color:"red",value:10,active:1,txt:"赤十"},
{color:"red",value:10,active:1,txt:"赤月"},
{color:"red",value:10,active:1,txt:"赤花"},
{color:"red",value:10,active:1,txt:"赤雪"},
{color:"blue",value:1,active:1,txt:"青1"},
{color:"blue",value:2,active:1,txt:"青2"},
{color:"blue",value:3,active:1,txt:"青3"},
{color:"blue",value:4,active:1,txt:"青4"},
{color:"blue",value:5,active:1,txt:"青5"},
{color:"blue",value:6,active:1,txt:"青6"},
{color:"blue",value:7,active:1,txt:"青7"},
{color:"blue",value:8,active:1,txt:"青8"},
{color:"blue",value:9,active:1,txt:"青9"},
{color:"blue",value:10,active:1,txt:"青十"},
{color:"blue",value:10,active:1,txt:"青月"},
{color:"blue",value:10,active:1,txt:"青花"},
{color:"blue",value:10,active:1,txt:"青雪"},
{color:"green",value:1,active:1,txt:"緑1"},
{color:"green",value:2,active:1,txt:"緑2"},
{color:"green",value:3,active:1,txt:"緑3"},
{color:"green",value:4,active:1,txt:"緑4"},
{color:"green",value:5,active:1,txt:"緑5"},
{color:"green",value:6,active:1,txt:"緑6"},
{color:"green",value:7,active:1,txt:"緑7"},
{color:"green",value:8,active:1,txt:"緑8"},
{color:"green",value:9,active:1,txt:"緑9"},
{color:"green",value:10,active:1,txt:"緑十"},
{color:"green",value:10,active:1,txt:"緑月"},
{color:"green",value:10,active:1,txt:"緑花"},
{color:"green",value:10,active:1,txt:"緑雪"},
{color:"orange",value:1,active:1,txt:"黄1"},
{color:"orange",value:2,active:1,txt:"黄2"},
{color:"orange",value:3,active:1,txt:"黄3"},
{color:"orange",value:4,active:1,txt:"黄4"},
{color:"orange",value:5,active:1,txt:"黄5"},
{color:"orange",value:6,active:1,txt:"黄6"},
{color:"orange",value:7,active:1,txt:"黄7"},
{color:"orange",value:8,active:1,txt:"黄8"},
{color:"orange",value:9,active:1,txt:"黄9"},
{color:"orange",value:10,active:1,txt:"黄十"},
{color:"orange",value:10,active:1,txt:"黄月"},
{color:"orange",value:10,active:1,txt:"黄花"},
{color:"orange",value:10,active:1,txt:"黄雪"},
];
f.Deck = [];
n = f.Cards.length;
for( i=0 ; i<n ; i++){f.Deck.push(i);}
[endscript]
[endmacro]

[macro name="DeckShuffle"]
DeckShuffle[p]
;Deckはシャッフルした山札(ただしカード自体ではなくカードの位置nの列。引き換え番号みたいなもの）
[iscript]
for(i = f.Deck.length - 1; i >= 0; i--){
    var r = Math.floor(Math.random() * (i + 1));
    var tmp = f.Deck[i];
    f.Deck[i] = f.Deck[r];
    f.Deck[r] = tmp;
}
[endscript]
[endmacro]

[macro name="Calc_Card"]
;各色の数値を計算
[iscript]
f.Red=0,f.Green=0,f.Blue=0,f.Black=0;
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "red"){f.Red += f.Cards[f.Hand[i]]['value'];}
}
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "green"){f.Green += f.Cards[f.Hand[i]]['value'];}
}
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "blue"){f.Blue += f.Cards[f.Hand[i]]['value'];}
}
for(i = 4; i >= 0; i--){
  if(f.Cards[f.Hand[i]]['color'] == "black"){f.Black += f.Cards[f.Hand[i]]['value'];}
}
[endscript]
[endmacro]

[macro name="make_hand"]
;手札作成
;HandにDeckからカード追加
;追加分をDeckから削除
;f.Handも中身は引き換え番号
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]"]
[iscript]
f.Deck.splice(0,5);
[endscript]
[endmacro]

[macro name="DeActivate"]
;すべての手札を使用済みに
[iscript]
f.Cards[f.Hand[0]]['active']=0;
f.Cards[f.Hand[1]]['active']=0;
f.Cards[f.Hand[2]]['active']=0;
f.Cards[f.Hand[3]]['active']=0;
f.Cards[f.Hand[4]]['active']=0;
[endscript]
[endmacro]

[macro name="ReShuffle"]
;カードのアクティベートとデッキの再構築
[iscript]
d = f.Deck.length;
if(d < 5){
  f.Deck = [];
  n = f.Cards.length;
  for(i=0; i<n; i++){f.Cards[i]['active'] = 1 ;}
  for(i=0; i<n; i++){f.Deck.push(i);}
  for(i = n - 1; i >= 0; i--){
      var r = Math.floor(Math.random() * (i + 1));
      var tmp = f.Deck[i];
      f.Deck[i] = f.Deck[r];
      f.Deck[r] = tmp;
  }
}
[endscript]
[endmacro]

;--------------------------------------------------------------------------------
;スコア表示マクロ
[macro name="show_score"]
[iscript]
f.round_ptxt = f.round + "回";
f.En_DEF_ptxt = "守備力:" + f.En_DEF ;
f.comand_ptxt = "コスト:" + f.comand ;
f.Target_ptxt = "目標値:" + f.Target ;
f.Limit_ptxt = "上限値:" + f.Limit ;
f.Total_ptxt = "合計値:" + f.Total ;
f.Draw1_ptxt = "１手目:" + f.Draw1_txt ;
f.Draw2_ptxt = "２手目:" + f.Draw2_txt ;
f.Draw3_ptxt = "３手目:" + f.Draw3_txt ;
f.Draw4_ptxt = "４手目:" + f.Draw4_txt ;
f.Draw5_ptxt = "５手目:" + f.Draw5_txt ;
f.Bind_ptxt = "拘束力:" + f.Bind ;
[endscript]
[ptext layer="3" x="520" y="0" text=&f.round_ptxt size="30" color="0xffffff" edge="red" bold="bold" align="left" name="Round" overwrite="true" ]
[ptext layer="3" x="630" y="100" text=&f.En_DEF_ptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="En_DEF" overwrite="true" ]
[ptext layer="3" x="630" y="140" text=&f.comand_ptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="comand" overwrite="true" ]
[ptext layer="3" x="630" y="180" text=&f.Target_ptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="Target" overwrite="true"]
[ptext layer="3" x="630" y="220" text=&f.Limit_ptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="Limit" overwrite="true"]
[ptext layer="3" x="410" y="100" text=&f.Total_ptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="Total" overwrite="true"]
[ptext layer="3" x="410" y="140" text=&f.Draw1_ptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw1" overwrite="true"]
[ptext layer="3" x="410" y="180" text=&f.Draw2_ptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw2" overwrite="true"]
[ptext layer="3" x="410" y="220" text=&f.Draw3_ptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw3" overwrite="true"]
[ptext layer="3" x="410" y="260" text=&f.Draw4_ptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw4" overwrite="true"]
[ptext layer="3" x="410" y="300" text=&f.Draw5_ptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw5" overwrite="true"]
[ptext layer="3" x="450" y="50" text=&f.Bind_ptxt size="30" color="0x333631" edge="white" bold="bold" align="left" name="Bind" overwrite="true" cond="f.Rt_Bind > 0"]
[endmacro]
;ラウンド終了時に表示をリブレッシュ
[macro name="reflesh_score"]
[eval exp="f.En_DEF='' ,f.comand='' ,f.Target='' ,f.Limit='' ,f.Total='' "]
[eval exp="f.Draw1_txt='' ,f.Draw2_txt='' ,f.Draw3_txt='' ,f.Draw4_txt='' ,f.Draw5_txt=''"]
[eval exp="f.ATP_red = 0 ,f.RES_green = 0 "]
[show_score]
[endmacro]

;ステータス更新マクロ
[macro name="update_status"]
[iscript]
f.HP_ptxt = "体力:" + f.HP ;
f.MP_ptxt = "気力:" + f.MP ;
f.ERO_ptxt = "快感:" + f.ERO ;
f.En_HP_ptxt = "体力:" + f.En_HP ;
f.En_MP_ptxt = "気力:" + f.En_MP ;
f.En_ERO_ptxt = "興奮度:" + f.En_ERO + "％";
if(f.orgasm>0){
  f.orgasm_ptxt = "絶頂状態" + f.Rt_orgasm;
}else{
  f.orgasm_ptxt = "";
}
[endscript]
[ptext layer="0" x="10" y="620" text=&f.HP_ptxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="HP" overwrite="true" ]
[ptext layer="0" x="10" y="650" text=&f.MP_ptxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="MP" overwrite="true" ]
[ptext layer="0" x="10" y="680" text=&f.ERO_ptxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="ERO" overwrite="true" ]
[ptext layer="0" x="150" y="10" text=&f.orgasm_ptxt size="40" color="0xff1493" edge="white" bold="bold" align="left" name="orgasm" overwrite="true" ]
[ptext layer="0" x="850" y="10" text=&f.En_HP_ptxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="En_HP" overwrite="true" ]
[ptext layer="0" x="850" y="40" text=&f.En_MP_ptxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="En_MP" overwrite="true" ]
[ptext layer="0" x="850" y="70" text=&f.En_ERO_ptxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="En_ERO" overwrite="true" ]

[endmacro]

;--------------------------------------------------------------------------------
[macro name="wt2"]
[wait time="200"][cm]
[endmacro]

[macro name="MND1"]
[eval exp="f.MND += 1" cond="f.MND < 5"][WSs]
[endmacro]

[macro name="MND0"]
[eval exp="f.MND -= 1" cond="f.MND > 0"][WSs]
[endmacro]

[macro name="STRIKE"]
;攻撃威力の算出
[eval exp="f.ATP = f.STR + f.arms_atp + f.acceA_atp + f.acceB_atp"]
[eval exp="f.MGP = f.POW + f.arms_pow + f.acceA_pow + f.acceB_pow"]
[eval exp="tf.argment = (f.ATP * f.DTR) * f.EN_GRD + f.rand"]
;退魔力の算出
[if exp="f.type==2"]
[eval exp="tf.argment = tf.argment / 2 "]
[eval exp="tf.argment = tf.argment + (f.MGP * f.DTR) " cond="f.enchant > 0"]
[eval exp="tf.argment = tf.argment * 3 " cond="f.arms_type == 2 "]
[endif]
;絶頂時の攻撃ダウン
;[eval exp="tf.argment = tf.argment * 0.5 " cond="f.acme > 0"]
[endmacro]

[macro name="AVOIDANCE"]
[eval exp="f.target = (f.SPD - f.en_DEX) * 5 + (f.MND*10) + f.AVD - f.Hitrate"]
[eval exp="f.target = f.target + (f.En_Raptured * 5)"]
[endmacro]

;攻撃成功時
[macro name="ATKED"]
[eval exp="f.MP += 3" ][eval exp="f.MP = 100" cond="f.MP > 100"][WSs]
[endmacro]

;回避時
[macro name="AVOID"]
[eval exp="f.MND += 1" cond="f.MND < 5"][WSs]
[endmacro]

;セクハラ時
[macro name="SKEBE"]
[eval exp="f.MND -= 1" cond="f.MND > 0"][WSs]
;[eval exp="f.MP += 5" ][eval exp="f.MP = 100" cond="f.MP > 100"][WSs]
[endmacro]

;被弾時
[macro name="DAMED"]
;[eval exp="f.MND -= 1" cond="f.MND > 0"]
[eval exp="f.HP = 0" cond="f.HP < 0"][WSs]
[eval exp="f.MP += 5" ][eval exp="f.MP = 100" cond="f.MP > 100"][WSs]
[endmacro]

[macro name="WSs"]
[call storage="routin/Rt_WriteStatus.ks"]
[endmacro]

[macro name="progressbar"]
;[eval exp="f.progress = f.goal" cond="f.progress > f.goal"]
[iscript]
f.progressbar = "進行度：" + f.progress + "/" + f.goal;
[endscript]
[ptext layer="0" x="150" y="600" text=&f.progressbar size="20" color="black" edge="white" bold="bold" align="left" name="progressbar" overwrite="true" ]
[endmacro]

[macro name="progressbar_guard"]
[iscript]
f.progressbar = "逃走距離：" + f.progress + "/" + f.goal;
[endscript]
[ptext layer="0" x="150" y="600" text=&f.progressbar size="20" color="black" edge="white" bold="bold" align="left" name="progressbar" overwrite="true" ]
[endmacro]

[macro name="progressbar_trace"]
[iscript]
f.progressbar = "現在地：" + f.progress + "敵所在：" + f.En_progress + "追跡限界：" + f.goal;
[endscript]
[ptext layer="0" x="150" y="600" text=&f.progressbar size="20" color="black" edge="white" bold="bold" align="left" name="progressbar" overwrite="true" ]
[endmacro]

[macro name="securitybar"]
[eval exp="f.warning = 100" cond="f.warning > 100"]
[iscript]
f.warningLv = "警戒度：" + f.warning ;
f.securityLv = "警戒態勢：" + f.security + "/" + f.security_MAX;
[endscript]
[ptext layer="0" x="150" y="640" text=&f.warningLv size="20" color="black" edge="white" bold="bold" align="left" name="warningbar" overwrite="true" ]
[ptext layer="0" x="150" y="660" text=&f.securityLv size="20" color="black" edge="white" bold="bold" align="left" name="securitybar" overwrite="true" ]
[endmacro]

[macro name="WriteEnemy"]
[iscript]
tf.enNametxt = "敵：" + f.en_Name ;
tf.enSANtxt = "理性：" + f.EN_SAN ;
[endscript]
[ptext layer="0" x="0" y="100" width="1270" text=&tf.enNametxt size="30" color="red" bold="bold" align="right" name="enemyname" overwrite="true" ]
[ptext layer="0" x="0" y="150" width="1270" text=&tf.enSANtxt size="20" color="red" bold="bold" align="right" name="enemysan" overwrite="true" ]
[endmacro]

[macro name="WriteDate"]
[iscript]
tf.txt = f.date + "/60日" ;
if(f.keibi>75){
 tf.homesecurity = "将軍警護：厳重 (" + f.keibi +")";
}else if(f.keibi>50){
 tf.homesecurity = "将軍警護：普通 (" + f.keibi +")";
}else if(f.keibi>25){
 tf.homesecurity = "将軍警護：緩い (" + f.keibi +")";
}else {
 tf.homesecurity = "将軍警護：ザル (" + f.keibi +")";
}
tf.EXPs = "戦功:" + f.EXP + "(/" + f.EXP_Total + ")" ;
[endscript]
[ptext layer="0" x="0" y="0" width="1270" text=&tf.txt size="30" color="black" edge="white" bold="bold" align="right" name="calender" overwrite="true" ]
[ptext layer="0" x="0" y="35" width="1270" text=&tf.homesecurity size="10" color="black" edge="white" bold="bold" align="right" name="homesecurity" overwrite="true" ]
[ptext layer="0" x="0" y="70" width="1270" text=&tf.EXPs size="10" color="black" edge="white" align="right" name="EXPs" overwrite="true" ]
[endmacro]

[macro name="WriteEXP"]
[iscript]
tf.EXPs = "戦功:" + f.EXP + "(/" + f.EXP_Total + ")" ;
[endscript]
[ptext layer="0" x="0" y="70" width="1270" text=&tf.EXPs size="10" color="black" edge="white" align="right" name="EXPs" overwrite="true" ]
[endmacro]

[macro name="Milk"]
[iscript]
tf.milktxt = "乳：" + f.milkpoint ;
[endscript]
[if exp="f.milk > 0"]
[ptext layer="0" x="10" y="300" text=&tf.milktxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="milkpoint" overwrite="true" ]
[endif]
[endmacro]

[macro name="TESTER"]
[if exp="f.bind > 0"]
拘束値：[emb exp="f.bind"]>判定値：[emb exp="f.rand"][p]
[else]
目標値：[emb exp="f.target"]>判定値：[emb exp="f.rand"][p]
[endif]
[endmacro]

[macro name="orgasm"]
鈴猫の理性が１減少した[p]
[eval exp="f.ERO = 0 , f.SAN -= 1 , f.MND = 0"]
[eval exp="f.SAN = 0" cond="f.SAN < 0"]
[eval exp=" tf.argment = tf.fuck / 10"][getMathRound var="f.damage"]
[eval exp="f.HP -= f.damage"][eval exp="f.HP = 0" cond="f.HP < 0"]
鈴猫の体力が[emb exp="f.damage"]減少した[p]
[WSs]
[endmacro]
; [getMathRound var="XXX"]
; 一時変数 tf.argment に小数点以下を四捨五入した整数をセットするマクロです。
; var には変数の名前を指定できます（var="f.a"のように）。
; 指定すると、tf.argment の内容をその変数にコピーします。
[macro name="getMathRound"]
 [iscript]
 tf.argment = Math.round(tf.argment)
 if (mp['var']) eval(mp['var'] + ' = ' + tf.argment)
 [endscript]
[endmacro]

; [getMathFloor var="XXX"]
; 一時変数 tf.floor に 小数点以下を切り捨てした整数をセットするマクロです。
; var には変数の名前を指定できます（var="f.a"のように）。
; 指定すると、tf.floor の内容をその変数にコピーします。
[macro name="getMathFloor"]
 [iscript]
 tf.floor = Math.floor(num)
 if (mp['var']) eval(mp['var'] + ' = ' + tf.floor)
 [endscript]
[endmacro]


; == macro.ks ==============================================

; マクロを定義してリターンするだけのシナリオファイルです。
; first.ksからサブルーチンとして呼び出されます。
; 最後に[return]必須。
;
;
; マクロって何さ、という方は公式ページの説明をご一読くださいませ。
; http://tyrano.jp/usage/tech/macro
;
;
; ＝定義しているマクロ一覧＝
;
; ┌テキスト簡易装飾マクロ
; │├[<y]
; │├[<r]
; │├[<p]
; │└[>]
; │
; ├発言者欄管理マクロ
; │├[::]
; │├[:akane:]
; │└[:yamato:]
; │
; ├画面破壊/再構築マクロ
; │├[destroy]
; │├[set_default_view]
; │└[set_message_window]
; │
; ├目次表示用マクロ
; │├[index_reset]
; │└[list_item]
; │
; ├乱数マクロ
; │├[getrand]
; │└[getrandname]
; │
; └その他マクロ
; 　├[kadomaru]
; 　├[wrap]
; 　├[clearanimstack]
; 　└[change_image]

; ==========================================================



; ----------------------------------------------------------
; テキスト装飾マクロ
; ----------------------------------------------------------

; [<y]
; 字を黄色くするだけのマクロです。y = yellow
[macro name="<y"]
 [font color="yellow"]
[endmacro]



; [<r]
; 字を赤くするだけのマクロです。r = red
[macro name="<r"]
 [font color="0xf01070"]
[endmacro]



; [<p]
; 字をピンク色にするだけのマクロです。p = pink
[macro name="<p"]
 [font color="0xff44cc"]
[endmacro]



; [>]
; 字をもとに戻すだけのマクロです。
[macro name=">"]
 [resetfont]
[endmacro]


; つまり、
;
;  ああああ[<y]いいいい[>]うううう
;
; のように記述すると、「いいいい」だけが黄色くなります。






; ----------------------------------------------------------
; 発言者欄管理マクロ
; ----------------------------------------------------------

; [:akane:]
; #akane の代わりに使います。
; 発言者欄にakaneを入れて、
; 発言者欄用の画像を表示します。
[macro name=":akane:"]
 #akane
 [anim name="chara_name_image" time="0" opacity="255"]
[endmacro]



; [:yamato:]
; #yamato の代わりに使います。
[macro name=":yamato:"]
 #yamato
 [anim name="chara_name_image" time="0" opacity="255"]
[endmacro]



; [::]
; # の代わりに使います。
[macro name="::"]
 #
 [anim name="chara_name_image" time="0" opacity=" 0"]
[endmacro]













; ----------------------------------------------------------
; 画面の破壊/再構築系マクロ
; ----------------------------------------------------------



; [destroy]
; すべてのレイヤーの画像やテキスト、ボタンなどを破壊し、
; ゲーム画面を更地に戻します。
[macro name="destroy"]
 ; メッセージの削除およびフリーレイヤーの解放
 ; (フリーレイヤー＝ボタンやHTMLなどが挿入されるレイヤー)
 [cm]
 ; fixレイヤーの解放
 [clearfix]
 ; 合成レイヤーの解放
 [free_layermode time="0"]
 ; フィルターの解放
 [free_filter]
 ; レイヤーの解放
 [freeimage layer="base"]
 [freeimage layer="0"]
 [freeimage layer="1"]
 [freeimage layer="2"]
 [freeimage layer="base" page="back"]
 [freeimage layer="0" page="back"]
 [freeimage layer="1" page="back"]
 [freeimage layer="2" page="back"]
 ; カメラの解放
 [reset_camera time="0" layer="0"]
 [reset_camera time="0" layer="1"]
 [reset_camera time="0" layer="2"]
 [reset_camera time="0"]
 ; メッセージウィンドウの非表示
 [layopt layer="message" visible="false"]
[endmacro]



; [set_default_view chara="XXX"]
; 画面をマスク→デストロイした後に
; 教室の背景＋あかねの立ち絵＋メッセージウィンドウを表示して
; マスクオフします。
; chara="off"を指定すると、キャラクターを表示しません。
[macro name="set_default_view"]

 ; [iscript]～[endscript]
 ; マクロに渡された属性値を一時変数にコピーします。その際、初期値を設定しています。
 [iscript]
 ;「mp.属性名」のように書くことで、マクロに渡された属性値を
 ; JavaScript式で扱うことができます。
 tf.chara  = mp.chara  || 'yes'
 [endscript]

 ; [mask]～[mask_off]
 ; マスクしている間に、画面の破壊と再構築を行います。
 [mask color="white" time="400"]

 ; [destroy]
 ; これは独自マクロです。画面にあるもの、画面にある効果、すべてを破壊します。
 [destroy]

 ; [set_message_window]
 ; メッセージウィンドウをセットしなおします。
 [set_message_window]

 ; [bg][chara_show][wait]
 ; 解説画面用の背景、キャラを表示してちょっと待機します。
 [bg time="0" storage="room.jpg"]
 [chara_show cond="tf.chara != 'no'" layer="1" time="0" name="akane" face="default" left="280" top="40"]
 [wait time="100"]

 [mask_off time="400"]

 ; [layopt]
 ; メッセージウィンドウを表示します。
 [layopt layer="message0" visible="true"]

[endmacro]



; [set_message_window]
[macro name="set_message_window"]

 ; [position]
 ; メッセージレイヤーのウィンドウの位置や画像、内余白などを調整します。
 [position layer="message0" page="fore" left="0" top="440" width="960" height="200" frame="message_window.png"]
 [position layer="message0" page="fore" margint="50" marginl="25" marginr="25" marginb="10"]

 ; [free]
 ; chara_name_areaという名前のptextがすでにメッセージレイヤー０に存在していた場合、それを削除します。
 ; (存在していなければ何も起こりません。)
 [free name="chara_name_area" layer="message0"]

 ; [clearfix]
 ; fixボタンを消します。
 ; (存在していなければ何も起こりません。)
 [clearfix]

 ; ※ 補足 ※
 ; 上の[free][clearfix]はリセットのため。
 ; すでにptextやfixボタンが出ている状態でこのマクロを使ったときに二重にならないように、
 ; メッセージウィンドウの設定のリセットを行うことを想定して入れたタグです。

 ; [ptext][chara_config]
 ; 新規にchara_name_areaという名前のptextオブジェクトをメッセージレイヤー０に出して、
 ; それが発言者欄用のptextであることをティラノスクリプトに教えてあげます。
 [ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="36" y="445" color="0xffffff" edge="0x000000"]
 [chara_config ptext="chara_name_area"]

 ; [deffont]
 ; フォントのデフォルト設定を行います。
 ; サイズは40px、フォントはロゴたいぷゴシック、文字色は白、縁取り色は黒です。
 ; ※ロゴたいぷゴシックをティラノスクリプト上で使えるようにするために、
 ; data/othersフォルダにフォントファイルを配置し、
 ; data/others/font.cssファイルでそれを使うための設定を行い、
 ; それを[loadcss]で読み込んでいます。
 [deffont size="40" face="ロゴたいぷゴシック,メイリオ,sans-serif" color="0xffffff" edge="0x000000"]

 ; [resetfont]
 ; デフォルト設定を反映させます。
 ; ([resetfont]を使って初めて[deffont]が反映されます。)
 [resetfont]

 ; [button]
 ; ロールボタンを出していきます。
 [button name="role_button" role="skip"  graphic="button/skip.png" enterimg="button/skip2.png" x="& 0 * 80" y="615"]
 [button name="role_button" role="auto"  graphic="button/auto.png" enterimg="button/auto2.png" x="& 1 * 80" y="615"]
 [button name="role_button" role="save"  graphic="button/save.png" enterimg="button/save2.png" x="& 2 * 80" y="615"]
 [button name="role_button" role="load"  graphic="button/load.png" enterimg="button/load2.png" x="& 3 * 80" y="615"]
 [button name="role_button" role="quicksave" graphic="button/qsave.png" enterimg="button/qsave2.png" x="& 4 * 80" y="615"]
 [button name="role_button" role="quickload" graphic="button/qload.png" enterimg="button/qload2.png" x="& 5 * 80" y="615"]
 [button name="role_button" role="backlog" graphic="button/log.png" enterimg="button/log2.png" x="& 6 * 80" y="615"]
 [button name="role_button" role="window"  graphic="button/close.png" enterimg="button/close2.png" x="& 7 * 80" y="615"]
 [button name="role_button" role="fullscreen" graphic="button/screen.png" enterimg="button/screen2.png" x="& 8 * 80" y="615"]
 [button name="role_button" role="menu"  graphic="button/menu.png" enterimg="button/menu2.png" x="& 9 * 80" y="615"]
 [button name="role_button" role="sleepgame" graphic="button/config.png" enterimg="button/config2.png" x="&10 * 80" y="615" storage="config.ks"]
 [button name="role_button" role="title"  graphic="button/title.png" enterimg="button/title2.png" x="&11 * 80" y="615"]

[endmacro]














; ----------------------------------------------------------
; 目次表示用マクロ
; ----------------------------------------------------------



; [index_reset]
; 一時変数 tf.index に 0 を代入するだけのマクロ。
; tf.index は、目次の選択肢を表示するマクロで利用する、選択肢の番号のようなものです。
; 一番上の選択肢を表示するときが tf.index == 0 で、
; 順次 1, 2, 3 … と、選択肢を表示するたびに増えていきます。
[macro name="index_reset"]
 [eval exp="tf.index = 0"]
[endmacro]



; [list_item text1="XXX" text2="XXX" storage="XXX" shiryou="XXX"]
; 選択肢要素を表示します。
; その際、選択肢番号である変数 tf.index を利用して位置を決定する工夫をしています。
[macro name="list_item"]

 ; [eval]
 ; 一時変数 tf.image に、「参照すべき画像のパス」をぶち込みます。
 ; f.current_page_index には、現在のページ番号、すなわち 1～4 の整数が入っているはずなので、
 ; 結局この処理で、tf.image には、'color/col1.png'、'color/col2.png'……などの文字列がぶち込まれることになります。
 [eval exp="tf.image = 'color/col' + f.current_page_index + '.png'"]

 ; [if]～[endif]
 ; 資料編があるかないかで分岐します。
 [if exp="mp.shiryou == 'yes'"]

 ; 資料編があるなら。

 ; [image]
 ; 選択肢の背景となる色付きの四角形を表示します。
 [image layer="0" storage="& tf.image"  x=" 0" y="& tf.index * 95 + 5 " width="810" height="90"]
 ; storage 属性などの値の頭についている「&」は、
 ;「後に続く文字をJavaScriptの式として評価せよ」という合図です。
 ; storage 属性の場合で言えば、後に続く「tf.image」がJavaScriptの式として評価されますので、
 ; 変数 tf.image の中身が storage 属性に入ることになります。
 ; ※ もし「&」を省いてしまうと、単に「tf.image」という文字そのものを指定したことになります。

 ; [ptext]
 ; 文字を表示します。
 [ptext layer="0" text="% text1"   x=" 20" y="& tf.index * 95 + 9 " bold="bold" size="40"]
 [ptext layer="0" text="% text2"   x=" 20" y="& tf.index * 95 + 52 "    size="24"]
 ; text 属性の頭についている「%」は、
 ;「マクロに渡された同じ属性名の値を渡してね」という合図です。

 ; [clickable]
 ; クリックすることができる透明ボタンを作成します。
 [clickable color="white" opacity="0"  x=" 0" y="& tf.index * 95 + 5 " width="810" height="90" mouseopacity="50" storage="& 'kaisetsu/' + mp.storage" target="%target"]

 ; 資料編についても同様の処理を行います。
 [image layer="0" storage="&tf.image"  x="815" y="& tf.index * 95 + 5 " width="145" height="90"]
 [ptext layer="0" text="資料編"   x="841" y="& tf.index * 95 + 27 " bold="bold" size="30"]
 [clickable color="white" opacity="0"  x="815" y="& tf.index * 95 + 5 " width="145" height="90" mouseopacity="50" storage="& 'shiryou/' + mp.storage" target="%target"]

 [else]

 ; 資料編がないなら資料編は描画しない。
 ;                     !!!
 ;[image layer="0" storage="&tf.image"  x=" 0" y="& tf.index * 95 + 5 " width="960" height="90"]
 ;[ptext layer="0" text="%text1"   x=" 20" y="& tf.index * 95 + 9 " bold="bold" size="40"]
 ;[ptext layer="0" text="%text2"   x=" 20" y="& tf.index * 95 + 52 "    size="24"]
 ;[clickable color="white" opacity="0"  x=" 0" y="& tf.index * 95 + 5 " width="960" height="90" mouseopacity="50" storage="& 'kaisetsu/' + mp.storage" target="%target"]

 [endif]

 ; [eval]
 ; 選択肢をひとつ表示したということで、
 ; 選択肢番号をひとつ増やします。
 [eval exp="tf.index = tf.index + 1"]

[endmacro]









; ----------------------------------------------------------
; 乱数マクロ
; ----------------------------------------------------------






; [getrand var="XXX" min="XXX" max="XXX"]
; 一時変数 f.rand に min 以上 max 以下の乱数(整数)をセットするマクロです。
; var には変数の名前を指定できます（var="f.a"のように）。
; 指定すると、f.rand の内容をその変数にコピーします。
[macro name="getrand"]
 [iscript]
 var max = mp.max || '10'
 var min = mp.min || '1'
 max = Number(max)
 min = Number(min)
 f.rand = min + Math.floor(Math.random() * (max - min + 1))
 if (mp['var']) eval(mp['var'] + ' = ' + f.rand)
 [endscript]
[endmacro]



; [getrandname var="XXX" name="XXX" min="XXX" max="XXX"]
; 文字列 name の{R}部分を「min 以上 max 以下のランダムな整数」で置き換えた文字列を生成し、
; 一時変数 f.randname にセットします。
; var には変数の名前を指定できます（var="f.a"のように）。
; 指定すると、f.randname の内容をその変数にコピーします。
[macro name="getrandname"]
 [iscript]
 var name = mp.name || '*Label{R}'
 var max = mp.max || '10'
 var min = mp.min || '1'
 max = Number(max)
 min = Number(min)
 var rand = min + Math.floor(Math.random() * (max - min + 1))
 f.randname = name.replace('{R}', rand)
 if (mp['var']) eval(mp['var'] + ' = "' + f.randname + '"')
 [endscript]
[endmacro]





; ----------------------------------------------------------
; その他マクロ
; ----------------------------------------------------------



; [kadomaru name="XXX" radius="XXX"]
; name属性で指定した要素の角を丸く削るマクロです。
; その半径をradius属性で指定します。
; name属性はコンマ区切りで複数指定可能。
[macro name="kadomaru"]
 [iscript]
 var name = mp.name || ''
 var radius = mp.radius || '5px'
 if (radius.indexOf('px') < 0 && radius.indexOf('%') < 0) radius = radius + 'px'
 var array = name.split(',')
 var j_target = $()
 for (var i = 0; i < array.length; i++) j_target = j_target.add('.' + array[i])
 j_target.css('border-radius', radius)
 [endscript]
[endmacro]



; [wrap wrap_name="XXX" name="XXX" layer="XXX" page="XXX" left="XXX" top="XXX" width="XXX" height="XXX"]
; name属性にカンマ区切りで指定した画像群をひとつのラップで包みます。
; layer, left, top, width, height属性も併せて指定する必要があります。
; ラップの名前はwrap_name属性で指定します。
[macro name="wrap"]
 [iscript]

 var wrap_name = mp.wrap_name || ''
 var name  = mp.name  || ''
 var layer  = mp.layer  || '0'
 var page  = mp.page  || 'fore'
 var overflow = mp.overflow || ''
 var zindex = mp.zindex || ''
 var x   = mp.x   || '0'
 var y   = mp.y   || '0'
 var w   = mp.width  || TYRANO.kag.config.scWidth
 var h   = mp.height || TYRANO.kag.config.scHeight

 var j_wrap  = $('<div />')
 $.setName(j_wrap, wrap_name)
 j_wrap.css('position', 'absolute')
 if (overflow != '') j_wrap.css('overflow', overflow)
 if (zindex != '') j_wrap.css('z-index', zindex)

 var j_target = $()
   var array  = name.split(',')
 for (var i = 0; i < array.length; i++) j_target = j_target.add('.' + array[i])
 var j_layer = TYRANO.kag.layer.getLayer(layer, page)
 if (layer == 'fix' || layer == 'fixlayer')j_layer = $('#tyrano_base').find('.fixlayer')
 j_target = j_layer.find(j_target)

 var ok = { x1: x, y1: y, w: w, h: h }

 j_wrap.css({
 'left': ok.x1 + 'px',
 'top': ok.y1 + 'px',
 'width': ok.w + 'px',
 'height': ok.h + 'px'
 })

 j_target.css({
 'left': '-=' + ok.x1 + 'px',
 'top': '-=' + ok.y1 + 'px'
 })

 j_target.wrapAll(j_wrap)

 [endscript]
[endmacro]



; [change_image name="XXX" storage="XXX"]
; name属性の[image]オブジェクトのstorageを即座に変更します。
; time指定はムリ。
[macro name="change_image"]
 [iscript]
 var name  = mp.name || ''
 var storage = mp.storage || ''
 var array = name.split(',')
 var j_target = $()
 for (var i = 0; i < array.length; i++) j_target = j_target.add('.' + array[i])
 j_target.attr("src", storage)
 [endscript]
[endmacro]




; [clearanimstack]
; アニメーションスタックをクリアします。
[macro name="clearanimstack"]
 [eval exp="TYRANO.kag.tmp.num_anim = 0"]
[endmacro]



[return]
