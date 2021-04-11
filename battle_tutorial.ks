;メッセージウィンドウの表示
@layopt layer=message0 visible=true
@layopt layer=2 visible=true
@layopt layer=3 visible=true

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
;表示マクロ
[macro name="show_score"]
[eval exp="f.Target = f.En_DEF + f.comand" ]
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

;臨時マクロ
[macro name="update_status"]
[iscript]
f.HP_ptxt = "体力:" + f.HP ;
f.MP_ptxt = "気力:" + f.MP ;
f.ERO_ptxt = "快感:" + f.ERO ;
f.En_HP_ptxt = "体力:" + f.En_HP ;
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
[ptext layer="0" x="900" y="10" text=&f.En_HP_ptxt size="20" color="0x000000" edge="white" bold="bold" align="left" name="En_HP" overwrite="true" ]
[endmacro]
;--------------------------------------------------------------------------------
;UI配置
;UIのx、yに関する変数を一括制御するためのもの(いちいち置換するのがめんどい）
;数値が共通(xかyが揃っている)のもの限定
[eval exp="f.pos_Card_y = 390 ,f.pos_Card_x1 = 400 ,f.pos_Card_x2 = 500 ,f.pos_Card_x3 = 600 ,f.pos_Card_x4 = 700 ,f.pos_Card_x5 = 800 "]
[eval exp="f.pos_Comand_btn_x1 = 400 , f.pos_Comand_btn_x2 = 600 "]

;--------------------------------------------------------------------------------
#
戦闘開始[p]
[eval exp="f.comand='' ,f.Target='' ,f.Limit='' ,f.Total='' ,f.Bind = 0 ,f.Rt_Bind = 0"]
[eval exp="f.Draw1_txt='' ,f.Draw2_txt='' ,f.Draw3_txt='' ,f.Draw4_txt='' ,f.Draw5_txt=''"]
[eval exp="f.HP = 2000 , f.MP = 0 , f.SAN = 60 , f.orgasm = 0"]
[eval exp="f.ATP = 50 , f.ATP_red = 0 , f.RES = 40 , f.RES_green = 0 "]
[eval exp="f.En_HP = 10000 ,f.En_DEF ='' ,f.En_ERO = 0 ,f.Rape_mode = 0"]
[eval exp="f.round=0"]

;カード構築
[Initialize_Cards]
;初回シャッフル
[DeckShuffle]

;--------------------------------------------------------------------------------

*ラウンド開始
[eval exp="f.round++"]
[eval exp="f.Limit=21"]
[show_score][update_status]
敵の守備力が表示されます[p]
;敵の行動パターン選定
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand<25"]
[eval exp="f.En_DEF = 15"]
[elsif exp="f.rand<50"]
[eval exp="f.En_DEF = 14"]
[elsif exp="f.rand<75"]
[eval exp="f.En_DEF = 13"]
[else]
[eval exp="f.En_DEF = 12"]
[endif]
[show_score]
;手札作成
;HandにDeckからカード追加
;追加分をDeckから削除
;f.Handも中身は引き換え番号
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]"]
[iscript]
f.Deck.splice(0,5);
[endscript]

*ドロー１
１枚目のカードが表示されます[p]
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y text="&f.Cards[f.Hand[0]]['txt']" exp="f.Draw1=f.Hand[0],f.Cards[f.Hand[0]]['active']=0" cond="f.Cards[f.Hand[0]]['active']>0" target="*ドロー１ボーナス" ]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y cond="f.Cards[f.Hand[1]]['active']>0" target="*ドロー１" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y cond="f.Cards[f.Hand[2]]['active']>0" target="*ドロー１" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y cond="f.Cards[f.Hand[3]]['active']>0" target="*ドロー１" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y cond="f.Cards[f.Hand[4]]['active']>0" target="*ドロー１" ]
[s]

*ドロー１ボーナス
[if exp="f.round < 2"]
ドローしたカードの色に応じてボーナスが発生します[p]
赤なら与えるダメージアップ、青なら気力アップ[r]
緑色なら回避アップ、黄色なら上限値が＋１されます[p]
[endif]
[if exp="f.Cards[f.Draw1]['color'] == 'red' "]
攻撃力アップ[r]
[eval exp="f.ATP_red += 10"]
[elsif exp="f.Cards[f.Draw1]['color'] == 'blue' "]
気力アップ[r]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[elsif exp="f.Cards[f.Draw1]['color'] == 'green' "]
回避アップ[r]
[eval exp="f.RES_green += 20"]
[elsif exp="f.Cards[f.Draw1]['color'] == 'orange' "]
上限値アップ[r]
[eval exp="f.Limit += 1"]
[else]
[endif]
[show_score]

*コマンド選択
[eval exp="f.Total = 0 + f.Cards[f.Draw1]['value']"]
[eval exp="f.Draw1_txt = f.Cards[f.Draw1]['txt'] "]
[show_score]
[if exp="f.round < 2"]
コマンドを選択してください。
コマンドのコストと守備力の合算が目標値になります[p]
[endif]

[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="400" text="拳(3)" exp="f.comand=3" target="*ドロー２" ]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="450" text="下段蹴り(4)" exp="f.comand=4" target="*ドロー２" ]
[glink color="black" size="18" x=&f.pos_Comand_btn_x1 y="500" text="回し蹴り(5)" exp="f.comand=5" target="*ドロー２" ]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="400" text="踵落とし(6)" exp="f.comand=6" target="*ドロー２" ]
[glink color="black" size="18" x=&f.pos_Comand_btn_x2 y="450" text="飛び蹴り(7)" exp="f.comand=7" target="*ドロー２" ]
[s]

*ドロー２
[show_score]
２枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw2=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*ドロー２完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw2=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*ドロー２完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw2=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*ドロー２完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw2=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*ドロー２完了" ]
[s]

*ドロー２完了
[if exp="f.round < 2"]２枚目のカードが表示されます[p]
[endif]
[eval exp="f.Total = f.Total + f.Cards[f.Draw2]['value']"]
[eval exp="f.Draw2_txt = f.Cards[f.Draw2]['txt'] "]
[show_score]
*ドロー２ボーナス
[if exp="f.Cards[f.Draw2]['color'] == 'red' "]
攻撃力アップ[r]
[eval exp="f.ATP_red += 10"]
[elsif exp="f.Cards[f.Draw2]['color'] == 'blue' "]
気力アップ[r]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[elsif exp="f.Cards[f.Draw2]['color'] == 'green' "]
回避アップ[r]
[eval exp="f.RES_green += 20"]
[elsif exp="f.Cards[f.Draw2]['color'] == 'orange' "]
上限値アップ[r]
[eval exp="f.Limit += 1"]
[else]
[endif]
[show_score][update_status]

*判定１
[if exp="f.round < 2"]
目標値以上、上限値以下ならば判定成功です[p]
判定成功であればコマンドの内容を実行[r]
判定失敗であれば通常攻撃を実行します[p]
[endif]

[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*バースト"]
[else]
目標未達[p]
[jump target="*通常攻撃１"]
[endif]
[s]

*通常攻撃１
[if exp="f.round < 2"]装備の投擲武器による攻撃を行います[p]
[endif]
通常攻撃[p]
[eval exp="f.damage = (f.ATP + f.ATP_red) - (f.orgasm * 30)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[show_score]

*敵攻撃１
敵の攻撃！[p]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < (f.RES + f.RES_green) - (f.orgasm * 30)"]
鈴猫は敵の攻撃を回避した[p]
[jump target="*ドロー３"]
[endif]

[if exp="f.En_DEF <= 11"]
[eval exp="f.HP -= 150"]
１5０のダメージを受けた[p]
[elsif exp="f.En_DEF <= 12"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
敵のスキル使用[r]
「守備体勢」[r]
敵の守備力が＋１された[p]
[eval exp="f.En_DEF++"]
[show_score]
[elsif exp="f.En_DEF <= 13"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
[else]
[eval exp="f.HP -= 50"]
５０のダメージを受けた[p]
[endif]
[update_status]


*ドロー３
３枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw3=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*ドロー３完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw3=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*ドロー３完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw3=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*ドロー３完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw3=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*ドロー３完了" ]
[s]

*ドロー３完了
[if exp="f.round < 2"]３枚目のカードが表示されます[p]
[endif]
[eval exp="f.Total = f.Total + f.Cards[f.Draw3]['value']"]
[eval exp="f.Draw3_txt = f.Cards[f.Draw3]['txt'] "]
[show_score]
*ドロー３ボーナス
[if exp="f.Cards[f.Draw3]['color'] == 'red' "]
攻撃力アップ[r]
[eval exp="f.ATP_red += 10"]
[elsif exp="f.Cards[f.Draw3]['color'] == 'blue' "]
気力アップ[r]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[elsif exp="f.Cards[f.Draw3]['color'] == 'green' "]
回避アップ[r]
[eval exp="f.RES_green += 20"]
[elsif exp="f.Cards[f.Draw3]['color'] == 'orange' "]
上限値アップ[r]
[eval exp="f.Limit += 1"]
[else]
[endif]
[show_score][update_status]

*判定２
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*バースト"]
[else]
目標未達[p]
[jump target="*通常攻撃２"]
[endif]
[s]

*通常攻撃２
通常攻撃[p]
[eval exp="f.damage = (f.ATP + f.ATP_red) - (f.orgasm * 30)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[show_score]

*敵攻撃２
敵の攻撃！[p]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < (f.RES + f.RES_green) - (f.orgasm * 30)"]
鈴猫は敵の攻撃を回避した[p]
[jump target="*ドロー４"]
[endif]

[if exp="f.En_DEF <= 11"]
[eval exp="f.HP -= 150"]
１5０のダメージを受けた[p]
[elsif exp="f.En_DEF <= 12"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
敵のスキル使用[r]
「守備体勢」[r]
敵の守備力が＋１された[p]
[eval exp="f.En_DEF++"]
[elsif exp="f.En_DEF <= 13"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
[else]
[eval exp="f.HP -= 50"]
５０のダメージを受けた[p]
[endif]
[update_status]

*ドロー４
４枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw4=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*ドロー４完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw4=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*ドロー４完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw4=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*ドロー４完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw4=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*ドロー４完了" ]
[s]

*ドロー４完了
[if exp="f.round < 2"]４枚目のカードが表示されます[p]
[endif]
[eval exp="f.Total = f.Total + f.Cards[f.Draw4]['value']"]
[eval exp="f.Draw4_txt = f.Cards[f.Draw4]['txt'] "]
[show_score]
*ドロー４ボーナス
[if exp="f.Cards[f.Draw4]['color'] == 'red' "]
攻撃力アップ[r]
[eval exp="f.ATP_red += 10"]
[elsif exp="f.Cards[f.Draw4]['color'] == 'blue' "]
気力アップ[r]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[elsif exp="f.Cards[f.Draw4]['color'] == 'green' "]
回避アップ[r]
[eval exp="f.RES_green += 20"]
[elsif exp="f.Cards[f.Draw4]['color'] == 'orange' "]
上限値アップ[r]
[eval exp="f.Limit += 1"]
[else]
[endif]
[show_score][update_status]

*判定３
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*バースト"]
[else]
目標未達[p]
[jump target="*通常攻撃３"]
[endif]
[s]

*通常攻撃３
通常攻撃[p]
[eval exp="f.damage = (f.ATP + f.ATP_red) - (f.orgasm * 30)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[show_score]

*敵攻撃３
敵の攻撃！[p]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < (f.RES + f.RES_green) - (f.orgasm * 30)"]
鈴猫は敵の攻撃を回避した[p]
[jump target="*ドロー５"]
[endif]

[if exp="f.En_DEF <= 11"]
[eval exp="f.HP -= 150"]
１5０のダメージを受けた[p]
[elsif exp="f.En_DEF <= 12"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
敵のスキル使用[r]
「守備体勢」[r]
敵の守備力が＋１された[p]
[eval exp="f.En_DEF++"]
[elsif exp="f.En_DEF <= 13"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
[else]
[eval exp="f.HP -= 50"]
５０のダメージを受けた[p]
[endif]
[update_status]

*ドロー５
５枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw5=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*ドロー５完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw5=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*ドロー５完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw5=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*ドロー５完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw5=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*ドロー５完了" ]
[s]

*ドロー５完了
[if exp="f.round < 2"]５枚目のカードが表示されます[p]
[endif]
[eval exp="f.Total = f.Total + f.Cards[f.Draw5]['value']"]
[eval exp="f.Draw5_txt = f.Cards[f.Draw5]['txt'] "]
[show_score]
*ドロー５ボーナス
[if exp="f.Cards[f.Draw5]['color'] == 'red' "]
攻撃力アップ[r]
[eval exp="f.ATP_red += 10"]
[elsif exp="f.Cards[f.Draw5]['color'] == 'blue' "]
気力アップ[r]
[eval exp="f.MP += 10"][eval exp="f.MP = 100" cond="f.MP > 100"]
[elsif exp="f.Cards[f.Draw5]['color'] == 'green' "]
回避アップ[r]
[eval exp="f.RES_green += 20"]
[elsif exp="f.Cards[f.Draw5]['color'] == 'orange' "]
上限値アップ[r]
[eval exp="f.Limit += 1"]
[else]
[endif]
[show_score][update_status]

*判定４
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*コマンド実行"]
[else]
判定失敗[p]
[jump target="*バースト"]
[endif]
[s]

*コマンド実行
[if exp="f.comand == 3"]
[jump target="*コマンド３"]
[elsif exp="f.comand == 4"]
[jump target="*コマンド４"]
[elsif exp="f.comand == 5"]
[jump target="*コマンド５"]
[elsif exp="f.comand == 6"]
[jump target="*コマンド６"]
[elsif exp="f.comand == 7"]
[jump target="*コマンド７"]
[endif]
[s]

*コマンド３
鈴猫の拳[r]
[eval exp="f.damage = (2 * f.ATP + f.ATP_red) - (f.orgasm * 50)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[jump target="*勝利判定" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド４
鈴猫の下段蹴り[r]
[eval exp="f.damage = (4 * f.ATP + f.ATP_red) - (f.orgasm * 100)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[jump target="*勝利判定" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド５
鈴猫の回し蹴り[r]
[eval exp="f.damage = (6 * f.ATP + f.ATP_red) - (f.orgasm * 150)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[jump target="*勝利判定" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド６
鈴猫の踵落とし[r]
[eval exp="f.damage =  (8 * f.ATP + f.ATP_red) - (f.orgasm * 200)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[jump target="*勝利判定" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド７
鈴猫の飛び蹴り[r]
[eval exp="f.damage = (10 * f.ATP + f.ATP_red) - (f.orgasm * 250)"]
[eval exp="f.En_HP -= f.damage"]
[emb exp="f.damage"]のダメージを与えた[p]
[update_status]
[jump target="*勝利判定" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]

*バースト
敵の攻撃[r]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 80"]
敵は鈴猫を拘束した[p]
[jump target="*拘束開始"]
[else]
[eval exp="f.HP -= 200"]
２００のダメージを受けた[p]
[update_status]
[endif]
[jump target="*敗北判定" cond="f.HP <= 0"]
[jump target="*ラウンド終了"]
[s]

*ラウンド終了
今回、使用した札は[emb exp="f.Cards[f.Hand[0]]['txt']"]、
[emb exp="f.Cards[f.Hand[1]]['txt']"]、[emb exp="f.Cards[f.Hand[2]]['txt']"]、
[emb exp="f.Cards[f.Hand[3]]['txt']"]、[emb exp="f.Cards[f.Hand[4]]['txt']"]です[p]
[if exp="f.Rt_orgasm ==1"]
[eval exp="f.Rt_orgasm = 0 , f.orgasm = 0"]
[chara_mod name="suzune" face="怒り" cond="f.ERO < 70"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 70"]
[elsif exp="f.Rt_orgasm ==2"]
[eval exp="f.Rt_orgasm--"]
[endif]
[DeActivate]
[reflesh_score]
[ReShuffle]
[jump target="*ラウンド開始"]
[s]


*勝利判定
敵を倒した[p]
[s]

*敗北判定
鈴猫は敗北した[p]
[s]

;拘束された-------------------------------------------------------------------------------
*拘束開始
[DeActivate]
[reflesh_score]
[ReShuffle]
[eval exp="f.Bind = 200 ,f.Rt_Bind = 1"]
[show_score]
#鈴猫
この！離しなさいよ！！[p]
#

*拘束ラウンド開始
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < f.En_ERO"]
[eval exp="f.Rape_mode = 1"]
[eval exp="f.En_DEF = 16"]
[elsif exp="f.rand<33"]
[eval exp="f.En_DEF = 15"]
[elsif exp="f.rand<66"]
[eval exp="f.En_DEF = 14"]
[else]
[eval exp="f.En_DEF = 13"]
[endif]
[show_score]
[show_score]
;手札作成
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]"]
[iscript]
f.Deck.splice(0,5);
[endscript]
[call target="*レイプ１" cond="f.Rape_mode > 0"]

*拘束ドロー１
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x1 y=&f.pos_Card_y text="&f.Cards[f.Hand[0]]['txt']" exp="f.Draw1=f.Hand[0],f.Cards[f.Hand[0]]['active']=0" cond="f.Cards[f.Hand[0]]['active']>0" target="*抵抗コマンド選択" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー１" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー１" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー１" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー１" ]
[s]
*抵抗コマンド選択
[eval exp="f.Total = 0 + f.Cards[f.Draw1]['value']"]
[eval exp="f.Draw1_txt = f.Cards[f.Draw1]['txt'] "]
[show_score]
コマンドを選択してください[p]
[glink color="gray" x="550" y="350" text="暴れる(6)" exp="f.comand=6" target="*拘束ドロー２" ]
[glink color="gray" x="550" y="400" text="噛みつき(7)" exp="f.comand=7" target="*拘束ドロー２" ]
[glink color="gray" x="550" y="450" text="頭突(8)" exp="f.comand=8" target="*拘束ドロー２" ]
[glink color="gray" x="550" y="500" text="金的(9)" exp="f.comand=9" target="*拘束ドロー２" ]
[s]
*拘束ドロー２
[eval exp="f.Limit=21"][show_score]
[call target="*レイプ２" cond="f.Rape_mode > 0"]
２枚目のカードを選択してください[p]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw2=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw2=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw2=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw2=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー２完了" ]
[s]
*拘束ドロー２完了
[eval exp="f.Total = f.Total + f.Cards[f.Draw2]['value']"]
[eval exp="f.Draw2_txt = f.Cards[f.Draw2]['txt'] "]
[show_score]
*拘束判定１
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*拘束バースト"]
[else]
目標未達[p]
[jump target="*抵抗攻撃１"]
[endif]
[s]
*抵抗攻撃１
#
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.Bind -= 20"]
拘束力が20減少[r]
守備力が-１された[p]
[eval exp="f.En_DEF-- "]
[show_score][update_status]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[show_score]

*敵拘束攻撃１
[getrand min="1" max="100" var="f.rand"]
[if exp="f.Rape_mode > 0"]
[call target="*レイプ３"]
[elsif exp="f.rand < 60"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.En_ERO += 5"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[else]
#敵
暴れんじゃねえよ！[p]
#
敵の攻撃[r]
１０のダメージを受けた[p]
[eval exp="f.HP -= 10"]
[endif]
[update_status]

*敵拘束ドロー３
３枚目のカードを選択してください[p]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw3=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw3=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw3=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw3=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー３完了" ]
[s]
*拘束ドロー３完了
[eval exp="f.Total = f.Total + f.Cards[f.Draw3]['value']"]
[eval exp="f.Draw3_txt = f.Cards[f.Draw3]['txt'] "]
[show_score]
*拘束判定２
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*拘束バースト"]
[else]
目標未達[p]
[jump target="*抵抗攻撃２"]
[endif]
[s]
*抵抗攻撃２
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.Bind -= 20"]
拘束力が20減少[r]
守備力が-１された[p]
[eval exp="f.En_DEF-- "]
[show_score][update_status]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[show_score]

*敵拘束攻撃２
[getrand min="1" max="100" var="f.rand"]
[if exp="f.Rape_mode > 0"]
[call target="*レイプ３"]
[elsif exp="f.rand < 60"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.En_ERO += 5"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[else]
#敵
暴れんじゃねえよ！[p]
#
敵の攻撃[r]
１０のダメージを受けた[p]
[eval exp="f.HP -= 10"]
[endif]
[update_status]

*拘束ドロー４
４枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw4=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー４完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw4=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー４完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw4=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー４完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw4=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー４完了" ]
[s]
*拘束ドロー４完了
[eval exp="f.Total = f.Total + f.Cards[f.Draw4]['value']"]
[eval exp="f.Draw4_txt = f.Cards[f.Draw4]['txt'] "]
[show_score]
*拘束判定３
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Total > f.Limit "]
判定失敗[p]
[jump target="*拘束バースト"]
[else]
目標未達[p]
[jump target="*抵抗攻撃３"]
[endif]
[s]
*抵抗攻撃３
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.Bind -= 20"]
拘束力が20減少[r]
守備力が-１された[p]
[eval exp="f.En_DEF-- "]
[show_score][update_status]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[show_score]

*敵拘束攻撃３
[getrand min="1" max="100" var="f.rand"]
[if exp="f.Rape_mode > 0"]
[call target="*レイプ３"]
[elsif exp="f.rand < 60"]
#敵
へっ！！おとなしくしな！！[p]
#
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は１０の快感を受けた[p]
[eval exp="f.ERO += 10"][eval exp="f.En_ERO += 5"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[else]
#敵
暴れんじゃねえよ！！[p]
#
敵の攻撃[r]
１０のダメージを受けた[p]
[eval exp="f.HP -= 10"]
[endif]
[update_status]

*抵抗ドロー５
５枚目のカードを選択してください[p]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x2 y=&f.pos_Card_y exp="f.Draw5=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x3 y=&f.pos_Card_y exp="f.Draw5=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x4 y=&f.pos_Card_y exp="f.Draw5=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="gray" size="18" width="15" height="100" x=&f.pos_Card_x5 y=&f.pos_Card_y exp="f.Draw5=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*抵抗ドロー５完了" ]
[s]
*抵抗ドロー５完了
[eval exp="f.Total = f.Total + f.Cards[f.Draw5]['value']"]
[eval exp="f.Draw5_txt = f.Cards[f.Draw5]['txt'] "]
[show_score]
*拘束判定４
[if exp="f.Target <= f.Total && f.Total <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[else]
判定失敗[p]
[jump target="*拘束バースト"]
[endif]
[s]
*抵抗コマンド実行
[if exp="f.comand == 6"]
[jump target="*抵抗コマンド６"]
[elsif exp="f.comand == 7"]
[jump target="*抵抗コマンド７"]
[elsif exp="f.comand == 8"]
[jump target="*抵抗コマンド８"]
[elsif exp="f.comand == 9"]
[jump target="*抵抗コマンド９"]
[endif]
error697
[s]

*抵抗コマンド６
鈴猫は暴れた[p]
[eval exp="f.Bind -= 40 ,f.En_ERO -= 2"]
拘束力が40減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド７
鈴猫は噛み付いた[p]
[eval exp="f.Bind -= 80 ,f.En_ERO -= 4"]
拘束力が80減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド８
鈴猫の頭突き[p]
[eval exp="f.Bind -= 120 ,f.En_ERO -= 6"]
拘束力が120減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド９
鈴猫の金的[p]
[eval exp="f.Bind -= 200 ,f.En_ERO -= 8"]
拘束力が200減少[p]
[show_score]
[jump target="*拘束脱出" cond="f.Bind <= 0"]
[jump target="*拘束ラウンド継続"]
[s]

*拘束脱出
鈴猫は自由を取り戻した！[p]
[eval exp="f.Rt_Bind = 0"]
[eval exp="f.Rape_mode = 0" cond="f.Rape_mode > 0"]
[ptext layer="3" x="450" y="50" text="" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Bind" overwrite="true"]
[jump target="*ラウンド終了"]
[s]

*拘束バースト
[if exp="f.Rape_mode > 0"]
[jump target="*レイプ４"]
[endif]
#敵
敵は鈴猫の秘所を弄った[p]
#鈴猫
いやぁっ！！[p]
#
鈴猫は２０の快感を受けた[p]
[eval exp="f.ERO += 20"][eval exp="f.En_ERO += 5"]
[call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
[jump target="*拘束ラウンド継続"]
[s]

*拘束ラウンド継続
今回、使用した札は[emb exp="f.Cards[f.Hand[0]]['txt']"]、
[emb exp="f.Cards[f.Hand[1]]['txt']"]、[emb exp="f.Cards[f.Hand[2]]['txt']"]、
[emb exp="f.Cards[f.Hand[3]]['txt']"]、[emb exp="f.Cards[f.Hand[4]]['txt']"]です[p]
[DeActivate]
[reflesh_score]
[ReShuffle]
[jump target="*拘束ラウンド開始"]
[s]

;レイプ----------------------------------------------------------------------
*レイプ１
#敵
もう！我慢できねえぜ！！[r]
このまま本番に行かせてもらうぜ！！[p]
#鈴猫
ちょっ！！やめーーーーーー[p]
#
忍者はマラを鈴猫の秘裂に挿入した[p]
[chara_mod name="suzune" face="泣き"]
#鈴猫
（ーーーーーーーッ！！）[p]
[chara_mod name="suzune" face="苦しみ"]
[return]

*レイプ２
#忍者
どうだ！俺のマラの感触は！！[p]
[chara_mod name="suzune" face="苦しみ"]
#鈴猫
はっ！！小さすぎて入ったのが分かんなかったわよっ！！[p]
#忍者
ちっ！まだ入れただけだ！！こっからが本番だぜ！！[p]
#
[return]
[s]

*レイプ３
忍者はしっかりと鈴猫の腰を抱え込むと激しく腰を打ち付けた[p]
[chara_mod name="suzune" face="喘ぎ"]
#忍者
オラオラ、オラァ！！[p]
#鈴猫
んっ！！こんな奴にぃ！！ううんっ！！[p]
#
鈴猫は３０の快感を受けた[p]
[eval exp="f.ERO += 30"][call target="*絶頂" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
[return]
[s]

*レイプ４
#
忍者は魔羅で鈴猫の膣を荒々しく突き上げた[p]
[chara_mod name="suzune" face="喘ぎ"]
#鈴猫
あんっ！！あんっ！！ひあっ！！[p]
#忍者
へへっ！！いい声で鳴くようになってきたじゃねえか！！[p]
#鈴猫
う、うるさっ！！ひぃぃん！！！[p]
#忍者
よしっ！！このまま中でぶちまけてやるぜ！！[p]
#鈴猫
！！やめろぉっ！！ばかぁ！！んうううっ！！[p]
#忍者
うおおおおおっ！！出すぞ！！[p]
#
忍者は鈴猫の中で射精した[p]
[chara_mod name="suzune" face="泣き"]
#鈴猫
いやあああああっ！！！[p]
#
鈴猫は精の迸りを子宮に感じながら嬌声を上げた[r]
#
鈴猫は５０の快感を受けた[p]
[eval exp="f.ERO += 50"][jump target="*絶頂フェイタル" cond="f.ERO >= 100"]
[chara_mod name="suzune" face="苦しみ" cond="f.ERO >= 60 && f.orgasm == 0"]
[update_status]
#忍者
へへへ、なかなか良かったぜ[p]
#
忍者は嫌らしく笑いながらマラを引き抜くと鈴猫の尻を叩いた[p]
#鈴猫
ああんっ！！[p]
#
その場にくずおれた鈴猫の秘裂からごぽりと精液が溢れた[p]
[chara_mod name="suzune" face="厳しい"]
#鈴猫
くっ！絶対許さないんだから！！[p]
#
鈴猫はよろよろと立ち上がると敵を睨みつけた[p]
[jump target="*拘束脱出"]
[s]
;絶頂----------------------------------------------------------------------
*絶頂
[chara_mod name="suzune" face="絶頂"]
#鈴猫
いやあああっ！！らめぇぇぇぇっ！！[p]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴猫は絶頂した[r]
体力が50減少[p]
[eval exp="f.HP -= 50"]
[eval exp="f.HP = 1" cond="f.HP <= 0"]
絶頂状態になった[r]
理性が１減少した[p]
[eval exp="f.SAN -= 1 , f.orgasm = 1 , f.Rt_orgasm = 2 , f.ERO = 0"]
[chara_mod name="suzune" face="レイプ目"]
[return]
[s]

;フェイタル----------------------------------------------------------------------
*絶頂フェイタル
[chara_mod name="suzune" face="絶頂"]
#鈴猫
いやあああっ！！らめぇぇぇぇっ！！[p]
イクっ！！イクイクイクーーーーっ！！[p]
#
鈴猫は絶頂した[r]
体力が100減少[p]
[eval exp="f.HP -= 100"]
[if exp="f.HP <= 0"][jump target="*気絶フェイタル"][endif]
絶頂状態になった[r]
理性が１減少した[p]
[eval exp="f.SAN -= 1 , f.orgasm = 1 , f.Rt_orgasm = 2 , f.ERO = 0"]
[chara_mod name="suzune" face="レイプ目"]
#忍者
へへへ、なかなか良かったぜ[p]
#
忍者は嫌らしく笑いながらマラを引き抜くと鈴猫の尻を叩いた[p]
#鈴猫
ああんっ！！[p]
#
その場にくずおれた鈴猫の秘裂からごぽりと精液が溢れた[p]
#鈴猫
んっ！このぉ……ぜったい、ゆるさないんらからぁっ！[p]
#
鈴猫はよろよろと立ち上がると敵を睨みつけた[p]
[jump target="*拘束脱出"]
[s]

*気絶フェイタル
[chara_mod name="suzune" face="レイプ目"]
[eval exp="f.bind = 0"]
#
鈴猫は気絶した！[p]
#忍者
へへへ、なかなか良かったぜ[p]
#
忍者は白目を剥いて痙攣する鈴猫からマラを引き抜いた[p]
#鈴猫
あうぅ・・・[p]
#
支えとなっていた肉棒を失い鈴猫はその場に崩折れる[r]
どろりと鈴猫の秘裂から精液がこぼれた[p]
#忍者
このままヤリ捨てるのは勿体ねえ上玉だな[r]
ねぐらまでお持ち帰りさせてもらおうか！！[p]
#
忍者はニヤリとほくそ笑むと鈴猫を担ぎ上げて意気揚々と闇の中へ消えていった[p]
ゲームオーバー（実際には忍者の住処へ続きます）
[s]
