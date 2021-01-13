---
title: "Sapperで作ったアプリをGitHub ActionsでビルドしてGitHub Pagesで公開する"
date: 2021-01-11T23:35:51+09:00
categories: [tech]
tags: [Sapper, Svelte, GitHub Pages, GitHub Actions]
thumbnail: "images/avatar2020.jpg"
description: "Sapperで作ったアプリをGitHub ActionsでビルドしてGitHub Pagesで公開する手順"
draft: true

---

## 概要

Sapperで作ったアプリをGitHub ActionsでビルドしてGitHub Pagesで公開しようとした所、
BaseURLの設定周りで思ったよりハマってしまったので、記事にしておきます。

- [サンプルリポジトリ](https://github.com/tkancf/sapper-gh-pages-gh-actions)  
- [公開しているページ](https://tkancf.github.io/sapper-gh-pages-gh-actions/) (Sapperのデモアプリ)

## 実現したいこと

- アプリのexportはGitHub Actionsで実行する
- Sapperで作ったアプリをGitHub Pagesで公開する
    - 公開先のURLは `https://<username>.github.io/<repository name>/` とする

## 前提

- Sapper v0.28.10
- node v14.13.0

## 手順

## アプリを作成

今回は[公式ページ](https://sapper.svelte.dev/)に書いてあるテンプレートのアプリをデプロイしますので、
まずはテンプレートアプリをnpxでとってきます。

```bash
❯ npx degit "sveltejs/sapper-template#rollup" sapper-gh-pages-gh-actions
npx: installed 1 in 1.19s
> cloned sveltejs/sapper-template#rollup to sapper-gh-pages-gh-actions
❯ cd sapper-gh-pages-gh-actions
```

現在はTypeScriptがサポートされているので、せっかくですからTypeScriptを有効化しておきます。  
下記コマンドを実行するだけです。

```bash
❯ node scripts/setupTypeScript.js
Adding TypeScript with Rollup...
Converted to TypeScript.
```

`npm install` を実行後、 `npm run dev` を実行して、動作確認してみます。  
localhost:3000 をブラウザから開くと、ナイスガイが決めポーズをしている画像が表示されるはずです。

```bash
❯ npm install
.
.
```

※`npm install`長いので割愛してます。

```bash
❯ npm run dev

> TODO@0.0.1 dev /Users/tkancf/src/github.com/tkancf/sapper-gh-pages-gh-actions
> sapper dev

✔ server (2.7s)
✔ client (2.7s)
> Listening on http://localhost:3000
✔ service worker (576ms)
```

ここまでは [公式ページのGetting started](https://sapper.svelte.dev/docs#Getting_started) にも書いてある内容なので、
問題ないはずです。

## BaseURL の変更

公開したいページのURLが  
`https://<username>.github.io/<repository name>/` となります。  
末尾にサブディレクトリの形でリポジトリ名が入っており、今のアプリのままでは画像等が表示されません。

まずはアプリをこのURL形式に対応させます。変更箇所は以下の2箇所です。  
Gitのdiffを貼っておきます。各々のリポジトリ名に合わせて読み替えて下さい。

### `src/server.ts`

```diff
diff --git a/src/server.ts b/src/server.ts
index c77f593..085e55a 100644
--- a/src/server.ts
+++ b/src/server.ts
@@ -8,6 +8,7 @@ const dev = NODE_ENV === 'development';

 polka() // You can also use Express
        .use(
+               'sapper-gh-pages-gh-actions',
                compression({ threshold: 0 }),
                sirv('static', { dev }),
                sapper.middleware()
```

### `rollup.config.js`

```diff
diff --git a/rollup.config.js b/rollup.config.js
index b5f1b96..3999295 100644
--- a/rollup.config.js
+++ b/rollup.config.js
@@ -39,7 +39,7 @@ export default {
                        }),
                        url({
                                sourceDir: path.resolve(__dirname, 'src/node_modules/images'),
-                               publicPath: '/client/'
+                               publicPath: '/sapper-gh-pages-gh-actions/client/'
                        }),
                        resolve({
                                browser: true,
```

上記を追加した後、再度 `npm run dev` を実行すると、 `localhost:3000/<repository name>` がアプリのURLになっているはずです。

