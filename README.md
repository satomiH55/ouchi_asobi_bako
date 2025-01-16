# おうちあそび箱
![おうちあそび箱ロゴ](app/assets/images/logo_ouchiasobibako.png)

## 概要
「おうちあそび箱」は、親子のおうち遊びを共有できるSNSプラットフォームです。ユーザーは「遊びの名前」「対象年齢」「必要な道具」「手順」「写真」を投稿し、他のユーザーと情報交換を行います。投稿は「クリエイティブ系」「知育系」「運動系」の3つのカテゴリに分けられており、検索がしやすくなっています。

## サイトテーマ
子どもとのおうち遊びに関する情報を投稿・共有できるWebアプリケーション

## テーマを選んだ理由

### きっかけ
私は4歳の子どもを育てており、その子育て経験からこのテーマを選びました。特に、出産後の育児休業期間中、コロナ禍で外遊びが難しかったことがきっかけです。さらに、仕事復帰後も猛暑や悪天候でおうち遊びの機会が増え、役立つ情報を共有できる場が必要だと感じました。

### 問題点
おうち遊びは、子どもにとっては慣れた環境でストレスが少ない一方、マンネリ化しやすいという課題があります。SNSでおうち遊びに関する情報を探す際、検索機能が不十分なため、以下の問題が生じていました。
- 対象年齢に合わない情報が多い
- 必要な道具が多く、ハードルが高い情報が多い
- 必要な情報を見つけるのに時間がかかる

### 解決案
そのため、同じようにおうち遊びのアイデアを探しているパパやママたちが情報を共有できるサイトを作ろうと考えました。このサイトでは、遊びの内容、対象年齢、必要な道具を簡単に検索・参照できる仕組みを提供します。

## ターゲットユーザー
未就学児を育てているパパやママ。

## 主な利用シーン
- 子どもと楽しめるおうち遊びを探しているとき
- 他のユーザーと遊びのアイデアを共有・情報交換したいとき

## 利用方法
- ユーザー新規登録を行う、またはログインする
  <p><img src="app/assets/images/1_top.PNG" alt="トップページ" style="width: 100%; display: block; margin-bottom: 20px;"></p>
  <p><img src="app/assets/images/1_login.PNG" alt="ユーザー新規登録" style="width: 100%; display: block; margin-bottom: 20px;"></p>

- おうち遊びの手順等を写真とともに投稿
  <p><img src="app/assets/images/2_postnew.PNG" alt="おうち遊びの投稿" style="width: 100%; display: block; margin-bottom: 20px;"></p>

- 他のユーザーの投稿を閲覧し、気に入った投稿に「いいね」や「コメント」を残す
  <p><img src="app/assets/images/3_postshow.PNG" alt="他のユーザーの投稿" style="width: 100%; display: block; margin-bottom: 20px;"></p>

- キーワードやカテゴリ検索を使い、目的に合わせた投稿をチェック
  <p><img src="app/assets/images/4_postindex.PNG" alt="キーワードやカテゴリ検索" style="width: 100%; display: block; margin-bottom: 20px;"></p>

## 機能一覧
- 基本的なCRUD機能
- ユーザー認証機能（devise）
- 画像アップロード機能（Refile）
- いいね機能
- コメント機能
- フォローフォロワー機能
- ダイレクトメッセージ（DM）機能
- 下書き機能
- 検索機能
- 閲覧数表示機能
- バリデーション機能
- ページネーション機能
- レスポンシブ対応

## 開発環境
- OS：Windows 10 + Git Bash
- 言語：HTML、CSS、JavaScript、Ruby
- フレームワーク：Ruby on Rails
- JavaScriptライブラリ：jQuery
- データベース：PostgreSQL
