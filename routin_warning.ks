*start
;警戒度
[eval exp="f.warning += 10"]
[eval exp="f.warning = 100" cond="f.warning > 100"]
[if exp="f.warning >= 100"]
#
警戒度が上昇。警備態勢が強化された。[p]
[eval exp="f.security += 1" cond="f.security_MAX > f.security"]
[eval exp="f.warning = 0" cond="f.security_MAX > f.security"]
[endif]

[securitybar]
[return]
[s]
