# Prisma

[Prisma Command Reference](https://www.prisma.io/docs/reference/api-reference/command-reference)

## Setup

### .env の作成

```
cp .env.dev .env
```

### DB 起動

```
docker compose up -d
```

### 依存パッケージのインストール

```
yarn
```

### Database 作成

```
yarn prisma:migrate
```

### 初期データ 作成

```
yarn prisma:seed
```

### PrismaClient などのアセットを生成

```
yarn prisma:generate
```
