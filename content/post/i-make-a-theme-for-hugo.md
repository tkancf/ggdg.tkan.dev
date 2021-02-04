---
title: "Hugoのテーマを自作したので、知見メモ"
date: 2021-01-31T22:12:56+09:00
categories: [tech]
tags: [Hugo, theme, blog]
thumbnail: "images/avatar2020.jpg"
description: "Hugoのテーマを自作したので、知見メモ"
draft: false

---

## 概要

Hugoのテーマは色々OSSのものがあるんですが、自分好みに自由できるテーマが欲しくなったので自作してみました。
そのときに得た知見のメモです。  
[作ったテーマは公開してます](https://github.com/tkancf/ggdg)が、現状自分のブログ用にハードコードしちゃってる部分があります。

## Tips

### テーマ自作のはじめ方

[hugoBasicExample](https://github.com/gohugoio/hugoBasicExample) というサンプル記事を予め用意してくれてるリポジトリがあるので、
このリポジトリをcloneして、`hugo new theme <テーマ名>` で見た目を確認しながら作ることが出来ます。  
ただ、このリポジトリは記事が全て英語なので、日本語の記事を自分で用意して、日本語フォントの様子を見たほうが良いです。

### Hugoのテンプレートで使える変数

基本的に[公式ドキュメント](https://gohugo.io/documentation/)を参考にします。例も充実しているので困ることはあまりないです。  
[Hugo Themes](https://themes.gohugo.io/) から、やりたいことを実現しているテーマを見つけて、そのソースを参考にするのも良いです。

### シンタックスハイライト

以前はhighlight.jsを導入するなどしてシンタックスハイライトしていたのですが、  
現在のHugoでは[Chroma](https://github.com/alecthomas/chroma)を利用してデフォルトでシンタックスハイライトが可能になっています。 ([v0.28](https://github.com/gohugoio/hugo/releases/tag/v0.28)以降)  
[サポートされている言語](https://github.com/alecthomas/chroma#supported-languages)も割と多いです。  
大したサイズではないですが、highlight.jsを読み込まなければそのぶん軽くなるので、言語のサポート率に不満がなければデフォルトのシンタックスハイライトに任せても良いと思います。

### その他

最後に参考リンク貼っておくので、リンク先を見るのが良いです。  
特に[Hugoのテーマを何個か作ったので知見をまとめてみる](https://blog.unresolved.xyz/how-to-make-of-hugo-theme)はめちゃくちゃ参考にさせて頂きました。  

## 参考Link

主に下記ページを参考にさせてもらいました。

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugoのテーマを何個か作ったので知見をまとめてみる](https://blog.unresolved.xyz/how-to-make-of-hugo-theme)
- [github.com/gohugoio/hugoBasicExample](https://github.com/gohugoio/hugoBasicExample)
