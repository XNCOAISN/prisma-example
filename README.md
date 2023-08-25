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

## SQL Log

```typescript
const user = await prisma.user.findUnique({
  where: { email: "alice@prisma.io" },
  include: {
    posts: true,
    profile: true,
  },
});

// Query: SELECT `dev`.`User`.`id`, `dev`.`User`.`email`, `dev`.`User`.`name` FROM `dev`.`User` WHERE `dev`.`User`.`email` = ? LIMIT ? OFFSET ?
// Params: ["alice@prisma.io",1,0]
// Query: SELECT `dev`.`Post`.`id`, `dev`.`Post`.`createdAt`, `dev`.`Post`.`updatedAt`, `dev`.`Post`.`title`, `dev`.`Post`.`content`, `dev`.`Post`.`published`, `dev`.`Post`.`authorId` FROM `dev`.`Post` WHERE `dev`.`Post`.`authorId` IN (?)
// Params: [1]
// Query: SELECT `dev`.`Profile`.`id`, `dev`.`Profile`.`bio`, `dev`.`Profile`.`userId` FROM `dev`.`Profile` WHERE `dev`.`Profile`.`userId` IN (?)
// Params: [1]
```