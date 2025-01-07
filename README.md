# Cloud Run Express Server

このプロジェクトは、TypeScriptとExpress.jsを使用したCloud Runサーバーアプリケーションです。

## 必要条件

- Node.js 18以上
- npm
- Docker
- Google Cloud SDK
- Make

## セットアップ手順

### 1. 初期セットアップ

```bash
# Google Cloudプロジェクトの設定
gcloud auth login
gcloud config set project YOUR_PROJECT_ID

# 依存関係のインストール
make setup

# 環境変数ファイルの初期化
make init-env
```

### 2. 環境変数の設定

1. `.env.gcloud.yml` ファイルを編集して必要な環境変数を設定します：

```yaml
KEY: "value"
ANOTHER_KEY: "another_value"
```

### 3. ローカル開発

```bash
# TypeScriptのビルド
make build

# ローカルサーバーの起動
make run
```

### 4. Dockerを使用したローカルテスト

```bash
# Dockerイメージのビルド
make docker-build

# Dockerコンテナの実行
make docker-run
```

サーバーは http://localhost:8080 で利用可能になります。

## デプロイ手順

### 1. 事前準備

以下のGoogle Cloud APIを有効化します：

```bash
# Cloud Run APIの有効化
gcloud services enable run.googleapis.com

# Cloud Build APIの有効化
gcloud services enable cloudbuild.googleapis.com
```

### 2. デプロイの実行

```bash
make deploy
```

デプロイが完了すると、Cloud RunのURLが表示されます。

## 主な機能

- Express.jsを使用したHTTPサーバー
- TypeScriptによる型安全な開発
- Docker化されたアプリケーション
- Cloud Runを使用したスケーラブルなデプロイ

## ファイル構成

- `src/index.ts` - メインのサーバーコード
- `Dockerfile` - コンテナ化の設定
- `cloudbuild.yaml` - Cloud Buildの設定
- `Makefile` - 開発とデプロイのコマンド
- `.env.gcloud.yml` - 環境変数の設定

## トラブルシューティング

### デプロイに失敗する場合

1. プロジェクトIDが正しく設定されているか確認：
```bash
gcloud config get-value project
```

2. 必要な権限が付与されているか確認：
```bash
gcloud projects get-iam-policy YOUR_PROJECT_ID
```

3. Cloud BuildのサービスアカウントにCloud Runのデプロイ権限があるか確認

### ローカルでの実行に問題がある場合

1. Node.jsのバージョンを確認：
```bash
node --version
```

2. 依存関係を再インストール：
```bash
rm -rf node_modules
make setup
```

## ライセンス

ISC
