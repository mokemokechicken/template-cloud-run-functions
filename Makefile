.PHONY: setup build run deploy

# プロジェクトIDを設定
PROJECT_ID := $(shell gcloud config get-value project)

setup:
	@echo "🔧 Installing dependencies..."
	npm install

build:
	@echo "🏗️  Building application..."
	npm run build

run:
	@echo "🚀 Starting local server..."
	npm start

# ローカルでDockerを実行
docker-build:
	@echo "🐳 Building Docker image..."
	docker build -t gcr.io/$(PROJECT_ID)/hello-world .

docker-run:
	@echo "🐳 Running Docker container locally..."
	docker run -p 8080:8080 gcr.io/$(PROJECT_ID)/hello-world

# Cloud Runへのデプロイ
deploy: .env.gcloud.yml
	@echo "🚀 Deploying to Cloud Run..."
	gcloud builds submit --config cloudbuild.yaml

.env.gcloud.yml:
	make init-env

# 環境変数ファイルの作成
init-env:
	@echo "📝 Creating environment variables file..."
	@test -f .env.gcloud.yml || cp .env.gcloud.yml.sample .env.gcloud.yml
	@echo "Please edit .env.gcloud.yml with your environment variables"
