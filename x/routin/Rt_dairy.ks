*start
;時間経過に伴う処理
[eval exp="f.date += 1"]
[eval exp="f.keibi -= 8"]
;アイテムの入荷処理
[iscript]
for(i=0;i<=9;i++){
  if(f.item[i]['used'] > 0){
    f.item[i]['cooltime'] -= 1;
  }
  if(f.item[i]['cooltime'] <= 0){
    f.item[i]['used'] = 0;
    f.item[i]['stock'] = 1;
    f.item[i]['cooltime'] = 7;
  }
}
[endscript]
[return]
dairy終了
[s]
