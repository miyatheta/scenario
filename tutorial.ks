*ドローボーナスについて
;ドローしたカードの色に応じてボーナスが発生します[p]
;赤なら与ダメージアップ、青なら気力アップ[r]
;緑色なら回避アップ、黄色なら敵の守備力を下げます[p]
[eval exp="f.tutorial01 = 1"]
[return][s]

*目標値について
;コマンドを選択してください。
;コマンドのコストと守備力の合算が目標値になります[p]
[eval exp="f.tutorial02 = 1"]
[return][s]

*ドローについて
;2枚目のカードが表示されます[p]
[eval exp="f.tutorial03 = 1"]
[return][s]

*判定について
;目標値以上、上限値以下ならば判定成功です[p]
;判定成功であればコマンドの内容を実行[r]
;判定失敗であれば敵が攻撃を行います[p]
[eval exp="f.tutorial04 = 1"]
[return][s]

*攻撃について
;判定が場合、攻撃を行います[p]
[eval exp="f.tutorial05 = 1"]
[return][s]

*反撃について
;敵の攻撃の回避に成功した場合、反撃を行います[p]
[eval exp="f.tutorial05 = 1"]
[return][s]

*ドロー3について
;3枚目のカードが表示されます[p]
[eval exp="f.tutorial06 = 1"]
[return][s]

*ドロー4について
;4枚目のカードが表示されます[p]
[eval exp="f.tutorial07 = 1"]
[return][s]

*ドロー5について
;5枚目のカードが表示されます[p]
[eval exp="f.tutorial08 = 1"]
[return][s]
