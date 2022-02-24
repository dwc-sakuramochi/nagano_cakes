# 🍰Nagano Cakes
長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発

## 背景
元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来るよう
になった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、管
理機能を含んだ通販サイトを開設しようと思い至った。

## デモ
#### 会員
![public_demo](https://user-images.githubusercontent.com/95151866/155552551-b31bd474-c8b3-4ec9-965e-69d37d67b9df.gif)

#### 管理者
![admin_demo2](https://user-images.githubusercontent.com/95151866/155552375-3bf8e01f-7438-4c79-81d8-e82852796fdf.gif)

## 設計
- [ER図](https://app.diagrams.net/#G1jzgKmh3rAeXWPnRoe-c8sVeRjCi9SwxP)
- [テーブル定義書](https://docs.google.com/spreadsheets/d/1U2Twmzcl0P_QNG6MWyoLdjYPeLKFXG0O7znQcjLAcrE/edit#gid=1373217982)
- [アプリケーション設計書](https://docs.google.com/spreadsheets/d/1RCCFGVIE_LtOO65SEo-uzJM1rI02wmMGEzf9ZdvqpxA/edit#gid=1053970370)

## 開発環境
- ruby 2.6.3
- rails 6.1.4

## 環境構築に必要な手順
### アプリケーション全体
```
$ git clone git@github.com:dwc-sakuramochi/nagano_cakes.git
```
```
$ cd nagano_cakes
```
```
$ bundle install
```
```
$ rails db:migrate
```
```
$ rails s
```

### 管理者
seedの読み込み
```
$ rails db:seed
```

### ログイン
📩:admin@admin</br>
🔑:testtest

## ![sakuramoti](https://user-images.githubusercontent.com/95151866/155551805-2a6b3c7b-3a8c-4c45-9b74-ba7580096820.jpeg) メンバー（チーム名：桜餅）
- はけさん
- ぐちさん
- ななさん
- のむさん