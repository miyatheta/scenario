;メッセージウィンドウの表示
@layopt layer=message0 visible=true
@layopt layer=2 visible=true
@layopt layer=3 visible=true

;----------------------------------------------------------------------------------------
;カード関係
;----------------------------------------------------------------------------------------
[macro name="DeckShuffle"]
DeckShuffle[p]
;Deckはシャッフルした山札（ただしカード自体ではなくカードの位置nの列。引き換え番号みたいなもの）
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
[macro name="show_scoreboad"]
[ptext layer="3" x="520" y="0" text=&f.round size="30" color="0xffffff" edge="red" bold="bold" align="left" name="Round" overwrite="true" ]
[ptext layer="3" x="550" y="0" text="回" size="30" color="0xffffff" edge="red" bold="bold" align="left" ]
[ptext layer="3" x="630" y="100" text="守備力：" size="30" color="0x333631" edge="white" bold="bold" align="left" ]
[ptext layer="3" x="630" y="140" text="コスト：" size="30" color="0x333631" edge="white" bold="bold" align="left" ]
[ptext layer="3" x="630" y="180" text="目標値：" size="30" color="0x333631" edge="white" bold="bold" align="left" ]
[ptext layer="3" x="630" y="220" text="上限値：" size="30" color="0x333631" edge="white" bold="bold" align="left" ]
[ptext layer="3" x="410" y="100" text="合計値：" size="30" color="0x333631" edge="white" bold="bold" align="left"]
[ptext layer="3" x="410" y="140" text="１手目：" size="30" color="0x333631" edge="white" bold="bold" align="left"]
[ptext layer="3" x="410" y="180" text="２手目：" size="30" color="0x333631" edge="white" bold="bold" align="left"]
[ptext layer="3" x="410" y="220" text="３手目：" size="30" color="0x333631" edge="white" bold="bold" align="left"]
[ptext layer="3" x="410" y="260" text="４手目：" size="30" color="0x333631" edge="white" bold="bold" align="left"]
[ptext layer="3" x="410" y="300" text="５手目：" size="30" color="0x333631" edge="white" bold="bold" align="left"]
[endmacro]

[macro name="show_scores"]
[eval exp="f.Target = f.En_DEF + f.comand"]
;コスト
[ptext layer="3" x="750" y="140" text=&f.comand size="30" color="0x333631" edge="white" bold="bold" align="left" name="comand" overwrite="true" ]
;目標値
[ptext layer="3" x="750" y="180" text=&f.Target size="30" color="0x333631" edge="white" bold="bold" align="left" name="target" overwrite="true" ]
;上限値
[ptext layer="3" x="750" y="220" text=&f.Limit size="30" color="0x333631" edge="white" bold="bold" align="left" name="limit" overwrite="true" ]
[endmacro]

[macro name="show_bind"]
[ptext layer="3" x="570" y="50" text=&f.En_BIND size="30" color="0x333631" edge="white" bold="bold" align="left" name="En_BIND" overwrite="true" ]
[endmacro]

;臨時マクロ
[macro name="status_update"]
[ptext layer="0" x="60" y="680" text=&f.HP size="20" color="0x000000" edge="white" bold="bold" align="left" name="HP" overwrite="true" ]
[ptext layer="0" x="900" y="10" text=&f.En_HP size="20" color="0x000000" edge="white" bold="bold" align="left" name="En_HP" overwrite="true" ]
[endmacro]
;--------------------------------------------------------------------------------
#
戦闘開始[p]
[eval exp="f.HP = 2000"]
[ptext layer="0" x="10" y="680" text="体力" size="20" color="0x000000" edge="white" bold="bold" align="left" name="" overwrite="true" ]
[ptext layer="0" x="60" y="680" text=&f.HP size="20" color="0x000000" edge="white" bold="bold" align="left" name="HP" overwrite="true" ]
[eval exp="f.En_HP = 10000"]
[ptext layer="0" x="850" y="10" text="体力" size="20" color="0x000000" edge="white" bold="bold" align="left" name="" overwrite="true" ]
[ptext layer="0" x="900" y="10" text=&f.En_HP size="20" color="0x000000" edge="white" bold="bold" align="left" name="En_HP" overwrite="true" ]
[eval exp="f.round=0"]

*Initialize_Cards
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
];
f.Deck = [];
n = f.Cards.length;
for( i=0 ; i<n ; i++){f.Deck.push(i);}
[endscript]

初回シャッフル
[DeckShuffle]

;--------------------------------------------------------------------------------

*ラウンド開始
[eval exp="f.round++"][show_scoreboad]
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
;守備力
[ptext layer="3" x="750" y="100" text=&f.En_DEF size="30" color="0x333631" edge="white" bold="bold" align="left" name="En_DEF" overwrite="true" ]
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
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x="450" y="600" text="&f.Cards[f.Hand[0]]['txt']" exp="tf.Draw1=f.Hand[0],f.Cards[f.Hand[0]]['active']=0" cond="f.Cards[f.Hand[0]]['active']>0" target="*コマンド選択" ]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="600" cond="f.Cards[f.Hand[1]]['active']>0" target="*ドロー１" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="600" cond="f.Cards[f.Hand[2]]['active']>0" target="*ドロー１" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="600" cond="f.Cards[f.Hand[3]]['active']>0" target="*ドロー１" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="600" cond="f.Cards[f.Hand[4]]['active']>0" target="*ドロー１" ]
[s]

*コマンド選択
[eval exp="f.Power = 0 + f.Cards[tf.Draw1]['value']"]
;合計値
[ptext layer="3" x="530" y="100" text=&f.Power size="30" color="0x333631" edge="white" bold="bold" align="left" name="Power" overwrite="true" ]
;１手目
[ptext layer="3" x="530" y="140" text="&f.Cards[f.Hand[0]]['txt']" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw1" overwrite="true" ]

コマンドを選択してください[p]
コマンドのコスト（カッコ内の数値）と守備力の合算が目標値になります[p]
[glink color="blue" x="550" y="300" text="拳(3)" exp="f.comand=3" target="*ドロー２" ]
[glink color="blue" x="550" y="350" text="下段蹴り(4)" exp="f.comand=4" target="*ドロー２" ]
[glink color="blue" x="550" y="400" text="回し蹴り(5)" exp="f.comand=5" target="*ドロー２" ]
[glink color="blue" x="550" y="450" text="踵落とし(6)" exp="f.comand=6" target="*ドロー２" ]
[glink color="blue" x="550" y="500" text="飛び蹴り(7)" exp="f.comand=7" target="*ドロー２" ]
[s]

*ドロー２
[eval exp="f.Limit=21"]
[show_scores]

２枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="600" exp="tf.Draw2=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*ドロー２完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="600" exp="tf.Draw2=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*ドロー２完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="600" exp="tf.Draw2=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*ドロー２完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="600" exp="tf.Draw2=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*ドロー２完了" ]
[s]

*ドロー２完了
２枚目のカードが表示されます[p]
[eval exp="f.Power = f.Power + f.Cards[tf.Draw2]['value']"]
[ptext layer="3" x="530" y="100" text=&f.Power size="30" color="0x333631" edge="white" bold="bold" align="left" name="Power" overwrite="true" ]
;２手目
[ptext layer="3" x="530" y="180" text="&f.Cards[tf.Draw2]['txt']" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw2" overwrite="true" ]

*判定１
[if exp="f.round < 2"]
目標値以上、上限値以下ならば判定成功です[p]
判定成功であればコマンドの内容を実行[p]
判定失敗であれば通常攻撃を実行します[p]
[endif]

[if exp="f.Target <= f.Power && f.Power <= f.Limit "]
判定成功[p]
[jump target="*コマンド実行"]
[elsif exp="f.Power > f.Limit "]
判定失敗[p]
[jump target="*バースト"]
[else]
目標未達[p]
[jump target="*通常攻撃１"]
[endif]
[s]

*通常攻撃１
装備の投擲武器による攻撃を行います[p]
[eval exp="f.En_HP -= 50"]
５０のダメージ[p]
上限値が＋１された[p]
[status_update]
[eval exp="f.Limit += 1"]
;上限値
[ptext layer="3" x="750" y="220" text=&f.Limit size="30" color="0x333631" edge="white" bold="bold" align="left" name="limit" overwrite="true" ]

*敵攻撃１
敵の攻撃！[p]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
鈴猫は敵の攻撃を回避した[p]
[jump target="*ドロー３"]
[endif]

[if exp="f.En_DEF <= 11"]
[eval exp="f.HP -= 150"]
１5０のダメージを受けた[p]
[elsif exp="f.En_DEF <= 12"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
敵のスキル使用[p]
「守備体勢」[p]
敵の守備力が＋１された[p]
[show_scores]
[eval exp="f.Target++ , f.En_DEF++"]
[elsif exp="f.En_DEF <= 13"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
[else]
[eval exp="f.HP -= 50"]
５０のダメージを受けた[p]
[endif]
[status_update]


*ドロー３
３枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="600" exp="tf.Draw3=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*ドロー３完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="600" exp="tf.Draw3=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*ドロー３完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="600" exp="tf.Draw3=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*ドロー３完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="600" exp="tf.Draw3=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*ドロー３完了" ]
[s]

*ドロー３完了
[if exp="f.round < 2"]３枚目のカードが表示されます[p]
[endif]
[eval exp="f.Power = f.Power + f.Cards[tf.Draw3]['value']"]
[ptext layer="3" x="530" y="100" text=&f.Power size="30" color="0x333631" edge="white" bold="bold" align="left" name="Power" overwrite="true" ]
;３手目
[ptext layer="3" x="530" y="220" text="&f.Cards[tf.Draw3]['txt']" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw3" overwrite="true" ]

*判定２
[if exp="f.Target <= f.Power && f.Power <= f.Limit "]
判定成功[p]
[jump target="*コマンド実行"]
[elsif exp="f.Power > f.Limit "]
判定失敗[p]
[jump target="*バースト"]
[else]
目標未達[p]
[jump target="*通常攻撃２"]
[endif]
[s]

*通常攻撃２
通常攻撃[p]
[eval exp="f.En_HP -= 50"]
５０のダメージ[p]
上限値が＋１された[p]
[status_update]
[eval exp="f.Limit += 1"]
;上限値
[ptext layer="3" x="750" y="220" text=&f.Limit size="30" color="0x333631" edge="white" bold="bold" align="left" name="limit" overwrite="true" ]

*敵攻撃２
敵の攻撃！[p]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
鈴猫は敵の攻撃を回避した[p]
[jump target="*ドロー４"]
[endif]

[if exp="f.En_DEF <= 11"]
[eval exp="f.HP -= 150"]
１5０のダメージを受けた[p]
[elsif exp="f.En_DEF <= 12"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
敵のスキル使用[p]
「守備体勢」[p]
敵の守備力が＋１された[p]
[eval exp="f.Target++ , f.En_DEF++"]
[elsif exp="f.En_DEF <= 13"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
[else]
[eval exp="f.HP -= 50"]
５０のダメージを受けた[p]
[endif]
[status_update]

*ドロー４
４枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="600" exp="tf.Draw4=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*ドロー４完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="600" exp="tf.Draw4=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*ドロー４完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="600" exp="tf.Draw4=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*ドロー４完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="600" exp="tf.Draw4=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*ドロー４完了" ]
[s]

*ドロー４完了
[if exp="f.round < 2"]４枚目のカードが表示されます[p]
[endif]
[eval exp="f.Power = f.Power + f.Cards[tf.Draw4]['value']"]
[ptext layer="3" x="530" y="100" text=&f.Power size="30" color="0x333631" edge="white" bold="bold" align="left" name="Power" overwrite="true" ]
;４手目
[ptext layer="3" x="530" y="260" text="&f.Cards[tf.Draw4]['txt']" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw4" overwrite="true" ]

*判定３
[if exp="f.Target <= f.Power && f.Power <= f.Limit "]
判定成功[p]
[jump target="*コマンド実行"]
[elsif exp="f.Power > f.Limit "]
判定失敗[p]
[jump target="*バースト"]
[else]
目標未達[p]
[jump target="*通常攻撃３"]
[endif]
[s]

*通常攻撃３
通常攻撃[p]
[eval exp="f.En_HP -= 50"]
５０のダメージ[p]
上限値が＋１された[p]
[status_update]
[eval exp="f.Limit += 1"]
;上限値
[ptext layer="3" x="750" y="220" text=&f.Limit size="30" color="0x333631" edge="white" bold="bold" align="left" name="limit" overwrite="true" ]

*敵攻撃３
敵の攻撃！[p]
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 50"]
鈴猫は敵の攻撃を回避した[p]
[jump target="*ドロー５"]
[endif]

[if exp="f.En_DEF <= 11"]
[eval exp="f.HP -= 150"]
１5０のダメージを受けた[p]
[elsif exp="f.En_DEF <= 12"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
敵のスキル使用[p]
「守備体勢」[p]
敵の守備力が＋１された[p]
[eval exp="f.Target++ , f.En_DEF++"]
[elsif exp="f.En_DEF <= 13"]
[eval exp="f.HP -= 100"]
１００のダメージを受けた[p]
[else]
[eval exp="f.HP -= 50"]
５０のダメージを受けた[p]
[endif]
[status_update]

*ドロー５
５枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="600" exp="tf.Draw5=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*ドロー５完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="600" exp="tf.Draw5=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*ドロー５完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="600" exp="tf.Draw5=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*ドロー５完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="600" exp="tf.Draw5=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*ドロー５完了" ]
[s]

*ドロー５完了
[if exp="f.round < 2"]５枚目のカードが表示されます[p]
[endif]
[eval exp="f.Power = f.Power + f.Cards[tf.Draw5]['value']"]
[ptext layer="3" x="530" y="100" text=&f.Power size="30" color="0x333631" edge="white" bold="bold" align="left" name="Power" overwrite="true" ]
;５手目
[ptext layer="3" x="530" y="300" text="&f.Cards[tf.Draw5]['txt']" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw5" overwrite="true" ]

*判定４
[if exp="f.Target <= f.Power && f.Power <= f.Limit "]
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
鈴猫の拳[p]
[eval exp="f.En_HP -= 100"]
１００のダメージ[p]
[status_update]
[jump target="*勝利判定" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド４
鈴猫の下段蹴り[p]
[eval exp="f.En_HP -= 200"]
２００のダメージ[p]
[status_update]
[jump target="*勝利判定" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド５
鈴猫の回し蹴り[p]
[eval exp="f.En_HP -= 300"]
３００のダメージ[p]
[status_update]
[jump target="*勝利判定" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド６
鈴猫の踵落とし[p]
[eval exp="f.En_HP -= 400"]
４００のダメージ[p]
[status_update]
[jump target="*勝利判定" cond="f.En_HP <= 0"]
[jump target="*ラウンド終了"]
[s]
*コマンド７
鈴猫の飛び蹴り[p]
[eval exp="f.En_HP -= 500"]
５００のダメージ[p]
[status_update]
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
[status_update]
[endif]
[jump target="*敗北判定" cond="f.HP <= 0"]
[jump target="*ラウンド終了"]
[s]

*ラウンド終了
今回、使用した札は[emb exp="f.Cards[f.Hand[0]]['txt']"]、
[emb exp="f.Cards[f.Hand[1]]['txt']"]、[emb exp="f.Cards[f.Hand[2]]['txt']"]、
[emb exp="f.Cards[f.Hand[3]]['txt']"]、[emb exp="f.Cards[f.Hand[4]]['txt']"]です[p]
[DeActivate]
[freeimage layer=3]
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
[freeimage layer=3]
[eval exp="f.comand = '' , f.Target = '' , f.Limit = ''"]
[eval exp="f.En_BIND = 200 "]

*拘束ラウンド開始
[show_scoreboad][show_bind]
[eval exp="f.En_DEF = 15 "]
;拘束力
[ptext layer="3" x="450" y="50" text="拘束力：" size="30" color="0x333631" edge="white" bold="bold" align="left"]
;守備力
[ptext layer="3" x="750" y="100" text=&f.En_DEF size="30" color="0x333631" edge="white" bold="bold" align="left" name="En_DEF" overwrite="true" ]
;手札作成
[eval exp="f.Hand=[f.Deck[0],f.Deck[1],f.Deck[2],f.Deck[3],f.Deck[4]]"]
[iscript]
f.Deck.splice(0,5);
[endscript]
#鈴猫
この！離しなさいよ！！[p]
#
*拘束ドロー１
[glink color="&f.Cards[f.Hand[0]]['color']" size="18" width="15" height="100" x="450" y="600" text="&f.Cards[f.Hand[0]]['txt']" exp="tf.Draw1=f.Hand[0],f.Cards[f.Hand[0]]['active']=0" cond="f.Cards[f.Hand[0]]['active']>0" target="*抵抗コマンド選択" ]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="600" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー１" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="600" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー１" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="600" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー１" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="600" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー１" ]
[s]
*抵抗コマンド選択
[eval exp="f.Power = 0 + f.Cards[tf.Draw1]['value']"]
;合計値
[ptext layer="3" x="530" y="100" text=&f.Power size="30" color="0x333631" edge="white" bold="bold" align="left" name="Power" overwrite="true" ]
;１手目
[ptext layer="3" x="530" y="140" text="&f.Cards[f.Hand[0]]['txt']" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw1" overwrite="true" ]
コマンドを選択してください[p]
[glink color="blue" x="550" y="350" text="暴れる(6)" exp="f.comand=6" target="*拘束ドロー２" ]
[glink color="blue" x="550" y="400" text="噛みつき(7)" exp="f.comand=7" target="*拘束ドロー２" ]
[glink color="blue" x="550" y="450" text="頭突(8)" exp="f.comand=8" target="*拘束ドロー２" ]
[glink color="blue" x="550" y="500" text="金的(9)" exp="f.comand=9" target="*拘束ドロー２" ]
[s]
*拘束ドロー２
[eval exp="f.Limit=21"][show_scores]
２枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="600" exp="tf.Draw2=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="600" exp="tf.Draw2=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="600" exp="tf.Draw2=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー２完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="600" exp="tf.Draw2=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー２完了" ]
[s]
*拘束ドロー２完了
[eval exp="f.Power = f.Power + f.Cards[tf.Draw2]['value']"]
[ptext layer="3" x="530" y="100" text=&f.Power size="30" color="0x333631" edge="white" bold="bold" align="left" name="Power" overwrite="true" ]
;２手目
[ptext layer="3" x="530" y="180" text="&f.Cards[tf.Draw2]['txt']" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw2" overwrite="true" ]
*拘束判定１
[if exp="f.Target <= f.Power && f.Power <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Power > f.Limit "]
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
[eval exp="f.En_BIND -= 20"]
拘束力が20減少[p]
上限値が＋１された[p]
[show_bind][status_update]
[eval exp="f.Limit += 1"]
[jump target="*脱出判定" cond="f.En_BIND <= 0"]
;上限値
[ptext layer="3" x="750" y="220" text=&f.Limit size="30" color="0x333631" edge="white" bold="bold" align="left" name="limit" overwrite="true" ]
*敵拘束攻撃１
#敵
へっ！！おとなしくしな！！[p]
#
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 60"]
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は２０の快感を受けた[p]
[else]
[eval exp="f.HP -= 10"]
敵の攻撃[r]
１０のダメージを受けた[p]
[status_update]
[endif]

*敵拘束ドロー３
３枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="600" exp="tf.Draw3=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="600" exp="tf.Draw3=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="600" exp="tf.Draw3=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー３完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="600" exp="tf.Draw3=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー３完了" ]
[s]
*拘束ドロー３完了
[eval exp="f.Power = f.Power + f.Cards[tf.Draw3]['value']"]
[ptext layer="3" x="530" y="100" text=&f.Power size="30" color="0x333631" edge="white" bold="bold" align="left" name="Power" overwrite="true" ]
;３手目
[ptext layer="3" x="530" y="220" text="&f.Cards[tf.Draw3]['txt']" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw3" overwrite="true" ]
*拘束判定２
[if exp="f.Target <= f.Power && f.Power <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Power > f.Limit "]
判定失敗[p]
[jump target="*拘束バースト"]
[else]
目標未達[p]
[jump target="*抵抗攻撃２"]
[endif]
[s]
*抵抗攻撃２
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.En_BIND -= 20"]
拘束力が20減少[p]
上限値が＋１された[p]
[show_bind][status_update]
[eval exp="f.Limit += 1"]
[jump target="*脱出判定" cond="f.En_BIND <= 0"]
;上限値
[ptext layer="3" x="750" y="220" text=&f.Limit size="30" color="0x333631" edge="white" bold="bold" align="left" name="limit" overwrite="true" ]
*敵拘束攻撃２
#敵
へっ！！おとなしくしな！！[p]
#
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 60"]
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は２０の快感を受けた[p]
[else]
[eval exp="f.HP -= 10"]
敵の攻撃[r]
１０のダメージを受けた[p]
[status_update]
[endif]
*拘束ドロー４
４枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="600" exp="tf.Draw4=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*拘束ドロー４完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="600" exp="tf.Draw4=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*拘束ドロー４完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="600" exp="tf.Draw4=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*拘束ドロー４完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="600" exp="tf.Draw4=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*拘束ドロー４完了" ]
[s]
*拘束ドロー４完了
[eval exp="f.Power = f.Power + f.Cards[tf.Draw4]['value']"]
[ptext layer="3" x="530" y="100" text=&f.Power size="30" color="0x333631" edge="white" bold="bold" align="left" name="Power" overwrite="true" ]
;４手目
[ptext layer="3" x="530" y="260" text="&f.Cards[tf.Draw4]['txt']" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw4" overwrite="true" ]
*拘束判定３
[if exp="f.Target <= f.Power && f.Power <= f.Limit "]
判定成功[p]
[jump target="*抵抗コマンド実行"]
[elsif exp="f.Power > f.Limit "]
判定失敗[p]
[jump target="*拘束バースト"]
[else]
目標未達[p]
[jump target="*抵抗攻撃３"]
[endif]
[s]
*抵抗攻撃３
鈴猫は拘束を振りほどこうともがいた[p]
[eval exp="f.En_BIND -= 20"]
拘束力が20減少[p]
上限値が＋１された[p]
[show_bind][status_update]
[eval exp="f.Limit += 1"]
[jump target="*脱出判定" cond="f.En_BIND <= 0"]
;上限値
[ptext layer="3" x="750" y="220" text=&f.Limit size="30" color="0x333631" edge="white" bold="bold" align="left" name="limit" overwrite="true" ]
*敵拘束攻撃３
#敵
へっ！！おとなしくしな！！[p]
#
[getrand min="1" max="100" var="f.rand"]
[if exp="f.rand < 60"]
敵は鈴猫の胸を揉みしだいた[p]
#鈴猫
あんっ！！[p]
#
鈴猫は２０の快感を受けた[p]
[else]
[eval exp="f.HP -= 10"]
敵の攻撃[r]
１０のダメージを受けた[p]
[status_update]
[endif]
*抵抗ドロー５
５枚目のカードを選択してください[p]
[glink color="&f.Cards[f.Hand[1]]['color']" size="18" width="15" height="100" x="550" y="600" exp="tf.Draw5=f.Hand[1],f.Cards[f.Hand[1]]['active']=0" cond="f.Cards[f.Hand[1]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="&f.Cards[f.Hand[2]]['color']" size="18" width="15" height="100" x="650" y="600" exp="tf.Draw5=f.Hand[2],f.Cards[f.Hand[2]]['active']=0" cond="f.Cards[f.Hand[2]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="&f.Cards[f.Hand[3]]['color']" size="18" width="15" height="100" x="750" y="600" exp="tf.Draw5=f.Hand[3],f.Cards[f.Hand[3]]['active']=0" cond="f.Cards[f.Hand[3]]['active']>0" target="*抵抗ドロー５完了" ]
[glink color="&f.Cards[f.Hand[4]]['color']" size="18" width="15" height="100" x="850" y="600" exp="tf.Draw5=f.Hand[4],f.Cards[f.Hand[4]]['active']=0" cond="f.Cards[f.Hand[4]]['active']>0" target="*抵抗ドロー５完了" ]
[s]
*抵抗ドロー５完了
[eval exp="f.Power = f.Power + f.Cards[tf.Draw5]['value']"]
[ptext layer="3" x="530" y="100" text=&f.Power size="30" color="0x333631" edge="white" bold="bold" align="left" name="Power" overwrite="true" ]
;５手目
[ptext layer="3" x="530" y="300" text="&f.Cards[tf.Draw5]['txt']" size="30" color="0x333631" edge="white" bold="bold" align="left" name="Draw4" overwrite="true" ]
*拘束判定４
[if exp="f.Target <= f.Power && f.Power <= f.Limit "]
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
[eval exp="f.En_BIND -= 40"]
拘束力が60減少[p]
[show_bind]
[jump target="*脱出判定" cond="f.En_BIND <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド７
鈴猫は噛み付いた[p]
[eval exp="f.En_BIND -= 80"]
拘束力が80減少[p]
[show_bind]
[jump target="*脱出判定" cond="f.En_BIND <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド８
鈴猫の頭突き[p]
[eval exp="f.En_BIND -= 120"]
拘束力が120減少[p]
[show_bind]
[jump target="*脱出判定" cond="f.En_BIND <= 0"]
[jump target="*拘束ラウンド継続"]
[s]
*抵抗コマンド９
鈴猫の金的[p]
[eval exp="f.En_BIND -= 200"]
拘束力が200減少[p]
[show_bind]
[jump target="*脱出判定" cond="f.En_BIND <= 0"]
[jump target="*拘束ラウンド継続"]
[s]

*脱出判定
鈴猫は拘束を振りほどいた！[p]
[jump target="*ラウンド終了"]
[s]

*拘束バースト
[getrand min="1" max="100" var="f.rand"]
#敵
敵は鈴猫の秘所を弄った[p]
#鈴猫
いやぁっ！！[p]
#
鈴猫は２００の快感を受けた[p]
[status_update]
;[jump target="*絶頂判定" cond="f.HP <= 0"]
[jump target="*拘束ラウンド継続"]
[s]

*拘束ラウンド継続
今回、使用した札は[emb exp="f.Cards[f.Hand[0]]['txt']"]、
[emb exp="f.Cards[f.Hand[1]]['txt']"]、[emb exp="f.Cards[f.Hand[2]]['txt']"]、
[emb exp="f.Cards[f.Hand[3]]['txt']"]、[emb exp="f.Cards[f.Hand[4]]['txt']"]です[p]
[DeActivate]
[ReShuffle]
[freeimage layer=3]
[jump target="*拘束ラウンド開始"]
[s]
