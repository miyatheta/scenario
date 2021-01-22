*start
[bg storage="japanese04_morning.jpg" time="500"]


*select_event
[getrand min="1" max="100" var="f.event"]
[if exp="f.event<=20 && f.Pre_event != 1"]
[eval exp="f.Pre_event = 1"][jump target=*select_enemy]

[elsif exp="f.event<=40 && f.Pre_event != 2"]
[eval exp="f.Pre_event = 2"][jump target=*event_youkai]

[elsif exp="f.event<=60 && f.Pre_event != 3"]
[eval exp="f.Pre_event = 3"][jump target=*select_incident]

[else][jump target=*select_event]
[endif]

[s]
*talk_end
[jump storage="home.ks" target="*home_start"]
[s]


*talk01

*talk02
*talk03
*talk04
*talk05
*talk06
*talk07
