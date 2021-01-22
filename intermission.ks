*start
[clearstack  stack="call"  ]
;初回か？
[if exp="f.date==0" ]
[jump storage="data_story/St_1st_mission.ks"]
[endif]

;暗殺は発生するか？
[getrand min="1" max="75" var="f.rand"]
[if exp="f.keibi < f.rand"]
[jump storage="data_story/St_comon_guard01.ks"]
[endif]

;通常の朝会話へ
[jump storage="data_talk/talk.ks"]
[s]
