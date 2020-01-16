---
title: "Hugo で生HTMLを書く方法"
date: 2020-01-16T19:15:30+09:00
tags: "メモ"
thumbnail: "images/tn.png??"
description: "Hugo で生HTMLを書く"
draft: false
---

Hugoの記事内でTwitterの埋め込みなどをしたくなったとき、生のHTMLを使ってほしい時があったので対応方法を調べて導入した。

参考: [【HUGO】マークダウンの中にHTMLコードを書いて表示する方法](https://srbrnote.work/archives/2772)

HugoのThemeに `{{ .Innner }}` というショートコードを導入する必要があるらしい。

利用しているThemeをcloneして "layouts" フォルダ内に "rawhtml.html" というファイルを作成。  
ファイルに `{{ .Inner  }}` とだけ記載すると↓のように書くことで生HTMLが記事内で使えるようになった 🎉🎉

{{< rawhtml >}}
<code>
{{&lt; rawhtml &gt;}}
&lt;a href=&quot;/posts&quot;&gt;ほげほげ&lt;/a&gt;
{{&lt; /rawhtml &gt;}}
</code>
{{< /rawhtml >}}

------------

試しに去年最後の散財の様子を貼ってみる

{{< rawhtml >}}
<blockquote class="twitter-tweet"><p lang="ja" dir="ltr">（多分）今年最後の散財が届いた <a href="https://t.co/VtUgo4H3ia">pic.twitter.com/VtUgo4H3ia</a></p>&mdash; tkan (@tkancf) <a href="https://twitter.com/tkancf/status/1208281887912804352?ref_src=twsrc%5Etfw">December 21, 2019</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>
{{</ rawhtml >}}

いい感じだ
