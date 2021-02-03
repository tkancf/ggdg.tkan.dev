---
title: "Hugoのテーマを自作しました"
date: 2021-01-31T22:12:56+09:00
categories: [tech]
tags: [Hugo, theme, blog]
thumbnail: "images/avatar2020.jpg"
description: "Hugoのテーマを自作したので、メモ"
draft: true

---

## 概要

Hugoのテーマは色々OSSのものがあるんですが、自分好みに自由できるテーマが欲しくなったので自作してみました。  
その知見メモです。

## Tips

### テーマ自作のはじめ方

[github.com/gohugoio/hugoBasicExample](https://github.com/gohugoio/hugoBasicExample) というサンプル記事を予め用意してくれてるリポジトリがあるので、
このリポジトリをcloneして、`hugo new theme <テーマ名>` で見た目を確認しながら作ることが出来ます。  
ただ、このリポジトリは記事が全て英語なので、日本語の記事を自分で用意して、日本語フォントの様子を見たほうが良いです。

### シンタックスハイライト

以前は highlight.js を導入するなどしてシンタックスハイライトしていたのですが、
現在のHugoではChromaを利用してデフォルトでシンタックスハイライトが可能になっています。 ([v0.28](https://github.com/gohugoio/hugo/releases/tag/v0.28)以降)

## 参考

主に下記ページを参考にさせてもらいました。

- [Hugo Documentation](https://gohugo.io/documentation/)
- [学びノート - Hugoのテーマ作成のやり方](https://www.oio-blog.com/contents/%E3%83%86%E3%83%BC%E3%83%9E%E4%BD%9C%E6%88%90/)
- [Hugoのテーマを何個か作ったので知見をまとめてみる](https://blog.unresolved.xyz/how-to-make-of-hugo-theme)
- [github.com/ertuil/erblog/](https://github.com/ertuil/erblog/)
- [github.com/gohugoio/hugoBasicExample](https://github.com/gohugoio/hugoBasicExample)
