*orgasm
#
[if exp="f.endure > 0" ]
「絶頂判定」[p]
[getrand min="0" max="100" var="f.rand"]
[eval exp="f.TAG = f.SAN * 2"]
目標値[emb exp="f.TAG"](目標値以下で成功)[r]
出目「[emb exp="f.rand"]」[p]
[endif]

[if exp="f.TAG >= f.rand && f.endure > 0" ]
;SAN値が出目より大きい場合ガード成功
[eval exp="f.orgasm = 0"]

[else]
[eval exp="f.orgasm = 1"]
[eval exp="f.orgasmpoint += 1"]
[endif]

[return]
[s]
